# /ui-fix

Debug and fix a problem in the current project.

## Problem to fix
$ARGUMENTS

## Steps

1. **Detect project structure** -- check the current directory for:
   - Framework (React, Next.js, Vue, etc.)
   - Build tool (Vite, Webpack, etc.)
   - Check for `CLAUDE.md` in the project root for project-specific conventions

2. **Reproduce** -- start the dev server if not running (`npm run dev`) and screenshot the issue.

3. **Check console errors**:
   - Browser console for runtime errors
   - Terminal output for build/HMR errors
   - Run `npm run build` for a clean compile check

4. **Common issues and fixes**:
   - *Duplicate React instance* -> check `vite.config.js` has `resolve: { dedupe: ['react', 'react-dom'] }`
   - *framer-motion hook error* -> same dedupe fix + clear `.vite` cache
   - *Tailwind class not applying* -> ensure class is in `tailwind.config.js` content glob or added to keyframes/animation
   - *CSS variable undefined* -> check all theme blocks in the tokens/variables CSS file define the variable
   - *Component import missing* -> verify the file exists in the components folder
   - *Animation not triggering* -> check `useInView` `once: true` and `amount` threshold

5. **Fix** the root cause -- not a workaround.

6. **Verify**:
   - `npm run build` must pass with zero errors
   - Screenshot the fix in the browser
