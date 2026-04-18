# 🛒 Microsoft Store Installer

[English](#-english) | [Tiếng Việt](#-tieng-viet)

---

## 🇺🇸 English

A lightweight and automated tool designed to restore or install the **Microsoft Store** and its necessary dependencies on Windows 10/11. This is particularly useful for Windows editions that don't come with the Store by default, such as **IoT Enterprise**, **LTSC**, or if the Store was accidentally removed.

### 🚀 Download & Release
You can download the latest pre-packaged version from the official releases page:
**🔗 [Download Microsoft Store Package (Release: Microsoft-Store)](https://github.com/hoafd/Setup-Microsoft-Store/releases/latest)**

### 🛠️ Features
- **Automated Setup**: One-click installation via `setup.bat`.
- **Dependency Management**: Includes all required libraries (`VCLibs`, `UI.Xaml`).
- **Manual Mode**: Includes manual commands for advanced users or troubleshooting.

### 📖 How to Install
1. **Download** the source code or the release package.
2. **Extract** all files into a single folder.
3. Right-click on **`setup.bat`** and select **Run as Administrator**.
4. Wait for the process to complete.
5. If the Store doesn't open automatically, please **Restart your computer**.

---

## 🇻🇳 Tiếng Việt

Công cụ nhỏ gọn và tự động giúp khôi phục hoặc cài đặt **Microsoft Store** cùng các thành phần phụ thuộc cần thiết trên Windows 10/11. Bộ công cụ này cực kỳ hữu ích cho các phiên bản Windows không có sẵn Store như **IoT Enterprise**, **LTSC**, hoặc khi Store vô tình bị xóa.

### 🚀 Tải về & Release
Bạn có thể tải về phiên bản đóng gói sẵn mới nhất tại trang release chính thức:
**🔗 [Tải về Microsoft Store Package (Release: Microsoft-Store)](https://github.com/hoafd/Setup-Microsoft-Store/releases/latest)**

### 🛠️ Tính năng
- **Cài đặt tự động**: Cài đặt chỉ với một cú nhấp chuột qua file `setup.bat`.
- **Quản lý phụ thuộc**: Bao gồm đầy đủ các thư viện cần thiết (`VCLibs`, `UI.Xaml`).
- **Chế độ thủ công**: Cung cấp các lệnh PowerShell nếu bạn muốn tự tay cài đặt.

### 📖 Hướng dẫn cài đặt
1. **Tải về** mã nguồn hoặc gói release.
2. **Giải nén** tất cả các tệp vào cùng một thư mục.
3. Nhấn chuột phải vào file **`setup.bat`** và chọn **Run as Administrator**.
4. Đợi quá trình cài đặt hoàn tất.
5. Nếu Store không tự mở, vui lòng **Khởi động lại máy tính**.

---

## 📦 What's Included? / Thành phần bộ cài

| File | Description (EN) | Mô tả (VI) |
| :--- | :--- | :--- |
| `setup.bat` | Main installation script (Run as Admin). | File cài đặt tự động (Chạy bằng quyền Admin). |
| `HDSD.txt` | Manual instructions in Vietnamese. | Hướng dẫn sử dụng thủ công bằng tiếng Việt. |
| `*.Msixbundle` | Official Microsoft Store package. | Bộ cài Microsoft Store chính thức. |
| `*.Appx` | Supplemental dependencies. | Các tệp phụ thuộc đi kèm. |

---

## ⚠️ Troubleshooting / Xử lý sự cố

- **Red Text / Chữ đỏ**: Thường do thành phần đó đã có sẵn hoặc phiên bản không khớp. Nếu Store vẫn hoạt động thì có thể bỏ qua.
- **Permissions / Quyền hạn**: Đảm bảo bạn chạy script bằng quyền **Administrator**.

---

*Made with ❤️ to help you restore your Windows experience.*
