---
description: 크렘포올 커넥터 온보딩 — DB 진단→연결 확인→스키마 검토→필드 매핑까지 대화로 진행
---

크렘포올 커넥터 MCP를 사용해 온보딩을 순서대로 진행해줘.

1. `onboarding_status`로 현재 단계와 다음 할 일을 확인한다.
   - 만약 아직 설정(연결)이 없다고 하면, 사용자에게 **터미널에서** 다음을 먼저 실행하라고 안내하고 멈춘다:
     `npx @crmforall/connect init --token=<설치토큰> --platform-url=https://crmforall-console.vercel.app`
     (설치 토큰은 콘솔 → 운영 → 데이터 연결 → "우리 서버에 DB가 있어요" → 안내 링크에서 받음)
2. `test_connection`으로 연결·권한을 점검한다. 과권한이면 출력된 축소 SQL을 사용자에게 전달한다.
3. `inspect_schema`로 테이블·컬럼을 살핀다.
4. `propose_field_mapping`으로 표준 필드 매핑 후보를 만든다.
5. 사용자에게 매핑 후보를 사람이 읽기 쉽게 요약해 보여주고 확인을 받는다.
6. 확인되면 `validate_mapping`을 persist=true로 호출해 확정한다.

원칙: 비밀번호·개인정보 원문은 절대 출력하지 않는다. 각 단계 결과를 짧게 요약하고, 다음 단계를 안내한다.
