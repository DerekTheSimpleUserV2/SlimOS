# SlimOS 🪶

**SlimOS** is a PowerShell project designed to customize and slim down **Windows 11** installations.

Its goal is to remove unnecessary applications, reduce background activity, reduce configurable telemetry, and provide a cleaner and lighter Windows experience.

> ⚠️ SlimOS modifies Windows settings and components. Testing in a virtual machine and creating a restore point before making changes is recommended.

## ✨ Features

* 🧹 Remove selected preinstalled applications
* 📡 Reduce configurable telemetry
* ⚙️ Optimize optional Windows services
* 🌐 Install LibreWolf
* 🛡️ Install and detect Avast
* 💾 Clean temporary files
* 🔄 Keep Windows Update
* 📡 Keep network functionality
* 🎮 Keep components required for gaming
* 🪶 Designed for a lighter Windows 11 experience

## 📁 Project Structure

```text
SlimOS/
├── SlimOS.ps1
├── README.md
└── modules/
    ├── cleanup.ps1
    ├── telemetry.ps1
    ├── services.ps1
    ├── installers.ps1
    └── security.ps1
```

## 🚀 Usage

Open **PowerShell as Administrator** and run:

```powershell
Set-ExecutionPolicy -Scope Process Bypass
```

Then:

```powershell
.\SlimOS.ps1
```

SlimOS will display its main menu:

```text
=============================
          SlimOS
=============================

[1] Clean Windows
[2] Reduce Telemetry
[3] Optimize Services
[4] Install LibreWolf
[5] Install Avast
[6] Full Configuration
[7] Exit
```

## 🛡️ Security

SlimOS should not be run with Windows security protections disabled beforehand.

The security module checks whether an antivirus product is registered before making security-related changes.

It is recommended to have **Avast properly installed and working** before changing any security configuration.

SlimOS does not intentionally leave the system without antivirus protection.

## 🧪 Testing

Before using SlimOS on a primary computer, it is recommended to:

1. Create a Windows 11 virtual machine.
2. Run SlimOS inside the virtual machine.
3. Test networking, audio, Bluetooth, and Windows Update.
4. Test your applications and games.
5. Check that the system remains stable.
6. Only then test SlimOS on physical hardware.

## ⚠️ Disclaimer

SlimOS is an independent third-party project.

It is **not affiliated with Microsoft, Avast, or the LibreWolf project**.

Some modifications may affect Windows functionality. Use SlimOS at your own risk.

## 📜 License

The project license will be added once the final license is selected.

---

**SlimOS — Windows 11, but slimmer. 🪶**
