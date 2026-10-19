#!/bin/bash

# LynxCheck - Linux Security Audit Tool
# A simple Bash-based security auditing script.

VERSION="1.0"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

PASS=0
WARN=0
FAIL=0

print_header() {
    echo
    echo "=============================================="
    echo "              LynxCheck v$VERSION"
    echo "        Linux Security Audit Tool"
    echo "=============================================="
    echo
}

section() {
    echo
    echo -e "${BLUE}[$1]${NC}"
    echo "----------------------------------------------"
}

pass() {
    echo -e "${GREEN}[PASS]${NC} $1"
    ((PASS++))
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
    ((WARN++))
}

fail() {
    echo -e "${RED}[FAIL]${NC} $1"
    ((FAIL++))
}

info() {
    echo -e "[INFO] $1"
}

check_root() {
    if [[ $EUID -ne 0 ]]; then
        echo -e "${YELLOW}[!] Run this script as root for complete results.${NC}"
        echo
    fi
}