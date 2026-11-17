@echo off
REM Windows with MinGW-w64 (g++ on PATH, e.g. the compiler bundled with Code::Blocks)
g++ -std=c++17 -O2 -D_WIN32_WINNT=0x0A00 -o navigator.exe src/main.cpp -lws2_32 -lwsock32
if errorlevel 1 (echo Build failed) else (echo Built navigator.exe  -  run:  navigator.exe)
