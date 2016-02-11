REM dir to current directory
cd %~dp0

REM sign exe
"C:\Program Files (x86)\Windows Kits\10\bin\x64\signtool" sign /f C:\VSProjects\TU-code-signing.p12  /t http://timestamp.digicert.com .\packages\nomacs.x64\data\nomacs-x64\nomacs.exe

REM update repo
C:\Qt\QtIFW2.0.1\bin\repogen.exe -p ./packages --update repository

REM create offline installer
REM C:\Qt\QtIFW2.0.1\bin\binarycreator.exe -c config\config.xml -p packages -r config/resources.qrc read-tuwien-setup

REM use for final online installer
C:\Qt\QtIFW2.0.1\bin\binarycreator.exe -n -c config\config.xml -p packages -r config/resources.qrc read-tuwien-setup

"C:\Program Files (x86)\Windows Kits\10\bin\x64\signtool" sign /f C:\VSProjects\TU-code-signing.p12  /t http://timestamp.digicert.com read-tuwien-setup.exe

pause