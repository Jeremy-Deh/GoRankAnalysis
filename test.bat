@echo off & title %~nx0 & color 5F

goto :DOES_PYTHON_EXIST

:DOES_PYTHON_EXIST
python -V | find /v "Python" >NUL 2>NUL && (goto :PYTHON_DOES_NOT_EXIST)
python -V | find "Python"    >NUL 2>NUL && (goto :PYTHON_DOES_EXIST)
goto :EOF

:PYTHON_DOES_NOT_EXIST
echo Python is not installed on your system.
echo Now opeing the download URL.
start "" "https://repo.anaconda.com/archive/Anaconda3-2021.11-Windows-x86_64.exe"
echo Download the fil and install it, then wait for the end before pressing any key 
pause
goto :EOF

:PYTHON_DOES_EXIST
pause
:: This will retrieve Python 3.8.0 for example.
for /f "delims=" %%V in ('python -V') do @set ver=%%V
echo Congrats, %ver% is installed...
goto :EOF

pause
exit 