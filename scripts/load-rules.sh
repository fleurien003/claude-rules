#!/usr/bin/env bash
# SessionStart 훅: 공통 규칙(RULES.md)을 출력한다. 출력이 곧 Claude의 컨텍스트가 된다.
# 저장소에 이미 공통 규칙 훅이 있으면 두 번 넣지 않도록 건너뛴다.
if grep -qs "fleurien003/claude-rules" "${CLAUDE_PROJECT_DIR:-.}/.claude/settings.json"; then
  exit 0
fi
# GitHub의 최신본을 먼저 쓰고, 실패하면 플러그인에 들어 있는 사본을 쓴다.
curl -fsSL --max-time 5 https://raw.githubusercontent.com/fleurien003/claude-rules/main/RULES.md \
  || cat "${CLAUDE_PLUGIN_ROOT}/RULES.md"
