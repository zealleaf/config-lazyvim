local M = {}

M.commit_message = [[
Generate two Conventional Commit messages (one English, one Chinese) for the provided git diff, strictly following these rules:

English Message:
1. Format: <type>(<scope>): <description>
2. Common types: fix, feat, docs, style, refactor, test, chore
3. Scope should be the most relevant module/component when applicable
4. Description must be concise and imperative (e.g., "fix" not "fixed")

Chinese Message:
Consistent with the English message, but the description needs to be in Chinese.  

Reference the last 20 commits for consistent scope naming:

Recent commits:
```
%s
```

Git diff:
```diff
%s
```

Output format:
<English Message>
<Chinese Message>

Output only the commit messages with no additional text or explanations.]]

return M
