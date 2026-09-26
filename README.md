# claude-rules

르나 공통 작업 규칙의 원본 저장소. 규칙은 `RULES.md`만 고친다.

## 어디에 어떻게 적용되나

| 사용하는 곳 | 방법 | 처음 한 번 | RULES.md를 고친 뒤 |
|---|---|---|---|
| 맥·윈도우 Claude Code (모든 폴더) | `luna-rules` 플러그인이 세션 시작 때 GitHub의 최신 `RULES.md`를 불러옴 | 기기마다 아래 설치 | 자동 (다음 세션부터) |
| 클라우드 세션 | 저장소의 `.claude/settings.json` SessionStart 훅 | 저장소마다 훅 한 줄 | 자동 |
| claude.ai 채팅·코워크 | 개인 선호도의 지시 한 줄 | 완료 | 할 일 없음 |

## 맥·윈도우 설치 (기기마다 한 번)

Claude Code 안에서:

```
/plugin marketplace add fleurien003/claude-rules
/plugin install luna-rules@claude-rules
/plugin install duckdb-skills@claude-rules
/plugin install last30days@claude-rules
```

- `luna-rules`: 공통 규칙 + 공통 스킬(`/luna-rules:stop-slop` 한국어판, `/luna-rules:browser-use`)
- `duckdb-skills`, `last30days`: 원본 저장소에서 바로 받아 설치 (선택)
- 스킬 추가·수정 후 반영하려면 `/plugin` → Marketplaces → claude-rules → Enable auto-update를 켜 둔다.

- 윈도우는 Git Bash가 있어야 한다(Git for Windows).
- 규칙 내용은 매 세션 GitHub에서 새로 받으므로 플러그인 자동 업데이트를 켜지 않아도 된다. 인터넷이 안 되면 플러그인에 들어 있는 사본을 쓴다(이 사본은 `/plugin` → Marketplaces → Enable auto-update를 켜 두면 함께 갱신된다).
- 저장소에 이미 공통 규칙 훅이 있으면 플러그인은 건너뛴다(두 번 들어가지 않음).

## 클라우드 세션·Cowork에서 공통 스킬 쓰기

플러그인은 클라우드 세션에서 설치되지 않는다. `skills/stop-slop` 폴더를 zip으로 묶어 claude.ai 설정의 스킬 메뉴에서 업로드하면 클라우드·Cowork·Claude Code에서 모두 쓸 수 있다.

## 구성

- `RULES.md` — 규칙 원본
- `.claude-plugin/` — 마켓플레이스·플러그인 정의
- `skills/` — 공통 스킬
- `hooks/hooks.json`, `scripts/load-rules.sh` — 세션 시작 때 규칙을 불러오는 훅
