Run a comprehensive security audit on the current project. Follow these steps:

## Step 1: Discover project structure
- Check for package.json, requirements.txt, pyproject.toml
- Identify frontend folders (src/, app/, components/, pages/)
- Identify backend folders (server/, api/, routes/, controllers/)
- Note the framework (React, Next.js, Express, FastAPI, etc.)

## Step 2: Scan npm dependencies
Use the security-audit MCP tool `audit_nodejs_dependencies` to scan for known CVEs in npm packages.
If unavailable, run: `npm audit --json` via terminal and parse the output.

## Step 3: Scan source code with semgrep
Use the semgrep MCP tool `scan_directory` to detect:
- OWASP Top 10 vulnerabilities (XSS, SQL injection, path traversal, etc.)
- Hardcoded secrets, API keys, passwords in code
- Insecure authentication patterns
- Open redirects and insecure configurations

## Step 4: Output a structured report

Use this exact format:

---

# Security Audit Report
**Project:** [detected project name]
**Date:** [today's date]
**Scanned:** [what was scanned]

## Summary
| Severity | Count |
|----------|-------|
| CRITICAL | N |
| HIGH     | N |
| MEDIUM   | N |
| LOW      | N |
| **TOTAL**| N |

## CRITICAL Issues
[If none: "No critical issues found."]

### [Issue Title]
- **Type:** Dependency vulnerability / Code issue
- **Location:** `file/path:line` or `package-name@version`
- **CVE:** CVE-XXXX-XXXX (if applicable)
- **Description:** What the issue is and why it is dangerous
- **Fix:** Exact command or code change to resolve it

## HIGH Issues
[Same structure as above]

## MEDIUM Issues
[Same structure as above]

## LOW / Informational
[Condensed list]

## What Looks Good
List positive security signals (HTTPS enforced, env vars used, no hardcoded secrets, etc.)

## Recommended Next Steps
Prioritized action list -- what to fix first and why.

---

**Rules:**
- Only report real findings from the tools -- never hallucinate issues
- If a tool returns no issues, say so explicitly (good news!)
- If a tool is unavailable, note it in the report header
- Always include exact fix commands (npm audit fix, npm install pkg@version, etc.)
