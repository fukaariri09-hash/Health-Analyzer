@echo off
echo Installing HealthEnhancer APK to connected Android device or emulator...
"C:\Users\Yash\AppData\Local\Android\Sdk\platform-tools\adb.exe" install -r "E:\MyApplication2\app\build\outputs\apk\debug\app-debug.apk"
if %ERRORLEVEL% equ 0 (
    echo.
    echo =======================================
    echo  APK INSTALLED SUCCESSFULLY!
    echo =======================================
) else (
    echo.
    echo Installation failed or no device attached.
    echo If using USB, enable USB Debugging on your phone.
)
pause
