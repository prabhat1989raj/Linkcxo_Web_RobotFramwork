"""
generate_clean_report.py

Generates a clean, easy-to-read custom HTML report from a Robot Framework
output.xml file. Unlike the default report.html, this shows every keyword,
its arguments/parameters, and status in a simple readable table -- good for
sharing with non-technical stakeholders or for quick debugging.

USAGE:
    python generate_clean_report.py <path-to-output.xml> [output-html-path]

EXAMPLE:
    python generate_clean_report.py Results\output.xml Results\clean_report.html

REQUIREMENTS:
    pip install robotframework
"""

import sys
import html
from pathlib import Path
from robot.api import ExecutionResult, ResultVisitor


class CleanReportBuilder(ResultVisitor):
    """Walks the Robot Framework result tree and collects readable data."""

    def __init__(self):
        self.suites = []          # list of suite dicts
        self._suite_stack = []
        self._test_stack = []

    # ---- Suites ----
    def start_suite(self, suite):
        suite_data = {
            "name": suite.name,
            "doc": suite.doc,
            "tests": [],
        }
        self.suites.append(suite_data)
        self._suite_stack.append(suite_data)

    def end_suite(self, suite):
        self._suite_stack.pop()

    # ---- Tests ----
    def start_test(self, test):
        test_data = {
            "name": test.name,
            "doc": test.doc,
            "tags": list(test.tags),
            "status": test.status,
            "message": test.message,
            "elapsed": test.elapsedtime / 1000.0,  # seconds
            "keywords": [],
        }
        self._suite_stack[-1]["tests"].append(test_data)
        self._test_stack.append(test_data)

    def end_test(self, test):
        self._test_stack.pop()

    # ---- Keywords (steps) ----
    def start_keyword(self, keyword):
        if not self._test_stack:
            return  # skip suite setup/teardown keywords for simplicity
        kw_data = {
            "name": keyword.name,
            "args": list(keyword.args),
            "status": keyword.status,
            "message": _first_message(keyword),
            "elapsed": keyword.elapsedtime / 1000.0,
        }
        self._test_stack[-1]["keywords"].append(kw_data)


def _first_message(keyword):
    """Grab the first non-empty log message under a keyword, if any."""
    try:
        for msg in keyword.messages:
            if msg.message:
                return msg.message
    except AttributeError:
        pass
    return ""


STATUS_COLORS = {
    "PASS": "#1e8e3e",
    "FAIL": "#d93025",
    "SKIP": "#f9ab00",
    "NOT RUN": "#9aa0a6",
}


