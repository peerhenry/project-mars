@echo off
set "outputFile=Pioneers_debug.log"
if exist %outputFile% (
	move %outputFile% %outputFile%.prev
	del %outputFile%
)
start Pioneers.exe.org -output %outputFile% -debugoutput %outputFile%
