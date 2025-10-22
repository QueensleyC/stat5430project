@echo off
echo ==============================
echo   Jupyter Book Automation
echo ==============================
echo 1. Build and Open the book
echo 2. AutoHide + Sync (ipynb to myst) + Build + Open
echo 3. AutoHide + Sync (myst to ipynb) + Build + Open
echo 4. Open the book locally
echo 5. Push to GitHub Pages
echo 6. Do all (Build + Open + Push)
echo ==============================
set /p choice="Choose an option (1-6): "

if "%choice%"=="1" goto build
if "%choice%"=="2" goto buildopen
if "%choice%"=="3" goto buildopen2
if "%choice%"=="4" goto open
if "%choice%"=="5" goto push
if "%choice%"=="6" goto all

:build
echo 📘 Building Jupyter Book...
jupyter-book build .
echo 🌐 Opening book locally...
start _build/html/index.html
goto end

:buildopen
echo 🔗 Ensuring notebooks are paired...
jupytext --set-formats notebooks//ipynb,contents//md:myst notebooks/*.ipynb
echo Running auto-hide...
python scripts\auto_tag_hide_code.py
echo Running sync...
call scripts\sync-ipynb_myst.bat
echo Building book...
jupyter-book build .
echo 🌐 Opening book locally...
start _build/html/index.html
goto end

:buildopen2
echo 🔗 Ensuring notebooks are paired...
jupytext --set-formats notebooks//ipynb,contents//md:myst notebooks/*.ipynb
echo Running sync...
call scripts\sync-myst_ipynb.bat
echo Building book...
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
