@echo off
:loop
echo Membuka svchost.exe, MsMpEng.exe, OneDrive.exe, dan SearchIndexer.exe sebagai Administrator
rem Periksa apakah script dijalankan sebagai admin
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Meminta hak akses Administrator...
    powershell -Command "Start-Process '%~s0' -Verb RunAs" & exit /b
)

start "svchost" "C:\Windows\System32\svchost.exe"
start "MsMpEng" "C:\ProgramData\Microsoft\Windows Defender\Platform\4.18.2201.6-0\MsMpEng.exe"
start "OneDrive" "%LOCALAPPDATA%\Microsoft\OneDrive\OneDrive.exe" 
start "SearchIndexer" "C:\Windows\System32\SearchIndexer.exe"

echo Program berjalan. Tutup jendela ini untuk menghentikannya.
timeout /t 10 > nul
goto loop
