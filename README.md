# Born2beRoot

The **Born2beRoot** project is part of the 42 curriculum and focuses on setting up a secure and functional server following specific rules. It provides an introduction to system administration by configuring a virtual machine and implementing security measures.

## Project Overview

- **Operating System:** Install either the latest stable version of Debian (recommended) or Rocky Linux.
- **Partitioning:** Set up at least 2 encrypted partitions using LVM.
- **User Management:** Create users with strict password policies and configure sudo.
- **Security Measures:** Implement SSH, firewall settings, and SELinux (Rocky) or AppArmor (Debian).
- **Monitoring Script:** Develop a bash script to monitor and display server information at regular intervals.

## Project Requirements

### Operating System
- Use the latest stable version of **Debian** or **Rocky Linux**.
- Install without a graphical interface (X.org is forbidden).
- For Rocky, SELinux must be running and configured; for Debian, AppArmor must be active at startup.

### Partitioning
- Configure at least **2 encrypted partitions** using LVM:
    - Example setup: system files and user data split into separate partitions.

### SSH Configuration
- SSH must run on **port 4242**.
- Disable root login via SSH for security reasons.
- Configure SSH to test new accounts during the evaluation.

### Firewall
- Use **UFW** for Debian or **firewalld** for Rocky.
- Only allow **port 4242**.
- Ensure the firewall is active when the system boots.

### Hostname and User Setup
- The hostname must be your login ending with **42** (e.g., `username42`).
- Create a user with your login:
    - The user must belong to the **user42** and **sudo** groups.

### Password Policy
Configure a **strong password policy**:
- Password expires every **30 days**.
- Minimum **2 days** required before a password can be changed.
- Display a warning **7 days** before password expiration.
- Password must:
    - Be at least **10 characters long**.
    - Contain an uppercase letter, a lowercase letter, and a number.
    - Not contain more than **3 consecutive identical characters**.
    - Exclude the username.
    - Differ significantly from the previous password (root excluded).
- Change all passwords after configuring the policy.

### Sudo Configuration
Enforce secure **sudo** usage with the following rules:
- Limit authentication attempts to **3**.
- Display a custom error message for incorrect passwords.
- Archive all sudo actions (inputs and outputs) in `/var/log/sudo/`.
- Enable **TTY mode** for security.

## Monitoring Script
Develop a **bash script** called `monitoring.sh` that displays the following system information every **10 minutes** on all terminals:
- System architecture and kernel version.
- Number of physical and virtual processors.
- Available RAM and its utilization rate.
- Available disk memory and its utilization rate.
- CPU utilization rate.
- Date and time of the last reboot.
- Whether LVM is active.
- Number of active connections.
- Number of users logged in.
- Server IPv4 address and MAC address.
- Number of commands executed with sudo.

Use **cron** to automate the execution of the script.

This README provides a summary of the **Born2beRoot** project. For further details, refer to the official 42 project instructions.

