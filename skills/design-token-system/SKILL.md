---
name: design-token-system
description: Design and implement a composable design token system — color palettes, geometry tokens, and a typed context that components consume without hardcoding values.
tokens: ~450
tier: critical
triggers: design tokens, theme system, color palette, token system, theming, dark mode, light mode, brand colors, typography scale, spacing tokens, design system tokens, composable theme
chains:
  before: [frontend-scaffold, spec-design]
  after: [ui-component-library, feature-implementation]
---

# Skill: design-token-system

## When to use

Use when a UI project needs a configurable appearance system — switchable themes, dark/light modes, brand customization, or per-component geometric variation (border-radius, spacing scale).

## Core principle: separate independent dimensions

Token dimensions that vary independently must be stored separately. Mixing them (e.g. hardcoding border-radius inside a color theme) forces full rebuilds when only one dimension changes.

Common independent dimensions:

| Dimension | Examples | Governs |
|---|---|---|
| Mood / brand | warm, cool, pastel, mono | Color palettes |
| Mode | light, dark | Background/text contrast |
| Geometry | sharp, rounded, pill | Border-radius scale |
| Density | compact, default, spacious | Spacing/padding scale |

## Steps

1. **Identify dimensions** — list every visual property that needs to vary independently. Name each axis (mood, mode, corners, density).
2. **Define the Token interface** — write `tokens/types.ts` with a `Theme` interface covering all color tokens, and a `Radii` interface covering all radius stops (`xs`, `sm`, `md`, `lg`, `full`).
3. **Choose generator vs. static** — prefer a `buildTheme(mood, mode): Theme` generator function over a static lookup record when dimensions multiply (4 moods × 2 modes = 8 combinations from 8 palette objects; a static record would need 8 hand-crafted entries growing to N×M).
4. **Define palette objects** — write one dark-variant and one light-variant per mood. Each variant contains only color tokens; geometry is separate.
5. **Define geometry table** — write `RADII: Record<Corners, Radii>` mapping each corners variant to concrete pixel values.
6. **Define named presets** — expose `PRESETS` as shortcuts over dimension combinations (e.g. `{ label: 'Dark Pro', mood: 'cool', mode: 'dark', corners: 'sharp' }`). Presets are convenience wrappers, not replacements for the underlying dimensions.
7. **Wire context** — `ThemeContext` holds `mood`, `mode`, `corners`, `density` as state; derives `theme` and `r` (radii) on each render; exposes all via `useTheme()`.
8. **Verify** — every component that previously hardcoded a color or radius now reads from `t` or `r`.

## Naming conventions

- Color tokens: semantic names, not palette positions — `t.accent`, `t.danger`, `t.cardBorder`, not `t.blue500`.
- Radius tokens: size stops — `r.xs`, `r.sm`, `r.md`, `r.lg`, `r.full`.
- Soft variants: `t.accentSoft`, `t.dangerSoft` — background fills at low opacity, paired with their full-saturation foreground.

## Review checklist

- No component hardcodes a hex color or pixel radius that should vary by theme.
- `buildTheme` is pure — same inputs always produce the same output.
- `Radii` and `Theme` are in separate interfaces — geometry and color are not merged.
- Named presets exist as shortcuts but the raw dimensions are also individually settable.
- Context default values produce a valid render without localStorage or user interaction.

## Memory update guidance

Record the chosen dimensions and their default values in `ai-memory/project-config.md`. Do not record the full palette data — that is derivable from the code.

## Quality Gate

Gates: Code, Architecture
- `tsc --noEmit` clean.
- `buildTheme` has no side effects.
- No circular imports: `tokens/` must not import from `context/` or `components/`.
- Every token in `Theme` is used by at least one component — no dead tokens.

See `core/rules/quality-gates.md` → Code, Architecture dimensions.

## Done When

- `tokens/types.ts`, `tokens/themes.ts`, and `context/ThemeContext.tsx` are complete.
- `useTheme()` returns `{ theme: t, r, mood, mode, corners, density }` or equivalent.
- At least one component has been updated to consume `t` and `r` to confirm the API works.
- `tsc --noEmit` is clean.
