@echo off
echo ==============================
echo   "Sync MyST Markdown -> ipynb"
echo ==============================

REM Loop over all .md files in contents/ (relative to scripts/)
for %%f in ("C:\Users\ebyqu\stat5430project\contents\*.md") do (
    echo Converting %%f ...
    jupytext --to notebook "%%f" -o "C:\Users\ebyqu\stat5430project\notebooks\%%~nf.ipynb"
)

echo ✅ Sync complete!
