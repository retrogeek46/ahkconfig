#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 2 ; This let's any window that partially matches the given name get activated

IniRead, gitPat, config.ini, SENSITIVE_KEYS, PAT ; get github PAT
IniRead, swaggerPass, config.ini, SENSITIVE_KEYS, SWAGGER_PASSWORD ; get swagger password

; LK67 doesn't support F13-F24, so we add Ctrl+Alt bindings as well

; Open Desktop
F21::
^!D::
Run, %A_Desktop%
return

; Open Coding Folder
F23::
^!C::
Run, "E:\Coding"
return

; Open desktop junk folder
^!R::
Run, "E:\Random Shit"
return

; Alt Tab with LK67 knob
LAlt & Pause::AltTab
LAlt & ScrollLock::ShiftAltTab

#ifWinActive Azure Data Studio
; Type SELECT * FROM 
F13::
^!1::
Send SELECT * FROM{space}
return
F14::
^!2::
; Run code
Send {f5}
return
F15::
^!3::
; Type WITH (NOLOCK)
Send WITH (NOLOCK)
return

#ifWinActive Microsoft Visual Studio
; Type Console.WriteLine(); and place cursor inside parenthesis
F13::
^!1::
Send Console.WriteLine();{Left 2}
return
; Type Debug.Log(); and place cursor inside parenthesis
F14::
^!2::
Send Debug.Log();{Left 2}
return

#ifWinActive Visual Studio Code
; Type logger.info(); and place cursor inside parenthesis
F13::
^!1::
Send logger.info();{Left 2}
return
F14::
^!2::
; Type console.log(); and place cursor inside parenthesis
Send console.log();{Left 2}
return
; Type { get; set; } 
F15::
^!3::
SendRaw { get; set; }
return
; Type flaskRun VendorRating/__init__.py 
F16::
^!4::
Send flaskRun VendorRating/__init__.py
return

; Hyper is a terminal for command line stuff
#ifWinActive Hyper
; Type sudo systemctl restart 
F13::
^!1::
Send sudo systemctl restart{space}
return
; Type the github personal access token to access private repo's in remote server
F14::
^!2::
Send %gitPat%
return
; Type cd ZED-Q/zedQRealtimeServer/
F15::
^!3::
Send cd ZED-Q/zedQRealtimeServer/
return

; Swagger UI is used for REST api's interactions
#ifWinActive Swagger UI
; First copy JWT from login endpoint, then go to Autorize window and set auth headers
F13::
^!1::
Send Bearer ^V
return
; Type master password for login endpoint
F14::
^!2::
Send %swaggerPass%
return

; ngrok is a localhost tunneling application, share you localhost:port to anyone
#ifWinActive ngrok
; Start ngrok for https servers and India region
F13::
^!1::
Send ngrok http https://localhost:44367 -host-header="localhost:44367" -region in
return

#ifWinActive Adobe Premiere Pro
; Timeline scrubbing with knob
ScrollLock::
Send {Shift down}{Left down}{Shift up}{Left up}
return
Pause::
Send {Shift down}{Right down}{Shift up}{Right up}
return
; Change Effects Control panel properties by holding left mouse button and turning knob
~LButton & Pause::
if GetKeyState("Del")
    MouseMove 1, 0, 2, R
else
    MouseMove 10, 0, 2, R
return
~LButton & ScrollLock::
if GetKeyState("Del")
    MouseMove -1, 0, 2, R
else
    MouseMove -10, 0, 2, R
return

; Everything is the windows search application by voidtools
#ifWinActive Everything
; Type main.ahk as you can compile and reload the script from Everyting window itself 
^!1::
Send main.ahk
return

; I use Microsoft Edge ¯\_(ツ)_/¯
#ifWinActive Edge
; Cycle through browser tabs
ScrollLock::
Send ^+{tab}
return
Pause::
Send ^{tab}
return