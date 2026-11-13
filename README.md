# LynxCheck

**LynxCheck** is a lightweight Bash-based Linux security auditing tool designed to inspect system configurations and identify common security issues.

The project aims to simplify basic Linux security assessments by checking user accounts, system configurations, permissions, and other security-related settings.

> **Project Status:** Work in Progress (WIP)

## Overview

LynxCheck is being developed as a command-line security auditing tool for Linux systems. It performs basic security checks and displays findings using color-coded status indicators.

The goal is to build a simple, modular, and extensible tool that helps users understand their Linux system's security posture.

## Current Features

The following features are currently implemented:

- **System Information**
  - Hostname
  - Operating system
  - Kernel version
  - System architecture
  - System uptime

- **User Security Audit**
  - Identify accounts with UID 0
  - Detect accounts with empty password fields
  - List accounts with interactive login shells

## Planned Features

The following modules are planned for future development:

- [ ] SSH configuration auditing
- [ ] File and directory permission checks
- [ ] SUID/SGID binary auditing
- [ ] Running services inspection
- [ ] Firewall configuration checks
- [ ] Network configuration auditing
- [ ] Kernel security parameters
- [ ] Password policy assessment
- [ ] System logging and monitoring checks
- [ ] Cron job auditing
- [ ] Security recommendations
- [ ] Audit report generation

## Requirements

- Linux operating system
- Bash
- Standard Linux utilities:
  - `awk`
  - `grep`
  - `hostname`
  - `uname`
  - `uptime`

Root privileges are recommended for accessing restricted system information and obtaining more complete audit results.

## Installation

Clone the repository:

```bash
git clone https://github.com/USERNAME/LynxCheck.git
```

Navigate to the project directory:

```bash
cd LynxCheck
```

Make the script executable:

```bash
chmod +x lynxcheck.sh
```

## Usage

Run the script:

```bash
sudo ./lynxcheck.sh
```

Root privileges are recommended for more complete results.

## Output Indicators

LynxCheck uses color-coded indicators to categorize audit findings.

| Indicator | Meaning |
|---|---|
| PASS | Check passed |
| WARN | Potential security concern |
| FAIL | Security issue detected |
| INFO | Informational system details |

These indicators represent preliminary audit findings and should not be treated as definitive vulnerability assessments.

## Project Structure

```text
LynxCheck/
├── lynxcheck.sh
└── README.md
```

The project structure may expand as additional audit modules are developed.

## Development Goals

- Keep the tool lightweight and easy to use.
- Use native Linux utilities wherever possible.
- Organize checks into independent functions.
- Provide clear and readable audit results.
- Avoid modifying system configurations during audits.
- Gradually expand security checks and reporting capabilities.

## Disclaimer

LynxCheck is an educational cybersecurity project currently under development.

It is intended for authorized security auditing and system assessment. The tool does not currently perform a comprehensive security assessment and may produce incomplete findings.

Always review audit results manually before making security-related changes.
