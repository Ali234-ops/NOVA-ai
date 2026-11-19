@echo off
cd /d "%~dp0"
start "NOVA API" cmd /k "python backend\server.py"
start "NOVA WEB" cmd /k "python -m http.server 5500"
timeout /t 2 >nul
start "" "http://127.0.0.1:5500/auth.html"
