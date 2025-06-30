@echo off
setlocal
set "ENV_NAME=precision-course-env"
set "ENV_FILE=environment.yml"

:: Move to the parent directory relative to the script
cd /d "%~dp0\.."

echo ========================================
echo Setting up course environment from %ENV_FILE%
echo ========================================

:: Check if the environment.yml file exists
IF NOT EXIST "%ENV_FILE%" (
    echo ERROR: %ENV_FILE% not found in %CD%.
    pause
    exit /b
)

:: Activate Conda base environment (needed before using conda commands)
CALL "%USERPROFILE%\miniconda3\Scripts\activate.bat"

:: Check if the environment already exists
FOR /F "tokens=1" %%E IN ('conda env list ^| findstr /B /C:"%ENV_NAME%"') DO (
    echo Environment "%ENV_NAME%" already exists. Removing it...
    conda env remove -n "%ENV_NAME%" -y
    IF ERRORLEVEL 1 (
        echo Failed to remove existing environment. Exiting.
        pause
        exit /b
    )
)

:: Create the environment
echo Creating new environment...
conda env create -f "%ENV_FILE%" -y

IF ERRORLEVEL 1 (
    echo Failed to create environment. Exiting.
    pause
    exit /b
)

echo.
echo ========================================
echo Environment "%ENV_NAME%" created.
echo ========================================
echo.

:: Activate the new environment
CALL conda activate "%ENV_NAME%"
IF ERRORLEVEL 1 (
    echo ERROR: Failed to activate environment "%ENV_NAME%".
    pause
    exit /b
)

:: Run verification script
echo Running verification...
python verify_installation.py

pause
