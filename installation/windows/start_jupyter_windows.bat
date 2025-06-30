@echo off
setlocal
REM Activate conda environment and launch Jupyter notebook

REM Move to parent directory relative to script
cd /d "%~dp0\.."

REM Initialize conda
CALL "%USERPROFILE%\miniconda3\Scripts\activate.bat"

REM Activate the specific environment
CALL conda activate precision-course-env

IF %ERRORLEVEL% NEQ 0 (
    ECHO Failed to activate conda environment.
    pause
    EXIT /B 1
)

REM Launch Jupyter notebook in course directory
ECHO Starting Jupyter Notebook...
jupyter notebook --notebook-dir="course_content"

pause
