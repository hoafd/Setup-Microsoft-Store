@echo off
setlocal
cd /d "%~dp0"
title Cai dat Microsoft Store va WinGet cho Windows IoT
color 0A

:: Tu dong yeu cau quyen Admin (UAC self-elevation)
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [!] Dang yeu cau quyen Admin - vui long bam "Yes" o hop thoai UAC...
    powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -WorkingDirectory '%~dp0' -Verb RunAs"
    exit /b
)

echo ======================================================================
echo    CAI DAT MICROSOFT STORE VA WINGET CHO WINDOWS IOT ENTERPRISE LTSC
echo ======================================================================
echo.

:: Xac dinh kien truc he dieu hanh (x64 / x86 / arm64)
set "ARCH=x64"
if /i "%PROCESSOR_ARCHITECTURE%"=="ARM64" set "ARCH=arm64"
if /i "%PROCESSOR_ARCHITECTURE%"=="x86" (
    if "%PROCESSOR_ARCHITEW6432%"=="" set "ARCH=x86"
)
echo [+] Phat hien kien truc he thong: %ARCH%

echo.
echo [1/4] Dang cai dat cac goi phu thuoc co ban (VCLibs, UI.Xaml)...
powershell -NoProfile -Command "Get-ChildItem -Filter *.appx | Where-Object { $_.Name -like '*%ARCH%*' -or $_.Name -like '*x86*' } | ForEach-Object { Write-Host '  -> Cai dat:' $_.Name; Add-AppxPackage -Path $_.FullName -ErrorAction SilentlyContinue }"

echo.
echo [2/4] Dang cai dat cac goi phu thuoc WinGet (WindowsAppRuntime, UWPDesktop)...
powershell -NoProfile -Command "$folders = @('DesktopAppInstaller_Dependencies\%ARCH%', '%ARCH%'); foreach ($f in $folders) { if (Test-Path $f) { Get-ChildItem -Path $f -Filter *.appx | ForEach-Object { Write-Host '  -> Cai dat:' $_.Name; Add-AppxPackage -Path $_.FullName -ErrorAction SilentlyContinue } } }"

echo.
echo [3/4] Dang cai dat Desktop App Installer (WinGet)...
powershell -NoProfile -Command "if (Test-Path 'Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle') { Write-Host '  -> Cai dat DesktopAppInstaller...'; try { Add-AppxPackage -Path 'Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle' -ErrorAction Stop } catch { if ($_.Exception.Message -match '0x80073D06') { Write-Host '  [i] WinGet da co san phien ban moi hon tren he thong.' -ForegroundColor Yellow } else { Write-Host ('  [!] ' + $_.Exception.Message) -ForegroundColor Red } } } else { Write-Host '  [!] Khong tim thay file DesktopAppInstaller msixbundle' -ForegroundColor Yellow }"

echo.
echo [4/4] Dang cai dat Microsoft Store...
powershell -NoProfile -Command "$store = Get-ChildItem -Filter *.msixbundle | Where-Object { $_.Name -notlike '*DesktopAppInstaller*' } | Select-Object -First 1; if ($store) { Write-Host '  -> Cai dat:' $store.Name; try { Add-AppxPackage -Path $store.FullName -ErrorAction Stop } catch { if ($_.Exception.Message -match '0x80073D06') { Write-Host '  [i] Microsoft Store da co san phien ban moi hon tren he thong (khong can cai de).' -ForegroundColor Yellow } else { Write-Host ('  [!] ' + $_.Exception.Message) -ForegroundColor Red } } } else { Write-Host '  [!] Khong tim thay goi Microsoft Store msixbundle' -ForegroundColor Yellow }"


echo.
echo ======================================================================
echo                            KIEM TRA KET QUA
echo ======================================================================
powershell -NoProfile -Command "$s = Get-AppxPackage *WindowsStore* -ErrorAction SilentlyContinue; if ($s) { Write-Host ('[+] Microsoft Store: DA CAI DAT (Version: ' + $s.Version + ')') -ForegroundColor Green } else { Write-Host '[-] Microsoft Store: CHUA CAI DUOC' -ForegroundColor Red }"
powershell -NoProfile -Command "$w = Get-AppxPackage *DesktopAppInstaller* -ErrorAction SilentlyContinue; if ($w) { Write-Host ('[+] WinGet (DesktopAppInstaller): DA CAI DAT (Version: ' + $w.Version + ')') -ForegroundColor Green } else { Write-Host '[-] WinGet: CHUA CAI DUOC' -ForegroundColor Red }"

echo.
echo [+] Dang thu mo Microsoft Store...
powershell -NoProfile -Command "Start-Process 'ms-windows-store:' -ErrorAction SilentlyContinue"

echo.
echo [+] Hoan tat!
pause
