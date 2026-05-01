# 🧠 Prompt, Context, Agent & Harness Engineering

*A Practical Guide for Developers & AI Builders*

## 1. What is a Prompt?

A prompt is the entire text input sent to a language model.

### Core Components

-   Instruction
-   Context
-   Input Data
-   Output Format

### Supporting Components

-   Role
-   Examples
-   Constraints

## 2. System vs User Prompts

-   System Prompt: global rules
-   User Prompt: task-specific input

## 3. Prompt Quality

### Vague

Summarize this text

### Specific

You are a high school teacher. Summarize in 3--5 simple sentences.

## 4. Prompt Engineering

Designing prompts to maximize model performance.

### Principles

-   Be specific
-   Use few-shot examples

## 5. Context

Context = everything the model sees: - Messages - Tools - Memory - Files

## 6. Context Engineering

Fill context with the right information only.

### Techniques

-   Balanced system prompt
-   Just-in-time loading
-   Summarization

## 7. Agent

An AI system using a model + tools + loop.

## 8. Harness

Execution environment enabling real-world actions.

### Components

-   Agent loop
-   Permissions
-   Sandbox
-   Verification
-   Tools
-   Context management
-   Memory

## 9. Harness Engineering

Optimizing the system around the model.

### Levers

-   Hooks
-   Sub-agents
-   Slash commands
-   Durable context

## 10. Examples

-   Pre-commit lint hook
-   Sub-agent reviewer

## 11. Optimization Levels

-   Prompt Engineering
-   Context Engineering
-   Harness Engineering

## 12. Key Takeaways

-   Prompt quality matters
-   Context is critical
-   Harness is the bottleneck

## 13. Mental Model

Model = Brain\
Prompt = Instructions\
Context = Perception\
Harness = Body\
Agent = System
