# 🛒 Microsoft Store Installer

A lightweight and automated tool designed to restore or install the **Microsoft Store** and its necessary dependencies on Windows 10/11. This is particularly useful for Windows editions that don't come with the Store by default, such as **IoT Enterprise**, **LTSC**, or if the Store was accidentally removed.

---

## 🚀 Download & Release

You can download the latest pre-packaged version from the official releases page:

### 🔗 [Download Microsoft Store Package (Release: Microsoft-Store)](https://github.com/hoafd/Setup-Microsoft-Store/releases/latest)

> [!NOTE]
> Replace the link above with your actual GitHub repository URL once you have created the release.

---

## 🛠️ Features

- **Automated Setup**: One-click installation via `setup.bat`.
- **Dependency Management**: Includes all required libraries (`VCLibs`, `UI.Xaml`).
- **Architecture Support**: Compatible with `x64` systems.
- **Manual Mode**: Includes manual commands for advanced users or troubleshooting.

---

## 📦 What's Included?

| File | Description |
| :--- | :--- |
| `setup.bat` | The main installation script (Run as Admin). |
| `HDSD.txt` | Detailed manual instructions in Vietnamese. |
| `*.Msixbundle` | The official Microsoft Store package. |
| `*.Appx` | Supplemental dependencies for UI and Runtime. |

---

## 📖 How to Install

1. **Download** the source code or the release package.
2. **Extract** all files into a single folder.
3. Right-click on **`setup.bat`** and select **Run as Administrator**.
4. Wait for the process to complete.
5. If the Store doesn't open automatically, please **Restart your computer**.

---

## ⚠️ Troubleshooting

- **Red Text in Console**: Usually means a dependency is already installed or there is a version mismatch. If the Store works, you can ignore this.
- **Permissions**: Ensure you are running the script with **Administrator privileges**.
- **Windows Version**: Designed for Windows 10/11.

---

*Made with ❤️ to help you restore your Windows experience.*
