@echo off
SETLOCAL
set PORT=8280
set SCRIPT_DIR=%~dp0
set NODEMON_BIN=%SCRIPT_DIR%/nodemon.cmd
set WORKDIR=%SCRIPT_DIR%/..

rem @echo "" >>server.log
rem @echo "----------------" >>server.log
@echo "%NODEMON_BIN%" "www" %*

:setArgs
if ""%1""=="""" goto doneSetArgs
if "%1"=="-d" (
  set ENABLE_DEBUG="true"
)else (
  set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
) 
shift
goto setArgs

:doneSetArgs
if not ""%ENABLE_DEBUG%""=="""" (
  node-debug %CMD_LINE_ARGS% "nodemon.cmd" "./bin/www"
)else (
  nodemon.cmd "./bin/www"
)

 PAUSE
ENDLOCAL
@echo on
