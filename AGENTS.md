# crmforall-marketplace

크렘포올(반려동물 약국 카카오 CRM) Claude Code 플러그인 마켓플레이스. 고객사 DB를
읽기 전용으로 연결하는 `crmforall-connector` MCP 플러그인을 배포하는 매니페스트+문서 repo.
실제 커넥터 실행 코드(`@crmforall/connector` npm 패키지)는 이 repo 밖에 있다.

## 구조

- `plugins/crmforall-connector/` — 플러그인 정의
  - `.claude-plugin/plugin.json` — 마켓플레이스 메타데이터(버전·설명)
  - `.mcp.json` — `npx -y @crmforall/connector`로 MCP 서버 등록
  - `commands/{onboard,doctor,sync}.md` — 슬래시 커맨드 프롬프트 3종
- `assets/` — README 배지·데모 GIF·스크린샷 소스
- `README.md` — 설치 안내(정본), 마케팅/거래성 메시지 판정 규칙, 보안 원칙

## 핵심 명령

빌드/테스트 명령 없음 — 순수 매니페스트+문서 repo(package.json 없음). 설치는 사용자가
Claude Code에서 직접 실행:

```text
/plugin marketplace add HosungYou/crmforall-marketplace
/plugin install crmforall-connector@crmforall
```

## 경계

- README 상단 배지는 **실제 도입 수치 자동 갱신**(데이터 없으면 '베타') — 가짜 수치 삽입 금지.
- 원문 전화번호·DB 비밀번호는 어떤 문서·커밋에도 출력 금지(인원수·해시만).
- 발송/스냅샷 생성 도구는 콘솔의 사람 승인 토큰 없이는 동작하지 않음 — 이 repo에서 그 게이트를 우회하는 문서 작성 금지.
- 라이선스 UNLICENSED(비공개) — 마켓플레이스 메타데이터만 공개.

시스템 전체 지도: ~/DevVault/Syntheses/superhuman 시스템 지도.md (DEC-20260728-17)
