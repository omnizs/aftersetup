# Cross-Platform Post-Install Scripts

This repository contains scripts to configure the system after OS installation. It supports Linux, macOS, and Windows.

## Structure

- `install.sh`: Main entry point for Linux and macOS.
- `install.ps1`: Main entry point for Windows.
- `scripts/`:
  - `common/`: Scripts shared between Linux and macOS.
  - `linux/`: Linux-specific scripts.
  - `macos/`: macOS-specific scripts.
  - `windows/`: Windows-specific PowerShell scripts.

## Usage

### Linux and macOS

Open a terminal and run:

```bash
./install.sh
```

### Windows

Open PowerShell as Administrator. You might need to enable script execution first:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

Then run:

```powershell
.\install.ps1
```

## Customization

Add your own scripts to the respective directories.
- Scripts are executed in alphabetical order. Prefix filenames with numbers (e.g., `00-init.sh`, `10-install.sh`) to control the execution order.
- For Linux/macOS, ensure they are executable (`chmod +x`).
- For Windows, use `.ps1` extension.
