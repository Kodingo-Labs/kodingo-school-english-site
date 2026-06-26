#!/bin/bash
# ═══════════════════════════════════════════════════════════════
# serve.sh — Servidor local de desarrollo
# Uso: bash serve.sh
#      PORT=9090 bash serve.sh
# ═══════════════════════════════════════════════════════════════

if [ -z "$BASH_VERSION" ]; then
  echo "Error: usa 'bash serve.sh', no 'sh serve.sh'"
  exit 1
fi

set -e

SITE_DIR="$(cd "$(dirname "$0")" && pwd)"
PORT="${PORT:-8080}"

BOLD='\033[1m'; NC='\033[0m'
GREEN='\033[0;32m'; CYAN='\033[0;36m'; DIM='\033[2m'

echo ""
echo -e "${CYAN}${BOLD}╔══════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}${BOLD}║   🖥️  Servidor local — kodingo-school-site           ║${NC}"
echo -e "${CYAN}${BOLD}╚══════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "  ${GREEN}✓ ${BOLD}http://localhost:${PORT}${NC}"
echo -e "  ${DIM}Ctrl+C para detener${NC}"
echo ""

# Abre el browser si hay uno disponible
if command -v open &>/dev/null; then
  open "http://localhost:${PORT}" &
elif command -v xdg-open &>/dev/null; then
  xdg-open "http://localhost:${PORT}" &
fi

cd "$SITE_DIR"
python3 -m http.server "$PORT"