def render_html(suites, source_file):
    total_tests = sum(len(s["tests"]) for s in suites)
    passed = sum(1 for s in suites for t in s["tests"] if t["status"] == "PASS")
    failed = sum(1 for s in suites for t in s["tests"] if t["status"] == "FAIL")
    skipped = total_tests - passed - failed

    parts = []
    parts.append(f"""<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>LinkCXO - Clean Test Report</title>
<style>
  :root {{
    --bg: #0f1115;
    --card: #171a21;
    --border: #2a2e37;
    --text: #e6e6e6;
    --muted: #9aa0a6;
    --accent: #4f8cff;
  }}
  * {{ box-sizing: border-box; }}
  body {{
    font-family: "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
    background: var(--bg);
    color: var(--text);
    margin: 0;
    padding: 24px;
  }}
  h1 {{ margin: 0 0 4px 0; font-size: 22px; }}
  .subtitle {{ color: var(--muted); font-size: 13px; margin-bottom: 20px; }}
  .summary {{
    display: flex;
    gap: 12px;
    margin-bottom: 24px;
    flex-wrap: wrap;
  }}
  .stat {{
    background: var(--card);
    border: 1px solid var(--border);
    border-radius: 10px;
    padding: 14px 20px;
    min-width: 120px;
  }}
  .stat .num {{ font-size: 24px; font-weight: 700; }}
  .stat .label {{ color: var(--muted); font-size: 12px; text-transform: uppercase; letter-spacing: .04em; }}
  .stat.pass .num {{ color: {STATUS_COLORS['PASS']}; }}
  .stat.fail .num {{ color: {STATUS_COLORS['FAIL']}; }}
  .stat.skip .num {{ color: {STATUS_COLORS['SKIP']}; }}
  .suite {{
    background: var(--card);
    border: 1px solid var(--border);
    border-radius: 12px;
    margin-bottom: 18px;
    overflow: hidden;
  }}
  .suite-header {{
    padding: 14px 18px;
    font-weight: 600;
    font-size: 15px;
    border-bottom: 1px solid var(--border);
  }}
  .test {{
    border-bottom: 1px solid var(--border);
  }}
  .test:last-child {{ border-bottom: none; }}
  .test-header {{
    display: flex;
    align-items: center;
    gap: 10px;
    padding: 12px 18px;
    cursor: pointer;
    user-select: none;
  }}
  .test-header:hover {{ background: #1d212b; }}
  .badge {{
    display: inline-block;
    padding: 2px 10px;
    border-radius: 20px;
    font-size: 11px;
    font-weight: 700;
    letter-spacing: .03em;
    color: #fff;
  }}
  .test-name {{ font-weight: 600; }}
  .test-meta {{ color: var(--muted); font-size: 12px; margin-left: auto; }}
  .tags {{ color: var(--accent); font-size: 11px; }}
  .kw-table {{
    width: 100%;
    border-collapse: collapse;
    display: none;
  }}
  .test.open .kw-table {{ display: table; }}
  .kw-table th, .kw-table td {{
    text-align: left;
    padding: 8px 18px;
    font-size: 13px;
    border-top: 1px solid var(--border);
    vertical-align: top;
  }}
  .kw-table th {{
    background: #12151b;
    color: var(--muted);
    font-weight: 600;
    text-transform: uppercase;
    font-size: 11px;
    letter-spacing: .04em;
  }}
  .kw-name {{ font-family: Consolas, monospace; }}
  .kw-args {{ font-family: Consolas, monospace; color: #9dd3ff; white-space: pre-wrap; }}
  .kw-status {{ font-weight: 700; }}
  .msg {{ color: var(--muted); font-size: 12px; margin-top: 20px; padding: 12px 18px;
          background: var(--card); border: 1px solid var(--border); border-radius: 10px; }}
  .toggle-icon {{ transition: transform .15s; }}
  .test.open .toggle-icon {{ transform: rotate(90deg); }}
</style>
</head>
<body>
<h1>LinkCXO &mdash; Test Execution Report</h1>
<div class="subtitle">Generated from {html.escape(str(source_file))}</div>

<div class="summary">
  <div class="stat"><div class="num">{total_tests}</div><div class="label">Total Tests</div></div>
  <div class="stat pass"><div class="num">{passed}</div><div class="label">Passed</div></div>
  <div class="stat fail"><div class="num">{failed}</div><div class="label">Failed</div></div>
  <div class="stat skip"><div class="num">{skipped}</div><div class="label">Skipped</div></div>
</div>
""")

    for suite in suites:
        if not suite["tests"]:
            continue
        parts.append(f'<div class="suite">')
        parts.append(f'<div class="suite-header">{html.escape(suite["name"])}</div>')

        for i, test in enumerate(suite["tests"]):
            color = STATUS_COLORS.get(test["status"], "#888")
            tags_str = ", ".join(test["tags"]) if test["tags"] else ""
            parts.append(f'<div class="test" id="test-{id(test)}">')
            parts.append(
                f'<div class="test-header" onclick="this.parentElement.classList.toggle(\'open\')">'
                f'<span class="toggle-icon">&#9656;</span>'
                f'<span class="badge" style="background:{color}">{test["status"]}</span>'
                f'<span class="test-name">{html.escape(test["name"])}</span>'
            )
            if tags_str:
                parts.append(f'<span class="tags">[{html.escape(tags_str)}]</span>')
            parts.append(
                f'<span class="test-meta">{test["elapsed"]:.2f}s &middot; {len(test["keywords"])} steps</span>'
                f'</div>'
            )

            parts.append('<table class="kw-table"><thead><tr>'
                          '<th style="width:4%">#</th>'
                          '<th style="width:26%">Step (Keyword)</th>'
                          '<th style="width:34%">Parameters</th>'
                          '<th style="width:10%">Status</th>'
                          '<th style="width:8%">Time (s)</th>'
                          '<th style="width:18%">Message</th>'
                          '</tr></thead><tbody>')
            for idx, kw in enumerate(test["keywords"], start=1):
                kcolor = STATUS_COLORS.get(kw["status"], "#888")
                args_str = ", ".join(kw["args"]) if kw["args"] else "&mdash;"
                msg = html.escape(kw["message"])[:200] if kw["message"] else ""
                parts.append(
                    f'<tr>'
                    f'<td>{idx}</td>'
                    f'<td class="kw-name">{html.escape(kw["name"])}</td>'
                    f'<td class="kw-args">{html.escape(args_str) if kw["args"] else args_str}</td>'
                    f'<td class="kw-status" style="color:{kcolor}">{kw["status"]}</td>'
                    f'<td>{kw["elapsed"]:.2f}</td>'
                    f'<td>{msg}</td>'
                    f'</tr>'
                )
            parts.append('</tbody></table>')

            if test["status"] == "FAIL" and test["message"]:
                parts.append(f'<div class="msg" style="margin:0 18px 12px 18px;">'
                              f'<strong>Failure reason:</strong> {html.escape(test["message"])}</div>')

            parts.append('</div>')  # .test

        parts.append('</div>')  # .suite

    parts.append("""
<script>
  // Auto-expand any failing tests so issues are visible immediately.
  document.querySelectorAll('.test').forEach(function (t) {
    var badge = t.querySelector('.badge');
    if (badge && badge.textContent.trim() === 'FAIL') {
      t.classList.add('open');
    }
  });
</script>
</body>
</html>""")

    return "".join(parts)


def main():
    if len(sys.argv) < 2:
        print("Usage: python generate_clean_report.py <output.xml> [report.html]")
        sys.exit(1)

    xml_path = Path(sys.argv[1])
    if not xml_path.exists():
        print(f"ERROR: {xml_path} not found.")
        sys.exit(1)

    out_path = Path(sys.argv[2]) if len(sys.argv) > 2 else xml_path.parent / "clean_report.html"

    result = ExecutionResult(str(xml_path))
    builder = CleanReportBuilder()
    result.visit(builder)

    html_content = render_html(builder.suites, xml_path)
    out_path.write_text(html_content, encoding="utf-8")

    print(f"Clean report written to: {out_path.resolve()}")


if __name__ == "__main__":
    main()