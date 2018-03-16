@echo off

echo -- Pioneers_debug build started --

set "skipRepack=1"
set "inputZip=input\project-mars.zip"
set "outputDir=output"
set "outputExe=Pioneers_debug.exe"

:: find package
IF EXIST %inputZip% (
	echo Input package found: %~dp0%inputZip%
) ELSE (
	echo Error: input zip package "%inputZip%" not found
	pause
	exit /B
)

:: clean output dir
echo Cleaning output dir ..
IF EXIST %outputDir% (
    rmdir %outputDir% /S /Q
)
mkdir %outputDir%

:: extract package
echo Extracting package ..
powershell.exe -nologo -noprofile -command "& { Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::ExtractToDirectory('%inputZip%', '%outputDir%'); }"

:: rename original exe
echo Renaming game exe ..
rename %outputDir%\Pioneers.exe Pioneers.exe.org

:: run converter
echo Running converter ..
Bat_To_Exe\Bat_To_Exe_Converter.exe /bat assets\game.bat /exe %outputDir%\%outputExe% /icon assets\game.ico /invisible
echo.

:: repack
if "%skipRepack%"=="0" (
	echo Repacking ..
	powershell.exe -nologo -noprofile -command "& { Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::CreateFromDirectory('%outputDir%', 'project-mars-debug.zip'); }"
	rmdir %outputDir% /S /Q
	mkdir %outputDir%
	move project-mars-debug.zip %outputDir%\project-mars-debug.zip
)

:: done
echo.
echo -- Pioneers_debug build completed --
pause
