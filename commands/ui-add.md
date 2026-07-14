# /ui-add

Add a new UI component to the current project and wire it into the page.

## What to add
$ARGUMENTS

## Steps

1. **Detect project structure** -- read the current directory to find:
   - Component folders (e.g. `src/components/magicui/`, `src/components/ui/`)
   - Main app entry (e.g. `src/App.jsx`, `src/App.tsx`, `app/page.tsx`)
   - Styles folder (e.g. `src/styles/`, `styles/`)
   - Check for `CLAUDE.md` in the project root for project-specific conventions

2. **Search for the component**:
   - Call `mcp__magicuidesign-mcp__searchRegistryItems` with the component name
   - If found, fetch with `mcp__magicuidesign-mcp__getRegistryItem`
   - If not in Magic UI, implement from Aceternity UI source knowledge

3. **Write the component file**:
   - Adapt TypeScript -> JSX if the project uses JSX
   - Replace `next-themes` with CSS variable / `data-theme` detection
   - Replace hardcoded colors with CSS custom properties (`var(--accent)`, `var(--text)`, etc.)
   - Use the project's existing utility function (e.g. `cn()` from `lib/utils`)
   - Save to the appropriate components folder

4. **Update config if needed**:
   - New Tailwind keyframes -> add to `tailwind.config.js` under `theme.extend.keyframes` AND `theme.extend.animation`
   - New CSS tokens -> add to the project's CSS tokens/variables file in all theme blocks

5. **Wire it in**:
   - Import in the most appropriate existing section or page
   - If it is a new full section, create the section file and import it in the main app entry

6. **Verify**:
   - Run the project build command (e.g. `npm run build`)
   - Fix any errors before reporting done
   - Start dev server and take a screenshot to confirm it renders
