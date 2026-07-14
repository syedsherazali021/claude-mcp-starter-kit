# Claude MCP Starter Kit -- Windows Setup Script
# Run in PowerShell as Administrator

$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "======================================"
Write-Host " Claude MCP Starter Kit -- Setup"
Write-Host "======================================"
Write-Host ""

$USERNAME = $env:USERNAME
$HOME_PATH = $env:USERPROFILE
$NPM_ROOT = (npm root -g 2>$null).Trim()
$CLAUDE_CONFIG_DIR = "$HOME_PATH\AppData\Local\Packages\Claude_pzs8sxrjxfjjc\LocalCache\Roaming\Claude"
$CLAUDE_CODE_DIR = "$HOME_PATH\.claude"

Write-Host "Detected:"
Write-Host "  Username:    $USERNAME"
Write-Host "  Home:        $HOME_PATH"
Write-Host "  npm modules: $NPM_ROOT"
Write-Host ""

Write-Host "Checking prerequisites..."
try { $nodeVer = node --version } catch { Write-Error "Node.js not found. Install from https://nodejs.org" }
Write-Host "  Node.js: $nodeVer"
try { $pythonVer = python --version } catch { Write-Error "Python not found. Install from https://python.org" }
Write-Host "  Python: $pythonVer"
Write-Host ""

Write-Host "Installing npm packages globally (this may take a few minutes)..."
npm install -g `
  "@modelcontextprotocol/server-memory" `
  "@modelcontextprotocol/server-filesystem" `
  "@modelcontextprotocol/server-github" `
  "@playwright/mcp" `
  "firecrawl-mcp" `
  "mcp-security-audit" `
  "mcp-server-semgrep" `
  "@wonderwhy-er/desktop-commander" `
  "@jpisnice/shadcn-ui-mcp-server" `
  "@magicuidesign/mcp" `
  "@21st-dev/magic" `
  "gitnexus" `
  "mcp-obsidian"
Write-Host "npm packages installed."
Write-Host ""

Write-Host "Installing semgrep via pip..."
pip install semgrep
Write-Host "semgrep installed."
Write-Host ""

Write-Host "======================================"
Write-Host " API Key Configuration"
Write-Host "======================================"
Write-Host "Press Enter to skip any key (add manually later)."
Write-Host ""
$GITHUB_TOKEN = Read-Host "GitHub Personal Access Token (github.com/settings/tokens)"
$FIRECRAWL_KEY = Read-Host "Firecrawl API Key (firecrawl.dev)"
$MAGIC_KEY = Read-Host "21st.dev API Key (21st.dev)"
$OBSIDIAN_PATH = Read-Host "Obsidian vault path (e.g. D:\Obsidian\MyVault, Enter to skip)"
Write-Host ""

$PYTHON_PATH = (python -c "import sys; print(sys.exec_prefix)" 2>$null).Trim()
$PYTHON_SCRIPTS = "$PYTHON_PATH\Scripts"

Write-Host "Building claude_desktop_config.json..."
$configTemplate = Get-Content "$PSScriptRoot\config\claude_desktop_config.json" -Raw
$configTemplate = $configTemplate.Replace("<NPM_MODULES_PATH>", $NPM_ROOT.Replace("\\", "\\\\"))
$configTemplate = $configTemplate.Replace("<HOME>", $HOME_PATH.Replace("\\", "\\\\"))
$configTemplate = $configTemplate.Replace("<GITHUB_TOKEN>", $GITHUB_TOKEN)
$configTemplate = $configTemplate.Replace("<FIRECRAWL_API_KEY>", $FIRECRAWL_KEY)
$configTemplate = $configTemplate.Replace("<21ST_DEV_API_KEY>", $MAGIC_KEY)
$configTemplate = $configTemplate.Replace("<PYTHON_SCRIPTS_PATH>", $PYTHON_SCRIPTS.Replace("\\", "\\\\"))
$configTemplate = $configTemplate.Replace("<PYTHON_PATH>", $PYTHON_PATH.Replace("\\", "\\\\"))
$configTemplate = $configTemplate.Replace("<SYSTEM_PATH>", "C:\\Windows\\system32;C:\\Windows")
if ($OBSIDIAN_PATH) {
    $configTemplate = $configTemplate.Replace("<OBSIDIAN_VAULT_PATH>", $OBSIDIAN_PATH.Replace("\\", "\\\\"))
} else {
    $configTemplate = $configTemplate -replace '"obsidian":\s*\{[^}]+\}[,\s]*', ''
}

if (!(Test-Path $CLAUDE_CONFIG_DIR)) { New-Item -ItemType Directory -Path $CLAUDE_CONFIG_DIR -Force | Out-Null }
$configTemplate | Out-File -FilePath "$CLAUDE_CONFIG_DIR\claude_desktop_config.json" -Encoding utf8
Write-Host "  Config saved to: $CLAUDE_CONFIG_DIR\claude_desktop_config.json"

Write-Host "Copying Claude Code settings..."
$settingsTemplate = Get-Content "$PSScriptRoot\settings\settings.json" -Raw
$settingsTemplate = $settingsTemplate.Replace("<HOME>", $HOME_PATH.Replace("\\", "\\\\"))
if ($OBSIDIAN_PATH) {
    $settingsTemplate = $settingsTemplate.Replace("<OBSIDIAN_VAULT_PATH>", $OBSIDIAN_PATH.Replace("\\", "\\\\"))
} else {
    $settingsTemplate = $settingsTemplate -replace '"<OBSIDIAN_VAULT_PATH>"[,\s]*', ''
}
if (!(Test-Path $CLAUDE_CODE_DIR)) { New-Item -ItemType Directory -Path $CLAUDE_CODE_DIR -Force | Out-Null }
$settingsTemplate | Out-File -FilePath "$CLAUDE_CODE_DIR\settings.json" -Encoding utf8
Write-Host "  Settings saved to: $CLAUDE_CODE_DIR\settings.json"

Write-Host "Installing slash commands..."
$COMMANDS_DIR = "$CLAUDE_CODE_DIR\commands"
if (!(Test-Path $COMMANDS_DIR)) { New-Item -ItemType Directory -Path $COMMANDS_DIR -Force | Out-Null }
Copy-Item "$PSScriptRoot\commands\*.md" -Destination $COMMANDS_DIR -Force
Write-Host "  Commands installed to: $COMMANDS_DIR"

Write-Host "Creating folders..."
$CHATS_DIR = "$HOME_PATH\Documents\Claude-Chats"
$MEMORY_DIR = "$HOME_PATH\Documents\Claude-Memory"
if (!(Test-Path $CHATS_DIR)) { New-Item -ItemType Directory -Path $CHATS_DIR -Force | Out-Null }
if (!(Test-Path $MEMORY_DIR)) { New-Item -ItemType Directory -Path $MEMORY_DIR -Force | Out-Null }
Write-Host "  $CHATS_DIR"
Write-Host "  $MEMORY_DIR"

Write-Host ""
Write-Host "======================================"
Write-Host " Setup Complete!"
Write-Host "======================================"
Write-Host ""
Write-Host "Next steps:"
Write-Host "  1. Restart Claude Desktop"
Write-Host "  2. Settings > Developer -- all 13 MCPs should show Connected"
Write-Host "  3. Set up web connectors at claude.ai > Settings > Connectors"
Write-Host "  4. Open a Claude Code session and run /audit to test"
Write-Host ""
Write-Host "See docs/SETUP.md for detailed steps."
Write-Host ""
