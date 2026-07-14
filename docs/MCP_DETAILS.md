# MCP Server Details

> Every MCP server in this starter kit -- what it does, why it's included, how to use it, and example prompts.

---

## 1. memory

**Package:** `@modelcontextprotocol/server-memory` | **Free:** Yes

### What It Does
Persistent knowledge graph that survives across sessions. Claude remembers your preferences, project decisions, team names, and any context you save.

### Why It's Included
Every other tool works better when Claude knows your context. Memory is the foundation.

### Example Prompts
```
Remember that this project uses Supabase for auth and Cloudflare Pages for hosting
What do you know about my project?
Remember that I prefer functional components over class components in React
```

### Config Entry
```json
"memory": {
  "command": "node",
  "args": ["<NPM_MODULES_PATH>/@modelcontextprotocol/server-memory/dist/index.js"],
  "env": { "MEMORY_FILE_PATH": "<HOME>/Documents/Claude-Memory/memory.jsonl" }
}
```

---

## 2. filesystem

**Package:** `@modelcontextprotocol/server-filesystem` | **Free:** Yes

### What It Does
Read and write files on your local machine within allowed directories.

### Config Entry
```json
"filesystem": {
  "command": "node",
  "args": ["<NPM_MODULES_PATH>/@modelcontextprotocol/server-filesystem/dist/index.js", "<HOME>/Documents"]
}
```

---

## 3. github

**Package:** `@modelcontextprotocol/server-github` | **Requires:** GitHub PAT (`repo`, `read:org`, `read:user`)

### What It Does
Search repos, create issues, manage PRs, push files -- all from Claude chat.

### Config Entry
```json
"github": {
  "command": "node",
  "args": ["<NPM_MODULES_PATH>/@modelcontextprotocol/server-github/dist/index.js"],
  "env": { "GITHUB_PERSONAL_ACCESS_TOKEN": "<GITHUB_TOKEN>" }
}
```

---

## 4. playwright

**Package:** `@playwright/mcp` | **Free:** Yes

### What It Does
Controls a real browser -- navigate, click, screenshot, intercept network requests.

### Config Entry
```json
"playwright": {
  "command": "node",
  "args": ["<NPM_MODULES_PATH>/@playwright/mcp/cli.js"]
}
```

---

## 5. firecrawl

**Package:** `firecrawl-mcp` | **Free tier:** 500 credits/month | **Requires:** Firecrawl API key

### What It Does
Web scraping and search with full content extraction. Returns clean markdown, not raw HTML.

### Config Entry
```json
"firecrawl": {
  "command": "node",
  "args": ["<NPM_MODULES_PATH>/firecrawl-mcp/dist/index.js"],
  "env": { "FIRECRAWL_API_KEY": "<FIRECRAWL_API_KEY>" }
}
```

---

## 6. security-audit

**Package:** `mcp-security-audit` | **Free:** Yes

### What It Does
Scans `package.json` dependencies against the npm advisory database for CVEs.

### Config Entry
```json
"security-audit": {
  "command": "node",
  "args": ["<NPM_MODULES_PATH>/mcp-security-audit/build/index.js"]
}
```

---

## 7. semgrep

**Package:** `mcp-server-semgrep` | **Free:** Yes | **Requires:** `pip install semgrep`

### What It Does
Static code analysis -- OWASP Top 10, XSS, SQL injection, hardcoded secrets. Works across JS, TS, Python, Go, Java, and more.

### Windows Note
`semgrep.exe` installs to the Python Scripts directory. The `env.PATH` config entry fixes this.

### Config Entry
```json
"semgrep": {
  "command": "node",
  "args": ["<NPM_MODULES_PATH>/mcp-server-semgrep/build/index.js"],
  "env": { "PATH": "<PYTHON_SCRIPTS_PATH>;<PYTHON_PATH>;<SYSTEM_PATH>" }
}
```

---

## 8. desktop-commander

**Package:** `@wonderwhy-er/desktop-commander` | **Free:** Yes

### What It Does
Run terminal commands, manage files and processes from Claude chat.

### Config Entry
```json
"desktop-commander": {
  "command": "node",
  "args": ["<NPM_MODULES_PATH>/@wonderwhy-er/desktop-commander/dist/index.js"]
}
```

---

## 9. shadcn-ui

**Package:** `@jpisnice/shadcn-ui-mcp-server` | **Requires:** GitHub token

### What It Does
Direct access to shadcn/ui component source, docs, examples, themes, and blocks.

### Config Entry
```json
"shadcn-ui": {
  "command": "node",
  "args": ["<NPM_MODULES_PATH>/@jpisnice/shadcn-ui-mcp-server/build/index.js", "--github-api-key", "<GITHUB_TOKEN>"]
}
```

---

## 10. magicuidesign-mcp

**Package:** `@magicuidesign/mcp` | **Free:** Yes

### What It Does
Browse, search, and fetch components from the Magic UI library -- animated React components built on Framer Motion and Tailwind CSS.

### Config Entry
```json
"magicuidesign-mcp": {
  "command": "node",
  "args": ["<NPM_MODULES_PATH>/@magicuidesign/mcp/dist/server.js"]
}
```

---

## 11. 21st-dev-magic

**Package:** `@21st-dev/magic` | **Free tier:** limited generations | **Requires:** 21st.dev API key

### What It Does
AI-powered UI component generator. Describe a component and get production-quality React + Tailwind code.

### Config Entry
```json
"21st-dev-magic": {
  "command": "node",
  "args": ["<NPM_MODULES_PATH>/@21st-dev/magic/dist/index.js", "API_KEY=<21ST_DEV_API_KEY>"]
}
```

---

## 12. obsidian

**Package:** `mcp-obsidian` | **Free:** Yes | **Requires:** Obsidian installed with a vault

### What It Does
Read, search, create, and update notes in your Obsidian vault. Used by `/wrap-up` to save session notes.

### Setup
1. Install Obsidian from [obsidian.md](https://obsidian.md)
2. Create a vault and note the path to the folder containing `.obsidian/`
3. Add that path as `<OBSIDIAN_VAULT_PATH>`

### Config Entry
```json
"obsidian": {
  "command": "node",
  "args": ["<NPM_MODULES_PATH>/mcp-obsidian/dist/index.js", "<OBSIDIAN_VAULT_PATH>"]
}
```

---

## 13. gitnexus

**Package:** `gitnexus` | **Free:** Yes

### What It Does
AST-based code intelligence -- find all callers of a function, trace call graphs, list imports. Understands code structure rather than just searching text.

### Example Prompts
```
Find all functions that call getUserById
Which files import from the auth module?
What would break if I rename validateEmail?
```

### Config Entry
```json
"gitnexus": {
  "command": "node",
  "args": ["<NPM_MODULES_PATH>/gitnexus/dist/cli/index.js", "mcp"]
}
```
