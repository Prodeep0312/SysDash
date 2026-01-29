# SysDash

**SysDash** is a Bash-based interactive **System Maintenance & Health Dashboard** for Linux systems. It provides a menu-driven interface to monitor system resources, manage services, view logs, perform cleanup tasks, manage processes, and schedule routine maintenance.

---

## Features

- **CPU & RAM Usage**: Monitor real-time CPU load and memory usage.
- **Disk Usage**: Check disk space usage across all mounted partitions.
- **Running Services**: View running services and optionally restart them.
- **Log Viewer**: Quickly access system logs such as system journal and authentication logs.
- **Cleanup Tasks**: Clear package cache and temporary files to free up space.
- **Network Status**: Display network interfaces, IP addresses, and routing information.
- **Process Manager**: View top CPU-consuming processes and kill processes if needed.
- **System Information**: View hostname, OS, kernel version, architecture, and uptime.
- **User Sessions**: Monitor logged-in users.
- **Schedule Tasks (Cron)**: Schedule automated maintenance tasks such as weekly cleanups.
- **Top Memory Processes**: Identify memory-hogging processes.

---

## Prerequisites

- Linux operating system
- Bash shell
- `dialog` package installed:
  ```bash
  sudo apt install dialog        # Debian/Ubuntu
  sudo dnf install dialog        # RHEL/Fedora/CentOS

  Root privileges are required to perform certain system tasks.

---

Make the main script executable and run as root

```bash
chmod +x sysdash.sh


```bash
sudo ./sysdash.sh
