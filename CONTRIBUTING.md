# Contributing

Contributions are welcome! Here's how to add new MCPs, commands, or improve the docs.

---

## What You Can Contribute

- **New MCP server** — add config entry + detail section in `docs/MCP_DETAILS.md`
- **New slash command** — add `.md` file in `commands/` + section in `docs/COMMANDS.md`
- **Setup script improvements** — better error handling, new OS support
- **Documentation fixes** — typos, outdated info, clearer instructions
- **Troubleshooting entries** — issues you hit that others will too

---

## Adding a New MCP

1. Verify the npm package exists and works:
   ```bash
   npm install -g <package-name>
   ```

2. Add the entry to `config/claude_desktop_config.json` using placeholders:
   ```json
   "your-mcp-name": {
     "command": "node",
     "args": ["<NPM_MODULES_PATH>/package-name/dist/index.js"]
   }
   ```

3. Add a section to `docs/MCP_DETAILS.md` following the existing format:
   - What It Does
   - Why It's Included
   - Example Prompts (at least 3)
   - Config Entry

4. Update the MCP table in `README.md`

5. Update the npm install command in `setup.ps1` and `setup.sh`

---

## Adding a New Slash Command

1. Create `commands/your-command.md` following this structure:
   ```markdown
   # /your-command

   One sentence description.

   ## Steps

   1. Step one
   2. Step two
   ...
   ```

2. Add a section to `docs/COMMANDS.md` with:
   - What It Does
   - Dependencies (MCPs needed)
   - Usage examples (at least 3)

3. Update the commands table in `README.md`

---

## Guidelines

- **No personal data** — no real API keys, no personal paths, no usernames
- **Use placeholders** — `<USERNAME>`, `<NPM_MODULES_PATH>`, `<GITHUB_TOKEN>`, etc.
- **Test on a clean machine** if possible — or note which OS you tested on
- **Keep docs beginner-friendly** — assume no prior knowledge of MCPs
- **One thing per PR** — MCP additions, command additions, and doc fixes in separate PRs

---

## Pull Request Process

1. Fork the repo
2. Create a branch: `git checkout -b add-your-mcp-name`
3. Make your changes
4. Test the setup script if you changed it
5. Open a PR with a clear description of what you added and why
