# Troubleshooting

> Common issues and how to fix them.

---

## MCP Issues

### "Could not attach to MCP server"

**Cause:** Claude Desktop can't find the npm package at the specified path.

**Fix:**
```bash
npm list -g <package-name>   # verify it's installed
npm root -g                  # find your actual path
```
Update the path in `claude_desktop_config.json` and restart Claude Desktop.

---

### MCP shows as "Disconnected" after restart

1. Open Claude Desktop -> Settings -> Developer -> click the disconnected MCP
2. Read the error message
3. Fix the config entry (usually a wrong path or missing API key)
4. Restart Claude Desktop

---

### semgrep MCP disconnecting (Windows)

**Cause:** `semgrep.exe` is in the Python Scripts folder which isn't in Claude Desktop's PATH.

**Fix:** Add `env.PATH` to the semgrep config entry:
```json
"semgrep": {
  "command": "node",
  "args": ["...mcp-server-semgrep/build/index.js"],
  "env": {
    "PATH": "C:\\Users\\<USERNAME>\\AppData\\Local\\Programs\\Python\\Python312\\Scripts;C:\\Users\\<USERNAME>\\AppData\\Local\\Programs\\Python\\Python312;C:\\Windows\\system32;C:\\Windows"
  }
}
```

---

### Claude Desktop starts slowly

**Cause:** MCP entries using `npx -y` download packages on every restart.

**Fix:** All MCPs in this kit use `node` with direct global paths. If you added a custom MCP with `npx`, switch to global install:
```bash
npm install -g <package-name>
```

---

## Slash Command Issues

### "/audit -- Unknown command"

The command file is missing from `~/.claude/commands/`.

```bash
# Windows
dir %USERPROFILE%\.claude\commands\
copy commands\audit.md %USERPROFILE%\.claude\commands\

# macOS / Linux
ls ~/.claude/commands/
cp commands/audit.md ~/.claude/commands/
```

---

### Slash commands work in Claude Code but not Claude Desktop

Expected behavior. Commands in `~/.claude/commands/` are for **Claude Code CLI only**.

---

## Obsidian Issues

### Notes saved but not visible in Obsidian

The file was saved outside the vault directory.

**Fix:** Find your vault: the folder containing a `.obsidian/` subfolder. Update `<OBSIDIAN_VAULT_PATH>` to point to that exact folder. Restart Claude Desktop.

---

### "Path outside allowed directories" when saving to Obsidian

Add your vault path to `~/.claude/settings.json`:
```json
{
  "permissions": {
    "additionalDirectories": [
      "/path/to/your/obsidian/vault",
      "~/Documents/Claude-Chats",
      "~/Documents/Claude-Memory"
    ]
  }
}
```

---

## API Key Issues

### "Authentication failed" for GitHub MCP

Token expired or missing scopes. Generate a new token at [github.com/settings/tokens](https://github.com/settings/tokens) with `repo`, `read:org`, `read:user` scopes.

---

### Firecrawl returns "Unauthorized"

Generate a new key at firecrawl.dev -> Dashboard -> API Keys. Replace in config, restart Claude Desktop.

---

## Windows-Specific Issues

### Emoji causing encoding errors in .md files

Windows uses cp1252 encoding which can't encode emoji. Use plain text only in `.md` command files.

---

### "ENOENT" error for any MCP

The path in config doesn't exist.

```powershell
npm root -g
Test-Path "C:\Users\<USERNAME>\AppData\Roaming\npm\node_modules\<package>\dist\index.js"
```

If missing, reinstall: `npm install -g <package-name>`

---

## Getting Help

Open an [issue](https://github.com/syedsherazali021/claude-mcp-starter-kit/issues) with:
- Your OS and version
- The MCP or command that's failing
- The exact error message
- Your config entry (API keys removed)
