---
name: performance-review
description: Investigate and review latency, throughput, memory, bundle size, rendering, query performance, and other measurable bottlenecks.
---

# Skill: performance-review

## When to use

Use for performance investigation, optimization planning, or review of changes that affect latency, throughput, memory, bundle size, or rendering.

## Inputs to check

- Performance goal, baseline, measured symptoms, and affected path.
- Hot code paths, queries, network calls, rendering paths, caches, and build output.
- Existing performance budgets, metrics, and verification commands.

## Steps

1. Define the metric and acceptable target.
2. Measure or inspect the current bottleneck.
3. Prefer simple high-impact fixes over speculative micro-optimizations.
4. Verify with before/after evidence when practical.
5. Record remaining tradeoffs or follow-up risks.

## Review checklist

- Optimization is tied to a real bottleneck or budget.
- Correctness and readability are preserved.
- No unbounded work, N+1 calls, or avoidable waterfalls were introduced.
- Verification includes a relevant measurement or proxy.

## Memory update guidance

Update memory for durable performance budgets, known bottlenecks, or accepted tradeoffs. Do not store bulky benchmark logs.

## Done When

- Performance claim is tied to a metric, budget, or observed bottleneck.
- Relevant measurement or proxy verification is recorded.
- Diff was reviewed for correctness, readability, and scope.
- Durable learning was recorded only if useful.
- Any skill improvement was proposed, not auto-applied.
