# Claude MCP Starter Kit

> A production-ready starter kit for Claude Desktop and Claude Code — pre-configured MCP servers, global slash commands, and a one-command setup script.

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20macOS-lightgrey.svg)
![Claude](https://img.shields.io/badge/Claude-Desktop%20%2B%20Code-orange.svg)

---

## What Is This?

This starter kit gives you a fully configured Claude Desktop + Claude Code environment out of the box:

- **13 MCP servers** — memory, filesystem, GitHub, browser automation, web scraping, security scanning, UI components, code intelligence, and more
- **6 global slash commands** — `/audit`, `/ui-add`, `/ui-fix`, `/ui-section`, `/ui-theme`, `/wrap-up`
- **7 web connectors** — Canva, Context7, GitHub, Sentry, Supabase, Tavily, Vercel
- **One setup script** — installs everything on a new machine in minutes

---

## What You Get

### MCP Servers (13 total)

| MCP | Purpose |
|-----|---------|
| `memory` | Persistent knowledge graph across all sessions |
| `filesystem` | Read/write files in allowed directories |
| `github` | Search repos, manage issues and PRs |
| `playwright` | Browser automation and UI testing |
| `firecrawl` | Web scraping and search with full content |
| `security-audit` | Scan npm dependencies for CVEs |
| `semgrep` | Static code analysis — OWASP Top 10, XSS, SQL injection |
| `desktop-commander` | Run terminal commands, manage processes |
| `shadcn-ui` | Access shadcn/ui component docs and examples |
| `magicuidesign-mcp` | Browse and install Magic UI components |
| `21st-dev-magic` | AI-powered UI component generator |
| `obsidian` | Read and write to your Obsidian vault |
| `gitnexus` | AST-based code intelligence — call graphs, imports, structure |

### Slash Commands (6 total)

| Command | Purpose |
|---------|---------|
| `/audit` | Full security audit — CVE scan + OWASP static analysis |
| `/ui-add` | Add a Magic UI component to the current project |
| `/ui-fix` | Debug and fix UI/build issues |
| `/ui-section` | Build a complete page section with animations |
| `/ui-theme` | Change colors, fonts, dark mode tokens |
| `/wrap-up` | End-of-session save — chat transcript + memory + Obsidian note |

---

## Quick Start

### Windows

```powershell
git clone https://github.com/sherazbuilds/claude-mcp-starter-kit
cd claude-mcp-starter-kit
./setup.ps1
```

### macOS / Linux

```bash
git clone https://github.com/sherazbuilds/claude-mcp-starter-kit
cd claude-mcp-starter-kit
chmod +x setup.sh
./setup.sh
```

The script will:
1. Install all npm packages globally
2. Copy config files to the correct locations
3. Prompt you for API keys
4. Create required folders
5. Verify the installation

---

## Prerequisites

| Tool | Version | Required For |
|------|---------|-------------|
| Node.js | 18+ LTS | All npm-based MCPs |
| Python | 3.10+ | semgrep MCP |
| Claude Desktop | Latest | MCP servers |
| Claude Code CLI | Latest | Slash commands |
| Git | Any | Cloning this repo |

---

## API Keys Required

| Service | Free? | Used By | Get Key |
|---------|-------|---------|---------|
| GitHub Personal Access Token | Free | `github` MCP, `shadcn-ui` MCP | [github.com/settings/tokens](https://github.com/settings/tokens) |
| Firecrawl API Key | Free tier | `firecrawl` MCP | [firecrawl.dev](https://firecrawl.dev) |
| 21st.dev API Key | Free tier | `21st-dev-magic` MCP | [21st.dev](https://21st.dev) |

---

## Documentation

- [Full Setup Guide](docs/SETUP.md) — Step-by-step installation with screenshots
- [MCP Server Details](docs/MCP_DETAILS.md) — Every MCP explained with examples
- [Slash Commands Guide](docs/COMMANDS.md) — Every command with usage examples
- [Web Connectors Guide](docs/CONNECTORS.md) — Setting up cloud connectors
- [Use Cases](docs/USE_CASES.md) — Real workflows and what you can build
- [Troubleshooting](docs/TROUBLESHOOTING.md) — Common issues and fixes

---

## Manual Setup

If you prefer not to use the setup script, see the [Full Setup Guide](docs/SETUP.md).

---

## Contributing

Contributions are welcome! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## License

MIT — see [LICENSE](LICENSE)
