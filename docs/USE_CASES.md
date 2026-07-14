# Use Cases

> What you can actually do with this starter kit — real workflows, not just feature lists.

This setup turns Claude from a chat assistant into a full development environment. Claude can read your code, write files to disk, run terminal commands, search the web, manage GitHub, query your database, and remember everything across sessions.

---

## Table of Contents

1. [Full-Stack Web Development](#1-full-stack-web-development)
2. [Security and Code Quality](#2-security-and-code-quality)
3. [GitHub Workflow](#3-github-workflow)
4. [Research and Web Data](#4-research-and-web-data)
5. [Personal Knowledge Management](#5-personal-knowledge-management)
6. [Terminal and System Control](#6-terminal-and-system-control)
7. [Database and Deployment](#7-database-and-deployment)
8. [Design and UI Generation](#8-design-and-ui-generation)
9. [Who Benefits Most](#9-who-benefits-most)

---

## 1. Full-Stack Web Development

**MCPs used:** `filesystem`, `magicuidesign-mcp`, `21st-dev-magic`, `shadcn-ui`, `desktop-commander`, `playwright`
**Commands used:** `/ui-add`, `/ui-fix`, `/ui-section`, `/ui-theme`

Claude reads and writes your actual project files — no copy-pasting code into chat.

### What you can do

- Add animated UI components to any React or Next.js project in one command
- Fix build errors, Tailwind issues, dark mode bugs without manually debugging
- Build entire landing page sections (hero, pricing, testimonials, FAQ) from a description
- Change your entire color palette and typography across all theme blocks at once
- Verify UI changes in a real browser with screenshots via Playwright

### Example session

```
/ui-section hero with animated gradient headline and two CTA buttons
/ui-add company logos marquee below the hero
/ui-theme switch accent color to electric blue
/ui-fix tailwind classes not applying in production build
/audit
```

---

## 2. Security and Code Quality

**MCPs used:** `security-audit`, `semgrep`
**Commands used:** `/audit`

Two-layer scanning: dependency CVEs + static code analysis. Catches issues before they reach production.

### What you can do

- Scan all npm dependencies for known CVEs (CRITICAL / HIGH / MEDIUM / LOW)
- Detect hardcoded API keys, passwords, and secrets in your source code
- Find OWASP Top 10 vulnerabilities — XSS, SQL injection, command injection, path traversal
- Get a structured report with exact file paths, line numbers, and fix commands
- Works across JavaScript, TypeScript, Python, Go, Java, and more

### Example prompts

```
/audit
Scan src/ for any hardcoded secrets or API keys
Check this file for SQL injection vulnerabilities
Are there any critical CVEs in my package.json?
```

### When to run it
- Before every pull request
- After adding new dependencies
- Before deploying to production
- When onboarding to an unfamiliar codebase

---

## 3. GitHub Workflow

**MCPs used:** `github`, `gitnexus`
**Connectors used:** GitHub connector

Manage your entire GitHub workflow from Claude chat — no browser switching.

### What you can do

- Search repositories, read issues, create PRs without leaving the conversation
- Ask Claude to summarize open issues and suggest priorities
- Search your codebase for any symbol, import, or pattern
- Use GitNexus to trace call graphs, find all callers of a function, and understand unfamiliar code structure
- Ask "what would break if I rename this function?" and get a real answer

### Example prompts

```
Search GitHub for React drag-and-drop libraries with 1000+ stars
Create an issue in my repo: "Fix auth redirect loop on mobile"
Show me all open PRs waiting for review
Find all functions that call the getUserById function
Which files import from the auth module?
What changed in the last 5 commits?
```

---

## 4. Research and Web Data

**MCPs used:** `firecrawl`
**Connectors used:** Tavily, Context7

Claude can fetch live content from the web — documentation, competitor sites, news, research papers.

### What you can do

- Pull the latest docs for any library directly into context (no outdated training data)
- Scrape any URL and get clean markdown — no raw HTML
- Search the web with full content extraction and source citations
- Crawl entire documentation sites and extract specific sections
- Research competitors, extract pricing tables, summarize blog posts

### Example prompts

```
Get the latest Next.js 15 App Router docs for data fetching
Scrape the Framer Motion docs for the useInView API
Search for "Supabase Row Level Security best practices" and summarize
Extract the pricing table from this competitor website
What are the most popular React state management libraries right now?
```

---

## 5. Personal Knowledge Management

**MCPs used:** `memory`, `obsidian`, `filesystem`
**Commands used:** `/wrap-up`

Claude remembers your work across sessions and builds a searchable knowledge base in Obsidian.

### What you can do

- Run `/wrap-up` at the end of every session — saves transcript, updates memory graph, writes Obsidian note
- Claude recalls your past decisions, preferences, and project context in future sessions automatically
- Search your Obsidian vault from Claude chat
- Build a permanent log of every project, decision, and bug fix
- Never re-explain your stack or preferences to Claude again

### Example prompts

```
/wrap-up
What do you know about my CareerAIPilot project?
Remember that I prefer TypeScript over JavaScript
Search my Obsidian notes for anything about authentication
What decisions did we make last session about the database schema?
```

### What gets saved on /wrap-up

| Save | Location | Format |
|------|----------|--------|
| Chat transcript | `~/Documents/Claude-Chats/ProjectName_YYYY-MM-DD.txt` | Plain text |
| Memory entity | Claude memory graph (local .jsonl file) | Knowledge graph |
| Session note | `<Vault>/Sessions/YYYY-MM-DD -- ProjectName.md` | Markdown |

---

## 6. Terminal and System Control

**MCPs used:** `desktop-commander`

Claude gets access to your terminal — run commands, manage processes, control your system from chat.

### What you can do

- Run builds, start dev servers, and see output directly in Claude chat
- Kill processes, free ports, manage running services
- Move, rename, and organize files without switching to Explorer or Finder
- Chain commands: build -> test -> deploy in one conversation
- No need to copy error output into chat — Claude reads it directly

### Example prompts

```
Run npm run build and tell me if there are any errors
Start the dev server and screenshot the homepage
Kill the process running on port 3000
List all running Node.js processes
Move all .log files in this folder to a logs/ subfolder
```

---

## 7. Database and Deployment

**Connectors used:** Supabase, Vercel, Sentry

Manage your backend infrastructure from Claude chat.

### What you can do

**Supabase:**
- Query your database, inspect table schemas, write and run migrations
- Write Row Level Security policies with Claude's help
- Deploy Edge Functions and manage your Supabase project

**Vercel:**
- Check deployment status, read build logs, find failed deployments
- Monitor runtime errors in production
- Trigger redeployments

**Sentry:**
- See top errors by frequency, get full stack traces
- Ask Claude to explain an error and suggest a fix
- Monitor new critical errors in production

### Example prompts

```
Show me the schema for my users table
Write a migration to add a subscription_status column
Help me write a RLS policy so users can only read their own rows
What's the status of my latest Vercel deployment?
Show me the build logs for the failed deployment
What are the top 5 errors in production this week?
What's causing the TypeError in the auth flow?
```

---

## 8. Design and UI Generation

**MCPs used:** `21st-dev-magic`, `magicuidesign-mcp`, `shadcn-ui`
**Connectors used:** Canva

Generate UI from plain English — components, sections, themes, and marketing assets.

### What you can do

- Describe a UI component and get production-quality React + Tailwind code
- Browse and install Magic UI animated components directly
- Look up any shadcn/ui component with full source code and examples
- Generate Canva designs — LinkedIn banners, social posts, pitch deck slides

### Example prompts

```
Generate a sticky nav bar with blur backdrop, logo left, links center, CTA right
Create a pricing card with popular badge, feature list, and gradient border
/ui-add animated marquee of company logos
Show me the shadcn DataTable with server-side pagination
Create a LinkedIn banner for my open-source project
```

---

## 9. Who Benefits Most

| Role | Most Useful Features |
|------|---------------------|
| **Solo developer / indie hacker** | Full dev loop in one tool — build, fix, audit, deploy, remember |
| **Frontend developer** | `/ui-add`, `/ui-section`, `/ui-theme`, Magic UI, 21st.dev |
| **Full-stack developer** | GitHub MCP, Supabase connector, Vercel connector, GitNexus |
| **Security engineer** | `/audit`, semgrep scanning, CVE dependency checks |
| **Technical founder** | Research, build, deploy, track decisions — without switching apps |
| **Open-source maintainer** | GitHub MCP for issue triage, PR reviews, repo search |

---

## Typical Day With This Setup

```
Morning:
  Claude recalls yesterday's context automatically (memory MCP)
  "What were we working on and what's next?"

During development:
  /ui-section pricing table with toggle
  /ui-fix animation not triggering on scroll
  "Query my Supabase users table and show me the last 10 signups"
  "Search GitHub for how other projects handle refresh token rotation"

Before committing:
  /audit

End of day:
  /wrap-up
  Session saved to Obsidian, memory updated, transcript archived
```
