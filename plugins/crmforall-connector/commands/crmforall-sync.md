---
description: 크렘포올 발송 결과 동기화 — 진행 중 발송 작업 결과를 CRM 스키마로 반영
---

크렘포올 커넥터 MCP의 `sync_all` 도구를 호출해 진행 중인 발송 작업 결과를 동기화하고,
동기화된 건수와 남은(진행 중) 건수를 요약해줘.

지속적으로 자동 동기화하려면 사용자에게 터미널에서 다음을 띄우라고 안내해:
`npx @crmforall/connect sync --watch --interval=300`
