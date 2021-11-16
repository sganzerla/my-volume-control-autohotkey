Unicode true

!include "MUI2.nsh"

!define PRODUCT_NAME "My Volume Control AutoHotKey"
!define PRODUCT_PUBLISHER "My Volume Control AutoHotKey"  
!define PRODUCT_VERSION "1.0.0.0"
!define VERSION "1.0.0.0"
VIProductVersion "${PRODUCT_VERSION}"
VIFileVersion "${VERSION}"
VIAddVersionKey "FileVersion" "${VERSION}"
VIAddVersionKey "FileDescription" "Configurar My Volume Control AutoHotKey"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!insertmacro MUI_PAGE_FINISH
; Language files
!insertmacro MUI_LANGUAGE "PortugueseBR"
; MUI end ------

Name "${PRODUCT_NAME}"
OutFile "dist\install-my-volume-control-autohotkey.exe"
InstallDir "D:\My Volume Control AutoHotKey"
ShowInstDetails show
ShowUnInstDetails show
SetCompress auto

Section -SETTINGS
  SetOutPath "$INSTDIR"
  SetOverwrite ifnewer
SectionEnd

Section "Copiando arquivos" SEC01
  SetOutPath "$INSTDIR"
  AllowSkipFiles off
  File /r "assets\volume.ahk"
  SetOutPath "$INSTDIR\assets"
  File /r "assets\AutoHotkey_1.1.33.10_setup.exe"
SectionEnd 

Section "Executando instalador SDK AutoHotKey" SEC02
  ExecWait "$INSTDIR\assets\AutoHotkey_1.1.33.10_setup.exe"
SectionEnd

Section "Criando atalho" SEC03
  SetShellVarContext current
  CreateShortCut "$DESKTOP\VolumeControl.lnk" "$INSTDIR\volume.ahk"
SectionEnd

Section "Startup with Windows" SEC04
    ; cria arquivo ou sobreescreve um existente com este conteúdo
    FileOpen $4 "$PROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\volumeControl.bat" w 
    FileWrite $4 "@echo off$\r$\n"
    FileWrite $4 "@echo                    ***    VolumeControl !    ***$\r$\n"
    FileWrite $4 "ping -n 3 localhost>nul$\r$\n"
    FileWrite $4 "start $Desktop\VolumeControl$\r$\n"
    FileWrite $4 "exit$\r$\n"
    FileClose $4 ;Closes the filled file
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
SectionEnd

Section Uninstall
  RMDir /r "$INSTDIR"
  Delete "$DESKTOP\VolumeControl.lnk"
   Delete "$PROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\volumeControl.bat"
  ; não está sendo desinstalado o SDK AutoHotKey
SectionEnd

