---
name: switch-opencode-models
description: "Switches all OpenCode models between provider modes (cheap_go, cheap_openrouter). Reads model mappings from my_models.toml and updates opencode.jsonc and oh-my-openagent.jsonc."
---

# Switch OpenCode Models

Switches all OpenCode models between provider modes.

## Source of Truth

Model mappings are in `targets/opencode/my_models.toml` under `[modes]`.

## Modes

- `cheap_go` — OpenCode Go provider (daily use, subscription)
- `cheap_openrouter` — OpenRouter/DeepSeek API (fallback when Go credits run out)

## Files to Modify

1. `targets/opencode/opencode.jsonc` — agents: DeepBro, DeepJunior, Confucius, DeepTerminal, Queen, Kong, Magician
2. `targets/opencode/oh-my-openagent.jsonc` — subagents + categories

## Procedure

1. Read `targets/opencode/my_models.toml`
2. Identify the target mode section: `[modes.cheap_go]` or `[modes.cheap_openrouter]`
3. For each agent in `opencode.jsonc`:
   - Look up the agent's model name in `[agents]`
   - Look up the model ID in the target `[modes]` section
   - Replace the `"model": "..."` value
4. For each subagent in `oh-my-openagent.jsonc`:
   - Look up the subagent's model name in `[agents]`
   - Look up the model ID in the target `[modes]` section
   - Replace the `"model": "..."` value
5. For each category in `oh-my-openagent.jsonc`:
   - Look up the category's model name in `[categories]`
   - Look up the model ID in the target `[modes]` section
   - Replace the `"model": "..."` value

## Verification

After switching, verify:

1. Both config files exist:
   ```
   ls -la targets/opencode/opencode.jsonc
   ls -la targets/opencode/oh-my-openagent.jsonc
   ```

2. Symlinks are correct:
   ```
   ls -la ~/.config/opencode/opencode.jsonc
   ls -la ~/.config/opencode/oh-my-openagent.jsonc
   ```
   Both should point to `targets/opencode/`

3. No model IDs from the old mode remain:
   ```
   grep -o '"opencode-go/[^"]*"' targets/opencode/opencode.jsonc
   grep -o '"opencode-go/[^"]*"' targets/opencode/oh-my-openagent.jsonc
   ```
   If switching TO cheap_openrouter, these should NOT appear (except maybe Magician/Zen).
   If switching TO cheap_go, these SHOULD appear.

4. Config is valid JSON (no trailing commas, no syntax errors):
   ```
   python3 -c "import json; json.load(open('targets/opencode/opencode.jsonc'.replace('.jsonc','.json')))" 2>&1 || echo "Check JSON syntax"
   ```
   Note: JSONC has comments, so basic syntax check is sufficient.
