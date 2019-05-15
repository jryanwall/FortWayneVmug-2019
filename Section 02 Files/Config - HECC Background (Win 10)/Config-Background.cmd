@echo off
cls
echo --------------------------------------------------------
echo .
echo .
echo .     Tweaking desktop background and Locak screen - Please Wait
echo .
echo .
echo --------------------------------------------------------


takeown /f C:\Windows\Web\Screen\*.*
icacls C:\Windows\Web\Screen\*.* /Grant administrator:(F)
takeown /f C:\Windows\Web\4K\Wallpaper\Windows\*.*
icacls C:\Windows\Web\4K\Wallpaper\Windows\*.* /Grant administrator:(F)
takeown /f C:\Windows\Web\Wallpaper\Windows\*.*
icacls C:\Windows\Web\Wallpaper\Windows\*.* /Grant administrator:(F)
takeown /f C:\Windows\Web\Wallpaper\Theme1\*.*
icacls C:\Windows\Web\Wallpaper\Theme1\*.* /Grant administrator:(F)
takeown /f C:\Windows\Web\Wallpaper\Theme2\*.*
icacls C:\Windows\Web\Wallpaper\Theme2\*.* /Grant administrator:(F)
takeown /f C:\Windows\Web\4K\*.*
icacls C:\Windows\Web\4K\*.* /Grant administrator:(F)
takeown /f C:\Windows\Web\Wallpaper\*.*
icacls C:\Windows\Web\Wallpaper\*.* /Grant administrator:(F)
takeown /f C:\Windows\Web\4K\Wallpaper\*.*
icacls C:\Windows\Web\4K\Wallpaper\*.* /Grant administrator:(F)


copy "HECC Wallpaper Grey.jpg" C:\Windows\Web\Screen\img100.jpg /Y
copy "HECC Wallpaper Grey.png" C:\Windows\Web\Screen\img101.png /Y
copy "HECC Wallpaper Grey.jpg" C:\Windows\Web\Screen\img102.jpg /Y
copy "HECC Wallpaper Grey.png" C:\Windows\Web\Screen\img103.png /Y
copy "HECC Wallpaper Grey.jpg" C:\Windows\Web\Screen\img104.jpg /Y
copy "HECC Wallpaper Grey.jpg" C:\Windows\Web\Screen\img105.jpg /Y

REM Change Background
REM echo .     Changing desktop background
REM del /q C:\Windows\Web\4K\Wallpaper\Windows\*.*
copy  "HECC Wallpaper White.jpg" C:\Windows\Web\Wallpaper\Windows\img0.jpg /Y
copy  "HECC Wallpaper White.jpg" C:\Windows\Web\4K\Wallpaper\Windows\img0_1024x768.jpg /Y
copy  "HECC Wallpaper White.jpg" C:\Windows\Web\4K\Wallpaper\Windows\img0_1200x1920.jpg /Y
copy  "HECC Wallpaper White.jpg" C:\Windows\Web\4K\Wallpaper\Windows\img0_1366x768.jpg /Y
copy  "HECC Wallpaper White.jpg" C:\Windows\Web\4K\Wallpaper\Windows\img0_1600x2560.jpg /Y
copy  "HECC Wallpaper White.jpg" C:\Windows\Web\4K\Wallpaper\Windows\img0_2160x3840.jpg /Y
copy  "HECC Wallpaper White.jpg" C:\Windows\Web\4K\Wallpaper\Windows\img0_2560x1600.jpg /Y
copy  "HECC Wallpaper White.jpg" C:\Windows\Web\4K\Wallpaper\Windows\img0_3840x2160.jpg /Y
copy  "HECC Wallpaper White.jpg" C:\Windows\Web\4K\Wallpaper\Windows\img0_768x1024.jpg /Y
copy  "HECC Wallpaper White.jpg" C:\Windows\Web\4K\Wallpaper\Windows\img0_768x1366.jpg /Y
copy  "HECC Wallpaper White.jpg" C:\Windows\Web\Wallpaper\Theme1\img1.jpg /Y
copy  "HECC Wallpaper White.jpg" C:\Windows\Web\Wallpaper\Theme1\img13.jpg /Y
copy  "HECC Wallpaper White.jpg" C:\Windows\Web\Wallpaper\Theme1\img2.jpg /Y
copy  "HECC Wallpaper White.jpg" C:\Windows\Web\Wallpaper\Theme1\img3.jpg /Y
copy  "HECC Wallpaper White.jpg" C:\Windows\Web\Wallpaper\Theme1\img4.jpg /Y
copy  "HECC Wallpaper White.jpg" C:\Windows\Web\Wallpaper\Theme2\img10.jpg /Y
copy  "HECC Wallpaper White.jpg" C:\Windows\Web\Wallpaper\Theme2\img11.jpg /Y
copy  "HECC Wallpaper White.jpg" C:\Windows\Web\Wallpaper\Theme2\img12.jpg /Y
copy  "HECC Wallpaper White.jpg" C:\Windows\Web\Wallpaper\Theme2\img7.jpg /Y
copy  "HECC Wallpaper White.jpg" C:\Windows\Web\Wallpaper\Theme2\img8.jpg /Y
copy  "HECC Wallpaper White.jpg" C:\Windows\Web\Wallpaper\Theme2\img9.jpg /Y


mkdir C:\_Support\background
copy "HECC Wallpaper Grey.jpg" C:\_Support\background\HCCSC_Wallpaper_Gray.jpg /Y
copy "HECC Wallpaper Grey.png" C:\_Support\background\HCCSC_Wallpaper_Gray.png /Y
copy "HECC Wallpaper White.jpg" C:\_Support\background\HCCSC_Wallpaper_Red.jpg /Y
copy "HECC Wallpaper White.png" C:\_Support\background\HCCSC_Wallpaper_Red.png /Y
