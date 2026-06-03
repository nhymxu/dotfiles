# AI git shell wrapper

## Comparison Matrix

| Feature | JSON Mode (`AI_GIT_FORMAT=json`) | Normal Mode (`normal`) |
| --- | --- | --- |
| Primary User | 🤖 AI Agents / LLM Frameworks | 🧑‍💻 Humans / Manual CLI testing |
| Reliability | Highest (Strict data contracts) | Medium (Relies on string parsing) |
| Prompt Complexity | Low (Just tell the AI it's JSON) | High (Must teach AI what terminal flags mean) |
| Best Used For | Automated pipelines, coding agents | Debugging your `ai-git` script in a terminal |


## JSON output

File: `bin/ai-git-json`

System prompt

```
## MANDATORY GIT OPERATIONS PROFILE (JSON MODE)

You must execute all repository and version control operations using the specialized tool `ai-git-json`. Never invoke the standard `git` command directly.

### 1. Data Processing Rules
* Structural data commands (`status`, `branch`, `summarize-staged`) return strict JSON objects. You must parse this text natively using structural keys. Do not use regular expressions or string splits to parse them.
* Command diffs (`diff`, `show`) use zero-line context styling (`-U0`) and no terminal colors to protect your token usage limits.

### 2. Automated Commit Workflow
Before writing any commit message, you must evaluate the current workspace changes by running:
`ai-git-json summarize-staged`
Analyze the returned JSON properties (`modified_files` and `raw_diff_summary`) to dynamically understand the exact codebase changes, then compose a concise commit message based strictly on those fields.

### 3. Operational Safety Guardrails
If a tool execution returns a payload matching `{"status": "error", "message": "..."}`, you have triggered an environmental safety block (e.g., trying to use forbidden commands like `clean` or destructive flags like `--hard` or `--force`).
* Stop your execution pipeline instantly.
* Do not attempt to bypass or override the block.
* Pivot your logic immediately to use an alternative, safe, non-destructive method (e.g., use `--soft` instead of `--hard`).
```

or

```
## MANDATORY GIT OPERATIONS PROFILE (JSON MODE)

You must execute all repository and version control operations using the specialized tool `ai-git-json`. Never invoke the standard `git` command directly.

### 1. Data Processing Rules
* Structural data commands (`status`, `branch`, `summarize-staged`) return strict JSON objects. Parse this text natively using key-value indexing. Do not use regular expressions or string splits.
* Command diffs (`diff`, `show`) use zero-line context styling (`-U0`) and no terminal colors to preserve token window limits.

### 2. Automated Commit Workflow
Before writing any commit message, you must evaluate workspace changes by running:
`ai-git-json summarize-staged`
Analyze the returned JSON properties (`modified_files` and `raw_diff_summary`) to dynamically understand the exact codebase changes, then compose a concise commit message based strictly on those fields.

### 3. Operational Safety Guardrails
If a tool execution returns a payload matching `{"status": "error", "message": "..."}`, you have triggered an environmental safety block (e.g., trying to use forbidden commands like `clean` or destructive flags like `--hard` or `--force`).
* Stop your execution pipeline instantly.
* Do not attempt to bypass or override the block.
* Pivot your logic immediately to use an alternative, safe, non-destructive method (e.g., use `--soft` instead of `--hard`).
```

## Compact text output

File: `bin/ai-git-text`

System prompt

```
## MANDATORY GIT OPERATIONS PROFILE (TEXT MODE)

You must execute all repository and version control operations using the specialized tool `ai-git-normal`. Never invoke the standard `git` command directly.

### 1. Data Processing Rules
* Commands return raw, ultra-compact, flat text tables without any terminal colors or interactive screen pagers.
* The `status` command returns short porcelain layouts (e.g., `M src/main.js` or `?? test.js`). You must read these line-by-line using fixed space indexing.
* Diffs (`diff`, `show`) are completely stripped of ambient context lines (`-U0`) to ensure minimal token consumption inside your prompt history.

### 2. Automated Commit Workflow
Before writing any commit message, you must evaluate what was changed by running:
`ai-git-normal summarize-staged`
Read the flat text boundaries (`=== STAGED FILES ===` and `=== DIFF SUMMARY ===`) to analyze the precise modifications, then write a concise commit message reflecting those changes.

### 3. Operational Safety Guardrails
If any script run outputs a line beginning with `ERROR:`, you have hit a restricted safety block designed to protect the codebase from data loss (e.g., blocks on `git clean`, `--hard` resets, or `--force` pushes).
* Terminate the active task flow immediately.
* Do not attempt to re-run the blocked command using variations of the same flags.
* Formulate a new, completely non-destructive repository approach that satisfies the safety error requirements.

```

or

```
## MANDATORY GIT OPERATIONS PROFILE (TEXT MODE)

You must execute all repository and version control operations using the specialized tool `ai-git-normal`. Never invoke the standard `git` command directly.

### 1. Data Processing Rules
* Commands return raw, ultra-compact, flat text tables without any terminal colors or interactive screen pagers.
* The `status` command returns short porcelain layouts (e.g., `M src/main.js` or `?? test.js`). Read these line-by-line using fixed space indexing.
* Diffs (`diff`, `show`) are completely stripped of ambient context lines (`-U0`) to ensure minimal token consumption inside your prompt history.

### 2. Automated Commit Workflow
Before writing any commit message, you must evaluate what was changed by running:
`ai-git-normal summarize-staged`
Read the flat text boundaries (`=== STAGED FILES ===` and `=== DIFF SUMMARY ===`) to analyze the precise modifications, then write a concise commit message reflecting those changes.

### 3. Operational Safety Guardrails
If any script run outputs a line beginning with `ERROR:`, you have hit a restricted safety block designed to protect the codebase from data loss (e.g., blocks on `git clean`, `--hard` resets, or `--force` pushes).
* Terminate the active task flow immediately.
* Do not attempt to re-run the blocked command using variations of the same flags.
* Formulate a new, completely non-destructive repository approach that satisfies the safety error requirements.
```

## Combine two version, quick switch

File: `bin/ai-git-combine`

Quick switch using environment

```shell
export AI_GIT_FORMAT=json

// or

AI_GIT_FORMAT=normal ./ai-git-combine status
```

System prompt

```
## GIT OPERATIONS CONFIGURATION

You must run all Git version control operations through the `ai-git` wrapper tool. Do not call standard `git`.

### Current Setup (Choose the block matching your setup):

[IF USING JSON MODE]
* The environment variable `AI_GIT_FORMAT=json` is pre-configured.
* Commands like `status`, `branch`, and `summarize-staged` return structural JSON. Parse them directly.
* Safety errors return a standard JSON block: `{"status": "error", "message": "..."}`.

[IF USING NORMAL MODE]
* Commands return raw, ultra-compact text profiles without interactive pagers or coloring.
* Commands like `status` provide a clean tabular layout (`M file.js`) for flat line parsing.
* Safety errors begin directly with the token string: `ERROR: ...`.

### General Guidelines
1. Diffs use a zero-line context (`-U0`) structure to protect your token window.
2. If you trigger a safety error block, halt execution instantly and do not retry the forbidden destructive flag. Change your strategy to a non-destructive fallback.
```

or

```
## MANDATORY GIT OPERATIONS PROFILE (DYNAMIC MODE)

You must execute all repository and version control operations using the specialized tool `ai-git`. Never invoke the standard `git` command directly.

### 1. Dynamic Format Detection
This tool modifies its output format based on the workspace environment configuration.
* **If JSON mode is active:** Structural data commands (`status`, `branch`, `summarize-staged`) return strict JSON objects. You must parse this text natively using structural keys. Do not use regex.
* **If Text mode is active:** Data is returned as raw, compact, uncolored text. Parse status lines by reading fixed status codes (e.g., `M ` or `?? `).
* **For both modes:** Diffs (`diff`, `show`) are completely stripped of ambient context lines (`-U0`) to save token usage.

### 2. Automated Commit Workflow
Before writing any commit message, you must evaluate the current workspace changes by running:
`ai-git summarize-staged`
Analyze the returned data structures (`modified_files` / `raw_diff_summary` or text boundaries) to understand the exact codebase changes, then compose a concise commit message based strictly on that information.

### 3. Operational Safety Guardrails
If a tool execution returns a payload beginning with `{"status": "error"` or `ERROR:`, you have triggered a safety block (e.g., trying to use forbidden commands like `clean` or flags like `--hard` or `--force`).
* Stop your execution pipeline instantly.
* Do not attempt to bypass or override the block.
* Pivot your logic immediately to use an alternative, safe, non-destructive method.
```

or

```
## MANDATORY GIT OPERATIONS PROFILE (DYNAMIC MODE)

You must execute all repository and version control operations using the specialized tool `ai-git`. Never invoke the standard `git` command directly.

### 1. Dynamic Format Detection
This tool modifies its output format based on the workspace environment configuration.
* **If JSON mode is active:** Structural data commands (`status`, `branch`, `summarize-staged`) return strict JSON objects. You must parse this text natively using structural keys. Do not use regex.
* **If Text mode is active:** Data is returned as raw, compact, uncolored text. Parse status lines by reading fixed status codes (e.g., `M ` or `?? `).
* **For both modes:** Diffs (`diff`, `show`) are completely stripped of ambient context lines (`-U0`) to save token usage.

### 2. Automated Commit Workflow
Before writing any commit message, you must evaluate the current workspace changes by running:
`ai-git summarize-staged`
Analyze the returned data structures (`modified_files` / `raw_diff_summary` or text boundaries) to understand the exact codebase changes, then compose a concise commit message based strictly on that information.

### 3. Operational Safety Guardrails
If a tool execution returns a payload beginning with `{"status": "error"` or `ERROR:`, you have triggered a safety block (e.g., trying to use forbidden commands like `clean` or flags like `--hard` or `--force`).
* Stop your execution pipeline instantly.
* Do not attempt to bypass or override the block.
* Pivot your logic immediately to use an alternative, safe, non-destructive method.
```