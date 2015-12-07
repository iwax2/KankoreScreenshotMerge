@echo off

set IrfanView="V:\Tools\IrfanView\i_view32.exe"

set time2=%time: =0%
set OUTPUT_FILENAME=KanColleMerge_%time2:~0,2%%time2:~3,2%%time2:~6,2%.png
SET /A pages=0

:START
IF %1.==. GOTO JUNCTION
title %1

%IrfanView% %1 /crop=(320,100,460,360) /convert=temp%pages%.png

SET /A pages+=1

SHIFT
GOTO START

:JUNCTION
if %pages% == 6 (
call :junct
) else (
echo "Bad files"
)
pause
goto END


:junct
%IrfanView% /convert=temp6.png /panorama=(2,temp0.png,temp2.png,temp4.png)
%IrfanView% /convert=temp7.png /panorama=(2,temp1.png,temp3.png,temp5.png)
%IrfanView% /convert=%OUTPUT_FILENAME% /panorama=(1,temp6.png,temp7.png)
del temp0.png temp1.png temp2.png temp3.png temp4.png temp5.png
del temp6.png temp7.png
exit /b 1


:END
exit
