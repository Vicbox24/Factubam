@echo off
title Instalando FactuBAM...

REM --- Paso 1: Instalar pip si no existe ---
python -m pip --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Instalando pip...
    curl -s https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python get-pip.py >nul 2>&1
)

set /a PROGRESS=0

REM --- Paso 2: Instalar dependencias en modo silencioso ---
echo Instalando dependencias...

set /a PROGRESS=20
echo [%PROGRESS%%%] Instalando streamlit...
pip install streamlit --quiet >nul 2>&1

set /a PROGRESS=40
echo [%PROGRESS%%%] Instalando plotly...
pip install plotly --quiet >nul 2>&1

set /a PROGRESS=60
echo [%PROGRESS%%%] Instalando pdfplumber...
pip install pdfplumber --quiet >nul 2>&1

set /a PROGRESS=80
echo [%PROGRESS%%%] Instalando pandas...
pip install pandas --quiet >nul 2>&1

set /a PROGRESS=90
echo [%PROGRESS%%%] Instalando openpyxl...
pip install openpyxl --quiet >nul 2>&1

set /a PROGRESS=100
echo [%PROGRESS%%%] Dependencias instaladas!

REM --- Paso 3: Ejecutar aplicación ---
echo Iniciando FactuBAM...
python -m streamlit run factubam.py
pause
