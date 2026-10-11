# Bộ Cài Đặt Microsoft Store & WinGet Offline Cho Windows IoT / LTSC

Bộ công cụ cài đặt **Microsoft Store** và trình quản lý gói **WinGet (Desktop App Installer)** dạng **Offline 100%**, chuyên dụng cho các phiên bản **Windows 10 / Windows 11 IoT Enterprise LTSC** hoặc các bản Windows bị lược bỏ Store.

> [!TIP]
> 📦 **TẢI VỀ BỘ CÀI ĐẶT ĐẦY ĐỦ (OFFLINE PACKAGE)**:  
> Do các gói cài đặt UWP/MSIX có dung lượng lớn, toàn bộ bộ cài offline đã được đóng gói sẵn và phát hành tại:  
> 👉 **[GitHub Releases: Microsoft Store](https://github.com/hoafd/Setup-Microsoft-Store/releases/tag/Microsoft-Store)**

> [!NOTE]
> Gói **`Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle`** và thư mục phụ thuộc **`DesktopAppInstaller_Dependencies/`** (bao gồm `x64`, `x86`, `arm64`) được trích xuất trực tiếp từ bản phát hành chính thức **Windows Package Manager v1.29.380** ([microsoft/winget-cli](https://github.com/microsoft/winget-cli/releases/tag/v1.29.380)).

---

## 🌟 Tính Năng Nổi Bật

- **Hoàn toàn Offline**: Không cần kết nối Internet, không phụ thuộc vào PowerShell Gallery hay NuGet Provider.
- **Tự động nhận diện kiến trúc phần cứng**: Hỗ trợ tự động các kiến trúc `x64` (64-bit), `x86` (32-bit), và `arm64`.
- **Đầy đủ thư viện phụ thuộc (Dependencies)**: Đã tích hợp sẵn `WindowsAppRuntime 1.8`, `VCLibs 140 UWPDesktop`, `VCLibs 140`, và `Microsoft.UI.Xaml 2.8`.
- **Tự động nâng quyền Administrator (UAC Self-Elevation)**: Chỉ cần nhấp đúp file là script tự gọi quyền Admin.
- **Báo cáo kết quả trực quan**: Kiểm tra và hiển thị trực tiếp trạng thái cài đặt cùng phiên bản chi tiết.

---

## 📁 Cấu Trúc Thư Mục

```text
Setup.Microsoft.Store/
├── DesktopAppInstaller_Dependencies/          # Các gói thư viện bắt buộc của WinGet
│   ├── arm64/                                 # Gói dành cho kiến trúc ARM64
│   ├── x64/                                   # Gói dành cho kiến trúc 64-bit Intel/AMD
│   │   ├── Microsoft.VCLibs.140.00.UWPDesktop_14.0.33728.0_x64.appx
│   │   ├── Microsoft.VCLibs.140.00_14.0.33519.0_x64.appx
│   │   └── Microsoft.WindowsAppRuntime.1.8_8000.616.304.0_x64.appx
│   └── x86/                                   # Gói dành cho kiến trúc 32-bit
├── Microsoft.DesktopAppInstaller_...msixbundle# Gói cài đặt WinGet (Desktop App Installer)
├── Microsoft.WindowsStore_...Msixbundle       # Gói cài đặt Microsoft Store chính
├── Microsoft.UI.Xaml.2.8_...Appx              # Giao diện UI Xaml 2.8 (x64, x86)
├── Microsoft.VCLibs.140.00_...Appx            # Thư viện Visual C++ Runtime (x64, x86)
├── setup.bat                                  # Script cài đặt tự động (Khuyên dùng)
├── HDSD.txt                                   # Hướng dẫn lệnh chạy thủ công
└── README.md                                  # Tài liệu hướng dẫn này
```

---

## 🚀 Hướng Dẫn Cài Đặt Tự Động (Khuyên Dùng)

1. **Tải bộ cài**: Vào mục [Releases (Microsoft Store)](https://github.com/hoafd/Setup-Microsoft-Store/releases/tag/Microsoft-Store) và tải file `.zip` về máy.
2. **Giải nén**: Giải nén toàn bộ file `.zip` ra một thư mục.
3. Nhấp đúp hoặc chuột phải vào file **`setup.bat`** -> chọn **Run as administrator**.
4. Bấm **Yes** khi hộp thoại xác nhận quyền quản trị viên (UAC) xuất hiện.
5. Chờ trình cài đặt tự động thực hiện 4 bước:
   - `[1/4]` Cài đặt các gói phụ thuộc cơ bản (`VCLibs`, `UI.Xaml`).
   - `[2/4]` Cài đặt các gói phụ thuộc WinGet (`WindowsAppRuntime 1.8`, `UWPDesktop`).
   - `[3/4]` Cài đặt WinGet (`Desktop App Installer`).
   - `[4/4]` Cài đặt `Microsoft Store`.
6. Khi hoàn tất, màn hình sẽ hiển thị kết quả:
   - `[+] Microsoft Store: DA CAI DAT`
   - `[+] WinGet (DesktopAppInstaller): DA CAI DAT`
   - Microsoft Store sẽ tự động mở lên.

---

## 🛠️ Hướng Dẫn Cài Đặt Thủ Công (Qua PowerShell)

Nếu bạn muốn tự chạy lệnh từng bước, hãy mở **PowerShell với quyền Administrator** tại thư mục này và dán lần lượt các lệnh sau (ví dụ cho máy 64-bit `x64`):

```powershell
# 1. Cài đặt các gói phụ thuộc cơ bản
Add-AppxPackage -Path "Microsoft.VCLibs.140.00_14.0.33519.0_x64__8wekyb3d8bbwe.appx"
Add-AppxPackage -Path "Microsoft.VCLibs.140.00_14.0.33519.0_x86__8wekyb3d8bbwe.appx"
Add-AppxPackage -Path "Microsoft.UI.Xaml.2.8_8.2501.31001.0_x64__8wekyb3d8bbwe.appx"
Add-AppxPackage -Path "Microsoft.UI.Xaml.2.8_8.2501.31001.0_x86__8wekyb3d8bbwe.appx"

# 2. Cài đặt các gói phụ thuộc WinGet
Add-AppxPackage -Path "DesktopAppInstaller_Dependencies\x64\Microsoft.VCLibs.140.00.UWPDesktop_14.0.33728.0_x64.appx"
Add-AppxPackage -Path "DesktopAppInstaller_Dependencies\x64\Microsoft.WindowsAppRuntime.1.8_8000.616.304.0_x64.appx"

# 3. Cài đặt WinGet
Add-AppxPackage -Path "Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"

# 4. Cài đặt Microsoft Store
Add-AppxPackage -Path "Microsoft.WindowsStore_22602.1401.4.0_neutral_~_8wekyb3d8bbwe.msixbundle"

# 5. Khởi chạy Store & Kiểm tra phiên bản WinGet
start ms-windows-store:
winget --version
```

---

## 💡 Lưu Ý Khi Mang Sang Máy Khác

- **Luôn giải nén trước khi chạy:** Không chạy trực tiếp `setup.bat` từ bên trong phần mềm giải nén (WinRAR / 7-Zip).
- **Giữ nguyên cấu trúc thư mục:** Đảm bảo thư mục con `DesktopAppInstaller_Dependencies` nằm cùng cấp với file `setup.bat`.
- **Tương thích:** Hoạt động tốt trên Windows 10 IoT Enterprise LTSC (21H2, 22H2), Windows 11 IoT Enterprise LTSC, và các phiên bản Windows 10/11 tương đương.
