# crmforall 플러그인 마켓플레이스

[![도입 약국](https://img.shields.io/endpoint?url=https%3A%2F%2Fcrmforall-console.vercel.app%2Fapi%2Fstats%2Fbadge%3Fmetric%3Dpharmacies)](https://crmforall-console.vercel.app)
[![누적 발송 캠페인](https://img.shields.io/endpoint?url=https%3A%2F%2Fcrmforall-console.vercel.app%2Fapi%2Fstats%2Fbadge%3Fmetric%3Dcampaigns)](https://crmforall-console.vercel.app)
[![npm](https://img.shields.io/npm/v/@crmforall/connector?label=connector)](https://www.npmjs.com/package/@crmforall/connector)

크렘포올(반려동물 약국 카카오 CRM)의 Claude Code 플러그인 마켓플레이스입니다.

> 상단 배지는 **실제 도입 수치로 자동 갱신**됩니다(데이터가 없으면 '베타'로 표시 — 가짜 수치를 넣지 않습니다).

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
npx @crmforall/connect login   # 브라우저 코드 승인 1회 (머신당 1회)
npx @crmforall/connect init    # 호스트·DB·계정·비밀번호(가림) 입력 → 등록까지 자동
```

- 비밀번호는 입력창으로 받아 `~/.crmforall/connector.json`(0600)에만 저장 — 모델에 노출 안 됨.
- **디바이스 승인은 머신당 1회**: 로그인 직후 신원이 저장돼, DB 연결 전 중단·재시작해도 재승인 없이 이어집니다(resume, 0.1.19+).
- 전산담당자가 분리됐으면 토큰 경로도 가능: `init --token=<설치토큰> --platform-url=https://crmforall-console.vercel.app` (토큰은 콘솔에서 발급).
- 터미널 없이 **Claude 세션 안에서** 연결할 수도 있어요: `setup_login` → `setup_database`.

![연결 마법사](./assets/connector-init.gif)

### ② 슬래시 커맨드로 운전

| 커맨드 | 설명 |
|---|---|
| `/crmforall-connector:onboard` | 진단→연결 확인→스키마→필드 매핑을 대화로 진행 |
| `/crmforall-connector:sync` | 발송 결과 동기화 (`sync_all`) |
| `/crmforall-connector:doctor` | 연결·권한·스키마 진단 |

`onboard`는 결정 지점에서 **선택지 카드(AskUserQuestion)**로 물어요 — ① 연결 방법 · ② 과권한 대응 · ③ 매핑 확정 · ④ 다음 단계.

![AI 온보딩·동기화](./assets/connector-ai.gif)

> 재현 데모: `/crmforall-connector:onboard` → 진단·매핑 → **매핑 확정 선택지 카드** → 고객 규모 요약 → 다음 단계 선택.

## 보안

- 데이터는 고객사 서버에 머뭅니다(원본 비유출). 플랫폼엔 인원수·집계·해시만.
- 읽기 전용 강제 — 과권한 계정은 활성화 차단.
- 발송·쓰기 도구는 콘솔의 사람 승인 토큰이 있어야만 실행.

자세한 가이드: https://crmforall-console.vercel.app/docs/dev/connector

## 라이선스

UNLICENSED (비공개) — 펫코팜/크렘포올 전용. 마켓플레이스 메타데이터만 공개됩니다.
