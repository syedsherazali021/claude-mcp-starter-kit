#!/bin/bash
# Claude MCP Starter Kit -- macOS/Linux Setup Script

set -e

echo ""
echo "======================================"
echo " Claude MCP Starter Kit -- Setup"
echo "======================================"
echo ""

HOME_PATH="$HOME"
NPM_ROOT=$(npm root -g 2>/dev/null | tr -d '[:space:]')

if [[ "$OSTYPE" == "darwin"* ]]; then
  CLAUDE_CONFIG_DIR="$HOME/Library/Application Support/Claude"
else
  CLAUDE_CONFIG_DIR="$HOME/.config/Claude"
fi

CLAUDE_CODE_DIR="$HOME/.claude"

echo "Detected:"
echo "  Home:        $HOME_PATH"
echo "  npm modules: $NPM_ROOT"
echo "  Claude config: $CLAUDE_CONFIG_DIR"
echo ""

echo "Checking prerequisites..."
if ! command -v node &>/dev/null; then
  echo "ERROR: Node.js not found. Install from https://nodejs.org"; exit 1
fi
echo "  Node.js: $(node --version)"
if ! command -v python3 &>/dev/null; then
  echo "ERROR: Python not found. Install from https://python.org"; exit 1
fi
echo "  Python: $(python3 --version)"
echo ""

echo "Installing npm packages globally..."
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
echo "npm packages installed."
echo ""

echo "Installing semgrep..."
pip3 install semgrep
echo "semgrep installed."
echo ""

echo "======================================"
echo " API Key Configuration"
echo "======================================"
echo "Press Enter to skip any key (add manually later)."
echo ""
read -p "GitHub Personal Access Token (github.com/settings/tokens): " GITHUB_TOKEN
read -p "Firecrawl API Key (firecrawl.dev): " FIRECRAWL_KEY
read -p "21st.dev API Key (21st.dev): " MAGIC_KEY
read -p "Obsidian vault path (e.g. /Users/you/Documents/MyVault): " OBSIDIAN_PATH
echo ""

echo "Building claude_desktop_config.json..."
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_TEMPLATE="$SCRIPT_DIR/config/claude_desktop_config.json"
CONFIG_OUT="$CLAUDE_CONFIG_DIR/claude_desktop_config.json"
mkdir -p "$CLAUDE_CONFIG_DIR"
sed \
  -e "s|<NPM_MODULES_PATH>|$NPM_ROOT|g" \
  -e "s|<HOME>|$HOME_PATH|g" \
  -e "s|<GITHUB_TOKEN>|$GITHUB_TOKEN|g" \
  -e "s|<FIRECRAWL_API_KEY>|$FIRECRAWL_KEY|g" \
  -e "s|<21ST_DEV_API_KEY>|$MAGIC_KEY|g" \
  -e "s|<OBSIDIAN_VAULT_PATH>|$OBSIDIAN_PATH|g" \
  -e "s|<PYTHON_SCRIPTS_PATH>||g" \
  -e "s|<PYTHON_PATH>||g" \
  -e "s|<SYSTEM_PATH>|/usr/local/bin:/usr/bin:/bin|g" \
  "$CONFIG_TEMPLATE" > "$CONFIG_OUT"
echo "  Config saved to: $CONFIG_OUT"

echo "Copying Claude Code settings..."
mkdir -p "$CLAUDE_CODE_DIR"
sed \
  -e "s|<HOME>|$HOME_PATH|g" \
  -e "s|<OBSIDIAN_VAULT_PATH>|$OBSIDIAN_PATH|g" \
  "$SCRIPT_DIR/settings/settings.json" > "$CLAUDE_CODE_DIR/settings.json"
echo "  Settings saved to: $CLAUDE_CODE_DIR/settings.json"

echo "Installing slash commands..."
mkdir -p "$CLAUDE_CODE_DIR/commands"
cp "$SCRIPT_DIR/commands/"*.md "$CLAUDE_CODE_DIR/commands/"
echo "  Commands installed to: $CLAUDE_CODE_DIR/commands/"

echo "Creating folders..."
mkdir -p "$HOME_PATH/Documents/Claude-Chats"
mkdir -p "$HOME_PATH/Documents/Claude-Memory"
echo "  $HOME_PATH/Documents/Claude-Chats"
echo "  $HOME_PATH/Documents/Claude-Memory"

echo ""
echo "======================================"
echo " Setup Complete!"
echo "======================================"
echo ""
echo "Next steps:"
echo "  1. Restart Claude Desktop"
echo "  2. Settings > Developer -- all 13 MCPs should show Connected"
echo "  3. Set up web connectors at claude.ai > Settings > Connectors"
echo "  4. Open a Claude Code session and run /audit to test"
echo ""
echo "See docs/SETUP.md for detailed steps."
echo ""
