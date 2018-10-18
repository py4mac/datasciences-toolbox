@echo off
set targetfolder=%1
cd /d %1

call activate py35
jupyter notebook
