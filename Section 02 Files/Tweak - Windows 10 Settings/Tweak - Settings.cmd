@echo off
cls
echo --------------------------------------------------------
echo .
echo .
echo .     Tweaking desktop background and Locak screen - Please Wait
echo .
echo .
echo --------------------------------------------------------

REM Load Default Regestry
reg.exe load HKEY_LOCAL_MACHINE\defuser c:\users\default\ntuser.dat

REM Tweak - Disable Windows Defender First Run (Win 10)
REG ADD "HKEY_LOCAL_MACHINE\defuser\SOFTWARE\Microsoft\Windows Defender" /V UIFirstRun /T REG_DWORD /D 00000000 /F


REM Tweak - Disable LockScreen Tool Tips
REG ADD "HKEY_LOCAL_MACHINE\defuser\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V RotatingLockScreenOverlayEnabled /T REG_DWORD /D 00000000 /F

REM Tweak - Set Explorer to launch �This PC� (Win 10)
REG ADD "HKEY_LOCAL_MACHINE\defuser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V LaunchTo /T REG_DWORD /D 1 /F

REM Tweak - Small Taskbar buttons (Win 10)
REG ADD "HKEY_LOCAL_MACHINE\defuser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V TaskbarSmallIcons /T reg_dword /D 1 /F

REM Tweak - Remove Pictures Folder (Win 10 x64)
REG ADD "HKEY_LOCAL_MACHINE\defuser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{0ddd015d-b06c-45d5-8c4c-f59713854639}\PropertyBag" /V ThisPCPolicy /T REG_SZ /D Hide /F

REM Tweak - Remove Video Folder (Win 10 x64)
REG ADD "HKEY_LOCAL_MACHINE\defuser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{35286a68-3c57-41a1-bbb1-0eae73d76c95}\PropertyBag" /V ThisPCPolicy /T REG_SZ /D Hide /F

REM Tweak - Remove Music Folder (Win 10 x64)
REG ADD "HKEY_LOCAL_MACHINE\defuser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{a0c69a99-21c8-4671-8703-7934162fcf1d}\PropertyBag" /V ThisPCPolicy /T REG_SZ /D Hide /F

REM Tweak - Add MyComputer Desktop Icon (Win 10)
REG ADD "HKEY_LOCAL_MACHINE\defuser\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /V {20D04FE0-3AEA-1069-A2D8-08002B30309D} /T REG_DWORD /D 0 /F

REM Tweak - Set Cortana Search Icon (Win 10)
REG ADD "HKEY_LOCAL_MACHINE\defuser\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /V SearchboxTaskbarMode /T REG_DWORD /D 1 /F

REM Tweak - Remove People Icon from taskbar (Win 10)
REM https://configurationmgr.wordpress.com/2017/10/19/remove-the-people-bar-from-taskbar-windows-10-1709/
REG ADD "HKEY_LOCAL_MACHINE\defuser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /V PeopleBand /T REG_DWORD /D 0 /F

REM Tweak - Add Run as different user right click (Win 10)
REM https://www.winhelponline.com/blog/show-run-different-user-option-start-windows-10/
REM https://garytown.com/add-run-as-different-user-to-right-click-menu-of-apps
REG ADD "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Explorer" /V ShowRunasDifferentuserinStart /T REG_DWORD /D 1 /F

REM Tweak - LockScreen (Win 10)
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization" /V LockScreenImage /T REG_SZ /D C:\_Support\background\HCCSC_Wallpaper_Gray.jpg /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization" /V LockScreenOverlaysDisabled /T reg_dword /D 1 /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization" /V NoChangingLockScreen /T reg_dword /D 1 /F

REM Tweak - Remove Edge Icon Desktop (Win 10)
REM https://social.technet.microsoft.com/wiki/contents/articles/51546.windows-10-build-1803-registry-tweak-to-disable-microsoft-edge-shortcut-creation-on-desktop.aspx
REG ADD "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer" /V DisableEdgeDesktopShortcutCreation /T REG_DWORD /D 1 /F


REM Unload Default Regestry
reg.exe unload HKEY_LOCAL_MACHINE\defuser