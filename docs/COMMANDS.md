# Slash Commands Guide

> Every slash command included in this starter kit -- what it does, dependencies, and usage examples.

Slash commands live in `~/.claude/commands/` and are available in every **Claude Code CLI** session. They are project-agnostic -- each command auto-detects the current project structure.

---

## 1. /audit

**Depends on:** `security-audit` MCP, `semgrep` MCP

Runs a full two-layer security audit:
- **Layer 1:** Dependency CVE scan via security-audit MCP
- **Layer 2:** Static code analysis via semgrep (OWASP Top 10, hardcoded secrets, XSS, SQL injection)

```
/audit
```

No arguments needed. Use before every PR, after adding dependencies, or before deploying.

---

## 2. /ui-add

**Depends on:** `magicuidesign-mcp` MCP

Adds a single Magic UI or Aceternity UI component. Auto-detects framework, component folder, and file extension.

```
/ui-add <description>
```

Examples:
```
/ui-add marquee of company logos
/ui-add blur fade text animation for headings
/ui-add animated gradient button with shimmer effect
/ui-add number ticker counter
/ui-add orbiting circles around a center logo
```

---

## 3. /ui-fix

**Depends on:** Nothing -- reads and edits project files directly

Debugs and fixes UI or build problems. Identifies root cause, applies fix, verifies with clean build.

```
/ui-fix <description of the problem>
```

Examples:
```
/ui-fix framer-motion hook error "useMotionValue is not a function"
/ui-fix tailwind classes not applying in production build
/ui-fix CSS variable --primary is undefined in dark mode
/ui-fix duplicate React instance causing hooks to fail
```

Common fixes handled:
- Duplicate React -- adds `resolve.dedupe` to vite.config.js
- Tailwind classes missing -- fixes content glob in tailwind.config.js
- CSS variable undefined -- checks all theme blocks in globals.css

---

## 4. /ui-section

**Depends on:** `magicuidesign-mcp` MCP

Builds a complete page section -- layout, animations, Magic UI components, theme integration. More powerful than `/ui-add` (builds a whole section, not just one component).

```
/ui-section <description>
```

Examples:
```
/ui-section hero with animated gradient headline and CTA buttons
/ui-section testimonials with animated cards and star ratings
/ui-section pricing table with monthly/yearly toggle
/ui-section features grid with icons, animated on scroll
/ui-section FAQ accordion with smooth expand/collapse
```

---

## 5. /ui-theme

**Depends on:** Nothing -- reads and edits CSS/config files directly

Changes color palette, typography, or dark mode tokens. Updates ALL theme blocks:
- `:root` (light default)
- `@media (prefers-color-scheme: dark)` (OS dark preference)
- `[data-theme="dark"]` and `[data-theme="light"]` (manual toggles)

```
/ui-theme <description>
```

Examples:
```
/ui-theme change accent color to electric blue
/ui-theme switch to dark minimal palette with deep navy backgrounds
/ui-theme update body font to Inter and heading font to Cal Sans
/ui-theme make the brand color purple-violet gradient
```

---

## 6. /wrap-up

**Depends on:** `filesystem` MCP, `memory` MCP, `obsidian` MCP (optional)

End-of-session command. Three saves in one:

1. **Chat transcript** -> `~/Documents/Claude-Chats/<ProjectName>_YYYY-MM-DD.txt`
2. **Memory graph entity** -> persistent across all future sessions
3. **Obsidian note** -> `<VAULT>/Sessions/YYYY-MM-DD -- ProjectName.md`

All three are append-safe -- if today's file exists, a new session block is added, never overwritten.

```
/wrap-up
```

Run at the end of every session.

---

## Typical workflow

```bash
# Work on your project...

/ui-add animated hero background
/ui-fix build error after adding framer-motion
/audit
/wrap-up
```
