# Full Setup Guide

> Complete step-by-step installation for Claude MCP Starter Kit on Windows and macOS.

---

## Table of Contents

1. [System Requirements](#1-system-requirements)
2. [Install Prerequisites](#2-install-prerequisites)
3. [Clone This Repo](#3-clone-this-repo)
4. [Run the Setup Script](#4-run-the-setup-script)
5. [Manual Setup (Alternative)](#5-manual-setup-alternative)
6. [Add API Keys](#6-add-api-keys)
7. [Set Up Web Connectors](#7-set-up-web-connectors)
8. [Verify Installation](#8-verify-installation)
9. [New Machine Checklist](#9-new-machine-checklist)

---

## 1. System Requirements

| Requirement | Windows | macOS |
|-------------|---------|-------|
| OS | Windows 10/11 | macOS 12+ |
| RAM | 8GB minimum (16GB recommended) | 8GB minimum |
| Node.js | 18+ LTS | 18+ LTS |
| Python | 3.10+ | 3.10+ |
| Claude Desktop | Latest | Latest |
| Claude Code CLI | Latest | Latest |

---

## 2. Install Prerequisites

### Node.js

Download and install from [nodejs.org](https://nodejs.org). Choose the **LTS** version.

Verify:
```bash
node --version   # should be 18+
npm --version    # should be 9+
```

### Python

**Windows:** Download from [python.org](https://python.org). During install, check **"Add Python to PATH"**.

**macOS:**
```bash
brew install python
```

Verify:
```bash
python --version   # should be 3.10+
pip --version
```

### Claude Desktop

Download from [claude.ai/download](https://claude.ai/download) and sign in.

### Claude Code CLI

Claude Code CLI is bundled with Claude Desktop. After installing, open a terminal and verify:
```bash
claude --version
```

---

## 3. Clone This Repo

```bash
git clone https://github.com/syedsherazali021/claude-mcp-starter-kit
cd claude-mcp-starter-kit
```

---

## 4. Run the Setup Script

### Windows (PowerShell as Administrator)

```powershell
./setup.ps1
```

The script will:
- Install all 13 npm MCP packages globally
- Install `semgrep` via pip
- Copy `claude_desktop_config.json` to the correct Claude Desktop location
- Copy `settings.json` to `~/.claude/`
- Copy all 6 slash commands to `~/.claude/commands/`
- Create `Claude-Chats`, `Claude-Memory` folders in Documents
- Prompt you for each API key and inject them into the config

### macOS / Linux

```bash
chmod +x setup.sh
./setup.sh
```

---

## 5. Manual Setup (Alternative)

Skip this section if you used the setup script.

### Step 5a -- Install npm packages globally

**Windows (PowerShell):**
```powershell
npm install -g `
  @modelcontextprotocol/server-memory `
  @modelcontextprotocol/server-filesystem `
  @modelcontextprotocol/server-github `
  @playwright/mcp `
  firecrawl-mcp `
  mcp-security-audit `
  mcp-server-semgrep `
  @wonderwhy-er/desktop-commander `
  @jpisnice/shadcn-ui-mcp-server `
  @magicuidesign/mcp `
  @21st-dev/magic `
  gitnexus `
  mcp-obsidian
```

**macOS / Linux:**
```bash
npm install -g \
  @modelcontextprotocol/server-memory \
  @modelcontextprotocol/server-filesystem \
  @modelcontextprotocol/server-github \
  @playwright/mcp \
  firecrawl-mcp \
  mcp-security-audit \
  mcp-server-semgrep \
  @wonderwhy-er/desktop-commander \
  @jpisnice/shadcn-ui-mcp-server \
  @magicuidesign/mcp \
  @21st-dev/magic \
  gitnexus \
  mcp-obsidian
```

### Step 5b -- Install semgrep

```bash
pip install semgrep
```

### Step 5c -- Find your global npm path

```bash
npm root -g
# Windows example: C:\Users\YourName\AppData\Roaming\npm\node_modules
# macOS example:   /usr/local/lib/node_modules
```

### Step 5d -- Copy Claude Desktop config

Open `config/claude_desktop_config.json` and replace every placeholder:

| Placeholder | Replace With |
|-------------|-------------|
| `<NPM_MODULES_PATH>` | Your global npm path from Step 5c |
| `<HOME>` | Your home directory |
| `<GITHUB_TOKEN>` | Your GitHub Personal Access Token |
| `<FIRECRAWL_API_KEY>` | Your Firecrawl API key |
| `<21ST_DEV_API_KEY>` | Your 21st.dev API key |
| `<OBSIDIAN_VAULT_PATH>` | Full path to your Obsidian vault folder |
| `<PYTHON_SCRIPTS_PATH>` | Path to Python Scripts folder (Windows only) |

Then copy to:

**Windows:**
```
C:\Users\<USERNAME>\AppData\Local\Packages\Claude_pzs8sxrjxfjjc\LocalCache\Roaming\Claude\claude_desktop_config.json
```

**macOS:**
```
~/Library/Application Support/Claude/claude_desktop_config.json
```

### Step 5e -- Copy Claude Code settings

```bash
# Windows
copy settings\settings.json %USERPROFILE%\.claude\settings.json

# macOS / Linux
cp settings/settings.json ~/.claude/settings.json
```

### Step 5f -- Copy slash commands

```bash
# Windows
mkdir %USERPROFILE%\.claude\commands
copy commands\*.md %USERPROFILE%\.claude\commands\

# macOS / Linux
mkdir -p ~/.claude/commands
cp commands/*.md ~/.claude/commands/
```

### Step 5g -- Create required folders

```bash
# Windows
mkdir %USERPROFILE%\Documents\Claude-Chats
mkdir %USERPROFILE%\Documents\Claude-Memory

# macOS / Linux
mkdir -p ~/Documents/Claude-Chats
mkdir -p ~/Documents/Claude-Memory
```

---

## 6. Add API Keys

### GitHub Personal Access Token
1. Go to [github.com/settings/tokens](https://github.com/settings/tokens)
2. Click **Generate new token (classic)**
3. Select scopes: `repo`, `read:org`, `read:user`
4. Replace `<GITHUB_TOKEN>` in config

### Firecrawl API Key
1. Go to [firecrawl.dev](https://firecrawl.dev) and sign up
2. Replace `<FIRECRAWL_API_KEY>` in config

### 21st.dev API Key
1. Go to [21st.dev](https://21st.dev) and sign up
2. Replace `<21ST_DEV_API_KEY>` in config

### Obsidian Vault Path
1. Open Obsidian -> Settings -> About to find your vault path
2. Replace `<OBSIDIAN_VAULT_PATH>` in config with the full path
   - Windows example: `D:\\MyVault`
   - macOS example: `/Users/yourname/Documents/MyVault`

---

## 7. Set Up Web Connectors

Go to [claude.ai](https://claude.ai) -> **Settings -> Connectors** and connect each:

| Connector | Auth Type |
|-----------|----------|
| Canva | OAuth |
| Context7 | OAuth |
| GitHub | OAuth |
| Sentry | OAuth |
| Supabase | OAuth |
| Tavily | API Key (get at tavily.com) |
| Vercel | OAuth |

Connectors are tied to your claude.ai account -- reconnect automatically on any machine.

---

## 8. Verify Installation

1. **Restart Claude Desktop** fully (quit and reopen)
2. Go to **Settings -> Developer** -- verify all 13 MCPs show as **Connected**
3. Open a Claude Code session and run `/audit` -- a security scan should begin
4. In Claude Desktop chat, type `Remember that I prefer TypeScript` then in a new chat: `What are my coding preferences?` -- Claude should recall it

---

## 9. New Machine Checklist

- [ ] Install Node.js LTS
- [ ] Install Python 3.10+
- [ ] Install Claude Desktop and sign in
- [ ] Clone this repo
- [ ] Run `setup.ps1` (Windows) or `setup.sh` (macOS)
- [ ] Add API keys to claude_desktop_config.json
- [ ] Set up web connectors at claude.ai -> Settings -> Connectors
- [ ] Install Obsidian (optional) and note your vault path
- [ ] Restart Claude Desktop
- [ ] Verify all 13 MCPs connect
- [ ] Run `/audit` to test slash commands
