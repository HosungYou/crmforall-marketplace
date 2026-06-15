# crmforall 플러그인 마켓플레이스

크렘포올(반려동물 약국 카카오 CRM)의 Claude Code 플러그인 마켓플레이스입니다.

## 설치 (Claude Code)

```text
/plugin marketplace add HosungYou/crmforall-marketplace
/plugin install crmforall-connector@crmforall
```

설치하면 **커넥터 MCP 서버가 자동 등록**되고 슬래시 커맨드가 추가됩니다 — `claude mcp add`를
따로 칠 필요가 없어요.

## 플러그인: crmforall-connector

고객사 DB를 **읽기 전용**으로 연결해 발송 대상을 서버 안에서 계산하는 커넥터.
AI로 진단·연결·매핑·실시간 동기화를 진행합니다.

### ① 연결 (한 번, 터미널에서)

자격증명이 오가는 단계라 사람이 직접 실행합니다(대화형 마법사):

```bash
npx @crmforall/connect init --token=<설치토큰> --platform-url=https://crmforall-console.vercel.app
```

- `<설치토큰>`: 콘솔 → 운영 → 데이터 연결 → "우리 서버에 DB가 있어요" → 안내 링크에 포함
- 호스트·DB·계정·비밀번호(가림)를 한 줄씩 입력 → `~/.crmforall/connector.json` 저장

![연결 마법사](./assets/connector-init.gif)

### ② 슬래시 커맨드로 운전

| 커맨드 | 설명 |
|---|---|
| `/crmforall-onboard` | 진단→연결 확인→스키마→필드 매핑을 대화로 진행 |
| `/crmforall-sync` | 발송 결과 동기화 (`sync_all`) |
| `/crmforall-doctor` | 연결·권한·스키마 진단 |

![AI 온보딩·동기화](./assets/connector-ai.gif)

## 보안

- 데이터는 고객사 서버에 머뭅니다(원본 비유출). 플랫폼엔 인원수·집계·해시만.
- 읽기 전용 강제 — 과권한 계정은 활성화 차단.
- 발송·쓰기 도구는 콘솔의 사람 승인 토큰이 있어야만 실행.

자세한 가이드: https://crmforall-console.vercel.app/docs/dev/connector

## 라이선스

UNLICENSED (비공개) — 펫코팜/크렘포올 전용. 마켓플레이스 메타데이터만 공개됩니다.
