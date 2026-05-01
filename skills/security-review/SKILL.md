---
name: security-review
description: Review designs or code for practical security risks across auth, authorization, input handling, secrets, logs, dependencies, and integrations.
tokens: ~550
tier: optional
triggers: security, auth, authorization, vulnerability, threat, input validation, secrets, injection, OWASP
---

# Skill: security-review

## When to use

Use for security-focused design review, code review, threat analysis, or hardening.

## Inputs to check

- Auth, authorization, input handling, secrets, logs, dependencies, and external integrations.
- Data sensitivity, trust boundaries, user roles, and exposed endpoints.
- Existing security conventions and project memory.

## Steps

1. Identify assets, actors, trust boundaries, and entry points.
2. Check input validation, output encoding, authz, secrets, and logging.
3. Look for practical exploit paths, not only theoretical concerns.
4. Classify findings by severity and impact.
5. Recommend concrete mitigations and verification checks.

## Review checklist

- Findings are actionable and severity-labeled.
- Critical and high risks include exploit scenario or impact.
- Recommendations do not disable security controls.
- Secrets are not repeated in output or memory.

## Memory update guidance

Update memory only for durable security constraints or approved hardening decisions. Do not store secrets, raw vulnerable payloads, or sensitive logs.

## Done When

- Practical risks are severity-labeled and actionable.
- Verification or mitigation checks are named where relevant.
- Diff was reviewed for secrets, auth boundaries, and unrelated changes.
- Durable learning was recorded only if useful.
- Any skill improvement was proposed, not auto-applied.
