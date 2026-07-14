# /ui-theme

Change the visual theme of the current project -- palette, typography, or both.

## What to change
$ARGUMENTS

## Steps

1. **Detect project structure** -- find:
   - CSS tokens/variables file (e.g. `src/styles/tokens.css`, `styles/globals.css`, `app/globals.css`)
   - Tailwind config: `tailwind.config.js` or `tailwind.config.ts`
   - Theme toggle implementation (look for `data-theme` usage or `next-themes`)
   - Check for `CLAUDE.md` in the project root for project-specific conventions

2. **Read the current tokens** from the CSS variables file

3. **Update tokens** -- always update all theme blocks present:
   - `:root` (light default)
   - `@media (prefers-color-scheme: dark) :root` (dark OS preference)
   - `:root[data-theme="dark"]` (dark toggle override)
   - `:root[data-theme="light"]` (light toggle override)

4. **Token rules**:
   - Background tokens -- never pure black/white, always slightly tinted
   - Text tokens -- maintain at least 3 levels (primary, secondary, muted)
   - Accent tokens -- primary and secondary brand colors
   - Glow/shadow tokens -- keep opacity low (0.12-0.20)
   - Border tokens -- subtle rgba values
   - Contrast: text on background must be at least 4.5:1

5. **Typography changes** (if requested):
   - Update font-family in the relevant CSS files
   - If using a web font, embed as `@font-face` with a local file or data URI (avoid CDN links)

6. **Verify**:
   - Run `npm run build`
   - Start dev server, screenshot both light and dark modes
   - Check contrast ratios visually
