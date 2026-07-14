# /wrap-up

End-of-session command. Saves chat transcript, updates Claude Memory MCP, and writes an Obsidian note -- all in one go.

## Steps

### 1. Build session summary

Summarize the full session:
- Project name and date (YYYY-MM-DD)
- What was built or changed (specific files, features)
- Key decisions made and why
- Problems solved and how
- Next steps / TODOs

### 2. Save chat transcript to Claude-Chats

- Path: `<HOME>/Documents/Claude-Chats/<ProjectName>_<YYYY-MM-DD>.txt`
- **Check if the file already exists** (use Read tool to test):
  - **Does not exist** -> create new file with full format below
  - **Already exists** -> append a new session block at the bottom starting with `====== SESSION 2 - HH:MM ======` (increment session number each time)
- Format for new file:
  ```
  PROJECT: <project name>
  DATE: <date>
  ======================================================================

  SUMMARY:
  <2-3 sentence overview>

  COMPLETED:
  - <bullet list>

  DECISIONS:
  - <bullet list>

  PROBLEMS SOLVED:
  - <bullet list>

  NEXT STEPS:
  - <bullet list>

  ======================================================================
  CONVERSATION TRANSCRIPT:
  [User] <message>
  [Claude] <response>
  ... (key exchanges only)
  ```

### 3. Update Claude Memory MCP

Using the memory MCP, save or update a knowledge graph entity:
- Entity name: `<ProjectName>_<YYYY-MM-DD>`
- Entity type: `Coding_Session`
- Observations to include:
  - date, project name, files modified, features added, bugs fixed, decisions made, next coding tasks, blockers, tools/MCPs used

If an entity for this project already exists from a prior session, add new observations to it rather than creating a duplicate.

### 4. Save Obsidian note

- Path: `<OBSIDIAN_VAULT_PATH>/Sessions/<YYYY-MM-DD> -- <ProjectName>.md`
- **Check if the file already exists** (use Read tool to test):
  - **Does not exist** -> create new file
  - **Already exists** -> append a new `## Session 2 -- HH:MM` section at the bottom
- Format for new file:
  ```markdown
  # <date> -- <ProjectName>

  ## Summary
  ## What Was Done
  ## Decisions
  ## Problems Solved
  ## Next Steps
  ## Files Changed
  ```

### 5. Confirm all three

Report back with:
- Chat transcript saved at: path
- Memory entity saved/updated: entity name
- Obsidian note saved at: Sessions/filename.md

---

> **Setup note:** Replace `<HOME>` and `<OBSIDIAN_VAULT_PATH>` with your actual paths, or run the setup script which handles this automatically.
