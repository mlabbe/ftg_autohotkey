
#SingleInstance force

; Frogtoss Autohotkey helpers

  
; 
; Move the current window to the left monitor
;
^left::
  ; Get monitor dimensions. 
  SysGet, Mon1, Monitor, 1 
  SysGet, Mon2, Monitor, 2 
  
  ; Determine which monitor is leftmost.
  Leftmost = %Mon1Left%
  if ( Mon2Left < Mon1Left )
    Leftmost = %Mon2Left%
  
  ; Get window dimensions
  WinGetPos, X,Y,W,H,A
  
  ; Determine the left and top destination points of the window.
  LeftPoint = %Leftmost%
  LeftPoint += 40
  TopPoint  = %Y%
  
  
  WinMove, A,, %LeftPoint%, %TopPoint%

  return
  
; 
; Move the current window to the right monitor
;
^right::
  ; Get monitor dimensions. 
  SysGet, Mon1, Monitor, 1 
  SysGet, Mon2, Monitor, 2 
  
  ; Determine which monitor is rightmost.
  Rightmost = %Mon2Left%
  if ( Mon2Left < Mon1Left ) 
  {
    Rightmost = %Mon1Left%
  }

  
  ; Get window dimensions
  WinGetPos, X,Y,W,H,A
  
  ; Determine the left and top destination points of the window.
  LeftPoint = %Rightmost%
  LeftPoint += 40
  TopPoint  = %Y%
  if ( TopPoint < 0 )
    TopPoint = 0
  
  WinMove, A,, %LeftPoint%, %TopPoint%

  return

;
; Swap emacs and vs, or just get vs up if needed.
;
^up::  
  IfWinActive, ahk_class Emacs
  {
     WinActivate, ahk_exe devenv.exe
     return
  }

  IfWinActive, ahk_exe devenv.exe
  {
      ; Visual studio to step down.  Minimize it.
      WinMinimize, ahk_exe devenv.exe
      WinActivate, ahk_class Emacs
      return
  }

  WinActivate, ahk_exe devenv.exe
  return

;
; Visual studio joystick support for debugging
; Intended for use with Xbox 360 controller
;
  
; Start button - continue
Joy8::  
  IfWinActive, ahk_class wndclass_desked_gsk
  {
     Send {F5}
  }
  return
  
; A Button - Step into
Joy1::  
  IfWinActive, ahk_class wndclass_desked_gsk
  {
    Send {F11}
  }
  return
  
; B Button - Step out
Joy2::  
  IfWinActive, ahk_class wndclass_desked_gsk
  {
    Send {Shift Down}{F11}{Shift Up}
  }
  return
  
; X Button - Step over
Joy3::  
  IfWinActive, ahk_class wndclass_desked_gsk
  {
    Send {F10}
  }
  return
  
; Y Button - toggle breakpoint 
Joy4::  
  IfWinActive, ahk_class wndclass_desked_gsk
  {
    Send {F9}
  }
  return
  
; RB - Toggle enable/disable all breakpoints
Joy6::
  IfWinActive, ahk_class wndclass_desked_gsk
  {
    ; The esc-esc prefix closes any menus if alt was already pressed
    Send {esc}{esc}!d{up}{up}{enter}
  }
  return
  
