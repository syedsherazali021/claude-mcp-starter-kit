# /ui-section

Create a brand-new page section in the current project using Magic UI and/or Aceternity UI components.

## Section to build
$ARGUMENTS

## Steps

1. **Detect project structure** -- read the current directory to find:
   - Where sections/components live (e.g. `src/components/`, `components/`)
   - Main app entry where sections are imported (e.g. `src/App.jsx`, `app/page.tsx`)
   - CSS tokens/variables file for theme colors
   - Check for `CLAUDE.md` in the project root for project-specific conventions

2. **Plan the section** -- decide:
   - Section name and purpose
   - Which Magic UI / Aceternity components to feature
   - Layout: full-width, constrained, split columns, etc.
   - Background: use existing CSS custom properties for colors

3. **Fetch any new components needed**:
   - `mcp__magicuidesign-mcp__searchRegistryItems` -> `mcp__magicuidesign-mcp__getRegistryItem`
   - Write new components to the correct folder before building the section

4. **Create the section file**:
   - Use entrance animations with staggered delays where appropriate
   - Use CSS custom properties for all colors
   - Mobile-first responsive layout
   - Follow the existing section structure in the project

5. **Register it in the main app entry**:
   - Import the new section
   - Place it in logical page order

6. **Verify**:
   - Run `npm run build`
   - Start dev server, screenshot to confirm layout and animations
