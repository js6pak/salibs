@echo off
echo Setting libraries variable to current directory (%cd%)
setx SALIBS_SRC %cd%
set /p DUMMY=Done