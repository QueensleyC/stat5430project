@echo off
echo ==============================
echo   Jupyter Book Automation
echo ==============================
echo 1. Build the book
echo 2. Build and Open the book
echo 3. Open the book locally
echo 4. Push to GitHub Pages
echo 5. Do all (Build + Open + Push)
echo ==============================
set /p choice="Choose an option (1-5): "

if "%choice%"=="1" goto build
if "%choice%"=="2" goto buildopen
if "%choice%"=="3" goto open
if "%choice%"=="4" goto push
if "%choice%"=="5" goto all

:build
echo 📘 Building Jupyter Book...
jupyter-book build .
goto end

:buildopen
echo 📘 Building Jupyter Book...
jupyter-book build .
echo 🌐 Opening book locally...
start _build/html/index.html
goto end

:open
echo 🌐 Opening book locally...
start _build/html/index.html
goto end

:push
echo ⬆️ Pushing to GitHub Pages...
jupyter-book build .
ghp-import -n -p -f _build/html
goto end

:all
echo 📘 Building Jupyter Book...
jupyter-book build .
echo 🌐 Opening book locally...
start _build/html/index.html
echo ⬆️ Pushing to GitHub Pages...
ghp-import -n -p -f _build/html
goto end

:end
echo ✅ Done!
pause
