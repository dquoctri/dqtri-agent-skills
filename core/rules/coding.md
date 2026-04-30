# Coding Rules

These coding rules apply during implementation, debugging, refactoring, tests, review, and architecture work. They are built around four principles that counter common agent failure modes: hidden assumptions, overengineering, unrelated edits, and unverifiable progress.

## Principle 1: Think Before Coding

Do not assume. Do not hide confusion. Surface tradeoffs.

- Read the relevant project code before changing it.
- Follow the project's existing language, framework, naming, formatting, and file organization conventions.
- State assumptions when they affect the implementation.
- If the request has multiple plausible interpretations, present them instead of silently picking one.
- Ask when missing information would make the change risky.
- Push back when the requested approach is likely to create avoidable complexity or break existing behavior.
- Treat current user instructions, project instructions, source code, tests, and memory as inputs to reconcile, not as excuses to guess.

## Principle 2: Simplicity First

Write the minimum code that solves the problem. Add nothing speculative.

- Prefer clear, direct code over clever code.
- Do not add features beyond what was asked.
- Do not add abstractions for single-use code.
- Do not add configurability, extension points, or generic helpers unless the current task needs them.
- Do not add error handling for impossible scenarios; do handle realistic failure paths.
- If the implementation is much larger than the problem, simplify it before calling it done.
- Start with the simplest implementation that fits the existing codebase.
- Add an abstraction only when it removes real duplication, isolates a real boundary, or clarifies a repeated concept.
- Prefer existing project utilities and patterns over new abstractions.

## Principle 3: Surgical Changes

Touch only what the task requires. Clean up only what your change makes necessary.

- Preserve public behavior unless the task explicitly asks for a behavior change.
- Keep edits scoped to the requested outcome.
- Avoid unrelated rewrites, opportunistic cleanup, broad formatting churn, and dependency changes.
- Do not refactor adjacent code just because it looks imperfect.
- Do not change comments or code you do not understand when they are orthogonal to the task.
- Match existing style, even when you would normally write it differently.
- Remove imports, variables, functions, or files that your change made unused.
- Mention pre-existing dead code when useful, but do not remove it unless asked.
- Every changed line should trace back to the user's request or to verification needed for that request.

## Principle 4: Goal-Driven Execution

Convert tasks into verifiable outcomes and loop until they are verified.

- Define success criteria before implementing non-trivial changes.
- For behavior changes, add or update tests when practical.
- For bug fixes, prefer a regression test that fails before the fix and passes after it.
- For refactors, verify behavior before and after when possible.
- Prefer focused tests that verify externally visible behavior.
- Cover regressions, edge cases, and error paths when they are relevant to the change.
- Do not add brittle tests that only mirror implementation details unless the implementation detail is the contract.
- Report what verification was run, what failed, and what could not be run.

## Readability

- Use names that describe the domain concept or program responsibility.
- Keep functions and modules focused on one coherent job.
- Make control flow easy to follow.
- Prefer explicit data flow over hidden global state.
- Add comments only for non-obvious intent, constraints, or tradeoffs.
- Remove dead or misleading comments only when your change makes them wrong or irrelevant.
