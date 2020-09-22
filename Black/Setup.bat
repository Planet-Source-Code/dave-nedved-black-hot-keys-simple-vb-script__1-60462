@echo off
:start
@cls
@echo Initiating setup for Black...Please close active VB programs, if any.
@echo -----------------------------------------------------------------------
@pause
@ren "Setup\Reset.bin" "Reset.bat"
@call "Setup\Reset.bat"
@ren "Setup\Reset.bat" "Reset.bin"
@if not exist "Source\DEBUG\Black.bin" @goto fail
@if not exist "Setup\Black.bin" @goto fail
@ren "Source\DEBUG\Black.bin" "Black.exe"
@ren "Setup\Black.bin" "Black.exe"
@echo -----------------------------------------------------------------------
@echo Setup Completed, The Learning Files will Now Be Loaded...
@ren "Setup\Help.bin" "Help.vbs"
@if not exist "Setup\Help.vbs" @goto noVBS
@if exist "Setup\Help.vbs" @call "Setup\Help.vbs"
@ren "Setup\Help.vbs" "Help.bin"
@echo -----------------------------------------------------------------------
@echo OK, you have read the Learning Files... 
@echo Press ESC to exit the Setup Now, or any Key to Launch 'Black.exe'
@echo Please Note that to Exit Black Just Click on the Black Screen for
@echo Five Secconds [5 secs]
@echo -----------------------------------------------------------------------
@pause
@cls
@echo Black.exe is Now Running, press "Ctrl+Shift+~" to Activate
@echo and Click on the Black Screen for Five Secconds [5 secs] to Exit Black.
@echo -----------------------------------------------------------------------
@call "Source\DEBUG\Black.exe"
@cls
@goto end
:fail
@cls
@echo -----------------------------------------------------------------------
@echo Black.bin could not Be Found...
@echo Please investigate one of the reasons below,
@echo #1. It may be that you have Run this Setup Befour...
@echo     If this is So, you can Run Black.exe from the "Source\Debug" Folder
@echo     .
@echo #2. If this is the first time you have run this setup, then the
@echo     Required Files might be missing...
@echo     Check that the Following Files Are In The Following Dir's...
@echo     .
@echo     "Black.bin" in the "Source\DEBUG" Folder
@echo     "Black.bin" in the "Setup" Folder
@echo     "Help.bin" in the "Setup" Folder
@echo     .     
@echo If all else fails, try Re-Compiling the program using the Source.
@goto end
:noVBS
@ren "Setup\Help.vbs" "Help.bin"
@echo -----------------------------------------------------------------------
@echo Help.bin Could Not Be Found...
@echo Please Check that all the Setup Files are in the Setup Folder.
@echo The Setup Will Now Exit
@pause
@cls
:end
@echo -----------------------------------------------------------------------
@echo Thanks for using Black In case of problems, suggestions, bug -
@echo reports, please report them to the author via email.
@echo David Nedved
@echo dnedved@datosoftware.com
@echo Making your Private Life Easier...
@echo -----------------------------------------------------------------------
@pause
@echo on
