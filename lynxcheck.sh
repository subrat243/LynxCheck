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

# --------------------------------------------------
# System Information
# --------------------------------------------------

system_info() {
    section "SYSTEM INFORMATION"

    info "Hostname : $(hostname)"
    info "OS       : $(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2- | tr -d '"')"
    info "Kernel   : $(uname -r)"
    info "Arch     : $(uname -m)"
    info "Uptime   : $(uptime -p)"
}

# --------------------------------------------------
# User Audit
# --------------------------------------------------

user_audit() {
    section "USER AUDIT"

    local uid0_users
    uid0_users=$(awk -F: '$3 == 0 {print $1}' /etc/passwd)

    if [[ "$uid0_users" == "root" ]]; then
        pass "Only root has UID 0."
    else
        fail "Additional UID 0 accounts found:"
        echo "$uid0_users"
    fi

    local empty_passwords
    empty_passwords=$(awk -F: '$2 == "" {print $1}' /etc/shadow 2>/dev/null)

    if [[ -z "$empty_passwords" ]]; then
        pass "No accounts with empty passwords detected."
    else
        fail "Accounts with empty passwords:"
        echo "$empty_passwords"
    fi

    local login_users
    login_users=$(awk -F: '$7 !~ /(nologin|false)$/ {print $1}' /etc/passwd)

    info "Accounts with interactive shells:"
    echo "$login_users"
}