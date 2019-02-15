#include <GUIConstants.au3>
Local $i
; https://www.autoitscript.com/forum/topic/64703-how-about-a-progressbar-like-this/
$Gradient_Progress_Bar_Img = @ScriptDir & "\Gradient_Progress_Bar.bmp"

If Not FileExists($Gradient_Progress_Bar_Img) Then _
    InetGet("http://creator-lab.ucoz.ru/Images/Gradient_Progress_Bar.bmp", $Gradient_Progress_Bar_Img)

$Gui = GUICreate("Gradient Progress Bar", 340, 100)
GUISetBkColor(0x33334d)

GUICtrlCreateLabel("Progress Bar", 20, 15, 300, 15)
GUICtrlSetColor(-1, 0xfffffff)
GUICtrlCreatePic($Gradient_Progress_Bar_Img, 20, 30, 300, 15)

$Cover_Label = GUICtrlCreateLabel("", 20, 30, 300, 15,$SS_SUNKEN)

$percent= GUICtrlCreateLabel("" ,20, 70, 40, 20)
GUICtrlSetColor(-1, 0xfffffff)
GUISetState(@SW_SHOW)

While 1

            For $i = 1 To 315
                ControlMove($Gui, "", $Cover_Label, $i + 5, 30, 315 - $i, 15)

                $nMsg = GUIGetMsg()

                If $nMsg = $GUI_EVENT_CLOSE Then ExitLoop 2
				GUICtrlSetData($percent  , Int($i/3.15) & ' %')
                Sleep(20)
				If Int($i/3.15) = 100 Then
					Sleep(1000)
					ExitLoop 2
					endif
            Next

           ; GUICtrlSetData($Go_Button, "GO!")

WEnd
