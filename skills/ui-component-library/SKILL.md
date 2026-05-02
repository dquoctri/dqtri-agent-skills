---
name: ui-component-library
description: Build a layered set of reusable React components from a design spec — primitives, charts, layout, and pages — with consistent token consumption and typed interfaces.
tokens: ~550
tier: critical
triggers: component library, react components, primitives, UI components, build components, design implementation, component system, reusable components, admin UI, dashboard components
chains:
  before: [frontend-scaffold, design-token-system]
  after: [feature-implementation, code-review]
---

# Skill: ui-component-library

## When to use

Use when implementing a set of React UI components from a design spec. Covers the full stack from atomic primitives up to page-level views.

## Build order (strict)

Always build bottom-up. Never write a page before its dependencies exist.

```
1. Primitives   Icon, Badge, Avatar, Button, Input, Select, Checkbox, Toggle,
                Card, Modal, Tooltip, Skeleton, EmptyState, PageHeader, …
2. Charts       Sparkline, BarChart, LineChart, DonutChart, StatBar, …
3. Layout       Sidebar, Topbar, AppShell, QuickAdd modal, ThemePanel
4. Pages        Overview, Table pages, Settings, Detail pages, …
```

Skipping this order causes cascading import errors and forces rewrites.

## Inputs to check

- Complete component inventory from the design (every distinct visual element).
- Token interface from `design-token-system` — know `t` and `r` before writing any component.
- Mock data shape from `data/index.ts` — page components depend on it; it must exist first.

## Component interface rules

**Controlled vs uncontrolled** — support both patterns for form inputs:
```tsx
// Controlled (value + onChange required together)
if (value !== undefined) { /* use value + onChange */ }
// Uncontrolled fallback (defaultValue only)
else { /* use defaultValue */ }
```

**Token consumption** — destructure both `t` (colors) and `r` (radii) from `useTheme()`:
```tsx
const { theme: t, r } = useTheme();
// Never hardcode: borderRadius: 8  →  borderRadius: r.md
// Never hardcode: color: '#2b7fff'  →  color: t.accent
```

**Prop naming conventions**:
- `checked` not `value` for boolean toggle/checkbox state (matches HTML/React idiom)
- `children` slot for flexible content injection alongside named props (`control`, `label`, etc.)
- `style?: React.CSSProperties` extension prop on every component for caller overrides

**Row-action reveal** — use a CSS class + global selector, not JS hover state:
```css
/* in index.css */
tr:hover .row-actions { opacity: 1; }
.row-actions { opacity: 0; transition: opacity 0.15s; }
```

## Icon component pattern

Single `Icon` component with a `name: string` prop and a `switch/case` returning inline SVG.
Add new icons by appending cases — no external icon library needed for admin UIs.
Always include a `default` case returning a generic circle so unknown names don't crash.

## SVG chart pattern

Hand-rolled SVG charts (no chart library) for zero bundle overhead:
- Animations via CSS keyframes in `index.css` (not inline) — required for `stroke-dashoffset` and `scaleY` transforms on SVG elements
- Hover tooltips via SVG `<rect>` + `<text>` elements positioned with mouse event coords
- Multi-series: accept `series: { name, data, color }[]` + `labels: string[]`

## Steps

1. **Inventory** — list every distinct visual element from the design. Group into: primitives, charts, layout, pages.
2. **Write primitives** — one file per component in `components/primitives/`. Export all from `index.ts`.
3. **Write charts** — one file per chart in `components/charts/`. Export all from `index.ts`.
4. **Write layout** — `Sidebar`, `Topbar`, `AppShell`, any global modals.
5. **Write pages** — one file per route. Import from primitives/charts; consume mock data from `data/index.ts`.
6. **Type-check after each layer** — run `tsc --noEmit` after primitives, after charts, after layout, after pages. Fix errors before moving to the next layer.

## Review checklist

- Build order was followed — no page imports a component that didn't exist when the page was written.
- Every color and radius reads from `t`/`r`; no hex literals or hardcoded pixel radii in components.
- Controlled/uncontrolled dual support on all form inputs.
- `checked` (not `value`) on Toggle and Checkbox.
- `tsc --noEmit` clean at each layer boundary.
- SVG chart keyframe animations are in `index.css`, not inline styles.

## Memory update guidance

Record the component inventory list in `ai-memory/project-config.md` so future sessions know what exists. Do not record implementation details — the code is the source of truth.

## Quality Gate

Gates: Code, Tests (if applicable)
- `tsc --noEmit` clean.
- No hardcoded color hex values or pixel radii in component files.
- All components in `primitives/index.ts` are re-exported — no orphaned files.
- Page components render without runtime errors for the default mock data.

See `core/rules/quality-gates.md` → Code dimension.

## Done When

- All layers (primitives → charts → layout → pages) are complete and type-check clean.
- Each component reads tokens from `useTheme()`.
- Pages render correctly with mock data at default theme settings.
- `npm run build` succeeds with no errors.
