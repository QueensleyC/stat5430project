@echo off
echo ==============================
echo   "Sync ipynb -> MyST Markdown"
echo ==============================

REM Loop over all .ipynb files in notebooks/ (relative to scripts/)
for %%f in ("C:\Users\ebyqu\stat5430project\notebooks\*.ipynb") do (
    echo Converting %%f ...
    jupytext --to myst "%%f" -o "C:\Users\ebyqu\stat5430project\contents\%%~nf.md"
)


echo Sync complete!
