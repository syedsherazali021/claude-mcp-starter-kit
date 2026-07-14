# Web Connectors Guide

> Web connectors link Claude to cloud services via OAuth. Set up once at claude.ai, reconnect automatically on any machine.

Set up at: **claude.ai -> Settings -> Connectors**

---

## Canva
**Purpose:** Create designs, access brand templates, generate design assets

```
Create a LinkedIn banner for my SaaS product
Generate a social media post template with my brand colors
```

---

## Context7
**Purpose:** Fetch current library docs into context (React, Next.js, Tailwind, Supabase, etc.)

Essential -- Claude never gives outdated API advice when Context7 is connected.

```
Get the latest Next.js 15 App Router docs for data fetching
Show me the Supabase Row Level Security documentation
```

---

## GitHub
**Purpose:** Access repos, issues, and PRs from claude.ai web chat (separate from the local github MCP)

```
Summarize the open issues in my project
What changed in the last 5 commits?
```

---

## Sentry
**Purpose:** Query error tracking -- view issues, analyze errors, get stack traces

```
Show me the top 5 errors in my project this week
What's causing the TypeError in the authentication flow?
```

---

## Supabase
**Purpose:** Manage database -- run queries, manage tables, apply migrations, deploy edge functions

```
Show me the schema for my users table
Write a migration to add a subscription_status column
Help me write a Row Level Security policy for my posts table
```

---

## Tavily
**Purpose:** AI-powered web search with cited sources | **Setup:** API key from tavily.com

```
Search for the latest Next.js 15 release notes
Research best practices for API rate limiting
```

---

## Vercel
**Purpose:** Manage deployments, check build logs, monitor runtime errors

```
What's the status of my latest deployment?
Show me the build logs for the failed deployment
```

---

## Connector vs MCP

| | Web Connector | Local MCP |
|--|--------------|----------|
| Set up at | claude.ai Settings | claude_desktop_config.json |
| Runs where | In the cloud | On your machine |
| Follows you | Yes -- any machine | No -- stays on machine |
| Local file access | No | Yes |

Some services (GitHub) have both. The connector covers claude.ai web chat; the local MCP covers Claude Desktop and Claude Code CLI.
