#!/usr/bin/env bash
# 재현 데모(실제 자격증명·데이터 미사용) — crmforall 커넥터 AI 온보딩 흐름.
# Claude Code 세션에서 /crmforall-connector:onboard 실행 → 단계 진행 →
# 결정 지점에서 AskUserQuestion 선택지 카드가 뜨는 모습을 재현한다.
# vhs(connector-ai.tape)가 이 스크립트를 실행해 connector-ai.gif로 녹화한다.
set -u
G=$'\033[38;5;71m'   # green
B=$'\033[38;5;111m'  # blue
D=$'\033[38;5;245m'  # dim
Y=$'\033[38;5;179m'  # yellow
BOLD=$'\033[1m'
R=$'\033[0m'

clear
sleep 0.4

# 사용자가 온보딩 명령을 입력 (타이핑 효과)
printf "%s❯%s " "$B" "$R"
cmd="/crmforall-connector:onboard"
for ((i=0; i<${#cmd}; i++)); do printf "%s" "${cmd:$i:1}"; sleep 0.035; done
printf "\n\n"
sleep 0.6

step() { printf "  %s·%s %s … " "$D" "$R" "$1"; sleep 0.45; printf "%s%s%s\n" "$G" "$2" "$R"; sleep 0.35; }
step "onboarding_status" "✓ 연결됨 (읽기 전용 계정)"
step "test_connection" "✓ 연결·권한 정상"
step "inspect_schema" "members, reservations 발견"
printf "  %s·%s propose_field_mapping …\n\n" "$D" "$R"; sleep 0.5

printf "    %s표준 필드%s            %s감지된 컬럼%s\n" "$BOLD" "$R" "$BOLD" "$R"
printf "    customer.id          members.id\n"
printf "    customer.phone       members.phone %s(해시)%s\n" "$D" "$R"
printf "    customer.consent     members.sms_agree\n"
printf "    reservation.at       reservations.booked_at\n\n"
sleep 1.0

rule() { printf "  %s──────────────────────────────────────────────%s\n" "$D" "$R"; }

# AskUserQuestion 카드 #1 — 매핑 확정
rule
printf "  %s%s 매핑 확정 %s\n" "$Y" "$BOLD" "$R"
printf "   제안된 표준 필드 매핑을 확정할까요?\n\n"
printf "     %s%s❯ 제안대로 확정 (권장)%s\n" "$G" "$BOLD" "$R"
printf "       일부 필드 수정 후 확정\n"
printf "       컬럼별 상세 먼저 보기\n"
rule
sleep 2.0
printf "   %s↵ 제안대로 확정%s\n\n" "$G" "$R"
sleep 0.8

step "validate_mapping(persist=true)" "✓ 매핑 확정"
printf "  %s·%s audience_summary …\n\n" "$D" "$R"; sleep 0.5
printf "    %s고객 1,240명%s · 발송 동의 %s980명%s · 발송 가능 후보 %s612명%s\n\n" "$BOLD" "$R" "$BOLD" "$R" "$BOLD" "$R"
sleep 1.2

# AskUserQuestion 카드 #2 — 다음 단계
rule
printf "  %s%s 다음 단계 %s\n" "$Y" "$BOLD" "$R"
printf "   고객 규모를 확인했습니다. 다음으로 무엇을 할까요?\n\n"
printf "     %s%s❯ 대상 스냅샷 만들기%s\n" "$G" "$BOLD" "$R"
printf "       실시간 동기화 설정\n"
printf "       여기서 종료\n"
rule
sleep 2.6
