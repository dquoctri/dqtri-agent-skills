---
name: frontend-scaffold
description: Set up a React/Vite/TypeScript project with routing, context providers, mock data, folder structure, and global CSS baseline so implementation can start immediately.
tokens: ~450
tier: critical
triggers: scaffold, vite, react setup, new frontend project, project structure, create react app, init frontend, router setup, folder structure, frontend bootstrap
chains:
  before: [spec-design, planning]
  after: [design-token-system, ui-component-library, feature-implementation]
---

# Skill: frontend-scaffold

## When to use

Use when starting a new React/Vite/TypeScript project from scratch, or when an existing project is missing its structural foundation (routing, context, mock data, CSS baseline).

## Inputs to check

- Design spec or reference UI (HTML prototypes, Figma exports, screenshots).
- Required pages and navigation structure.
- State management needs (context, store, or none).
- Any specified libraries or constraints (router, form lib, test runner).

## Folder structure

Establish this layout before writing any components:

```
src/
  tokens/         # Design tokens: types.ts, themes.ts
  context/        # React context providers and hooks
  components/
    primitives/   # Atomic UI components (Button, Input, Card…)
    charts/       # Data visualization components
    layout/       # AppShell, Sidebar, Topbar, modals
  pages/          # Route-level page components
  data/           # Mock data module (index.ts)
  main.tsx        # Entry point
  App.tsx         # Router setup
  index.css       # Global baseline only (keyframes, resets)
```

## Steps

1. **Scaffold the project** — run `npm create vite@latest <name> -- --template react-ts`, verify `package.json`, install dependencies.
2. **Write `index.css`** — reset, font import, thin scrollbars, and *only* the keyframe animations that SVG/CSS effects require (`fadeSlideIn`, shimmer, chart animations). Everything else is inline.
3. **Write `src/data/index.ts`** — all mock data in one file before any component. Page components depend on data shape; settle the shape first.
4. **Write `tokens/types.ts`** — type interfaces for Theme, Radii, and any dimension enums (Mood, Mode, Corners, Density).
5. **Write `tokens/themes.ts`** — token definitions or generator function.
6. **Write `context/ThemeContext.tsx`** — provider + `useTheme()` hook. Default values must produce a working first render.
7. **Write `App.tsx`** — `BrowserRouter` + `Routes`. Use a *layout route* pattern: one `<AppShell>` component wrapping `<Outlet/>`, all pages as nested children. Redirect `/` to the default page.
8. **Write `main.tsx`** — `ReactDOM.createRoot` + `ThemeProvider` wrapper.
9. **Stub `AppShell`** — minimal shell (sidebar placeholder + main content area) just enough to render `<Outlet/>`. Full implementation is `ui-component-library` work.

## Review checklist

- Folder structure matches the layout above.
- `data/index.ts` exists and has typed exports before any page file is written.
- `App.tsx` uses a layout route — not page-level state for navigation.
- Context default produces a valid theme on first render without stored state.
- `index.css` contains *only* keyframes and resets — no component styles.
- `npm run dev` starts without errors after scaffold.

## Memory update guidance

Record durable project constraints (required libraries, page list, router shape) in `ai-memory/project-config.md`. Do not store transient task notes.

## Quality Gate

Gates: Code, Architecture
- `tsc --noEmit` clean after scaffold.
- No circular imports between `tokens/`, `context/`, `data/`.
- Layout route is set — page navigation does not use component state.
- All typed interfaces are in `tokens/types.ts`, not scattered across files.

See `core/rules/quality-gates.md` → Code, Architecture dimensions.

## Done When

- Project runs (`npm run dev`) with no console errors.
- Folder structure, router, context, and mock data are in place.
- `tsc --noEmit` is clean.
- No page component has been written yet — that is `ui-component-library` work.
