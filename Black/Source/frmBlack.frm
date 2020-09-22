VERSION 5.00
Begin VB.Form frmBlack 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   ClientHeight    =   3090
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4680
   Icon            =   "frmBlack.frx":0000
   LinkTopic       =   "Form1"
   MouseIcon       =   "frmBlack.frx":0152
   MousePointer    =   99  'Custom
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Visible         =   0   'False
   Begin VB.Timer tmrMDWN 
      Enabled         =   0   'False
      Interval        =   5000
      Left            =   1320
      Top             =   1920
   End
   Begin VB.Timer tmrCheck 
      Interval        =   100
      Left            =   1920
      Top             =   1920
   End
End
Attribute VB_Name = "frmBlack"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Rem \\ ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Rem \\ This is a small PRG that i wrote a long time ago...
Rem \\ I wrote it when I was in School, and we used to get in Trouble for doing
Rem \\ 'Bad' things on the Computers...
Rem \\ We used it to Fool the Teachers, so they would not notice that the
Rem \\ Computers were on / The Screen 'Appeared Off...' :)
Rem \\ I hope you can make good use of this Simple Code, please Leave ur Comments
Rem \\ Votes Ect, on PSC...
Rem \\ ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Rem \\ Author:  David Nedved
Rem \\ Company: DaTo Software
Rem \\ E-Mail:  dnedved@gmail.com or dnedved@datosoftware.com
Rem \\ Website: www.datosoftware.com
Rem \\ ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Rem \\ Dim What we will Use...
Option Explicit
 Dim VI As Integer
 Private Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Long) As Integer
 Private Declare Function SetWindowPos Lib "user32" (ByVal hWnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long

Private Sub Form_Load()
Rem \\ Set up "User Interface..." thats just a Black Screen... lol
Rem \\ We can't just maximize the Screen, cause what if people are Running
Rem \\ 'Dual Screen' or 'Wide Screens'... Otherwise we could maximize it.
Me.Top = 0
Me.Left = 0
Me.Width = 99999999
Me.Height = 9999999
Rem \\ Set VI (VI is like a Check Box, Thats ON & OFF, so we can tell wether the Screen is Black Or Not.
VI = "1"
Rem \\ Set this window on top of all others...
SetWindowPos Me.hWnd, -1, 0, 0, 0, 0, 3

Rem \\ COOL TIP - If you are like I was...
Rem \\            I Would say Run this Project At Startup...
Rem \\            To run 'Control Pannel >> Scheduled Tasks >> Add Scheduled Task >> Add the Tast to When my Computer Starts... :)
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
Rem \\ If the Mouse is Down enable the Close Timer...
Me.tmrMDWN.Enabled = True
End Sub

Private Sub Form_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
Rem \\ If the mouse is up, Disable the Close Timer...
Me.tmrMDWN.Enabled = False
End Sub

Private Sub tmrCheck_Timer()
Rem \\ Check if we should show 'BLACK' Screen...
Rem \\ To Activate the Black screen press - Ctrl+Shift+~ or Ctrl+Shift+`
If VI = "1" Then
 If GetAsyncKeyState(17) And GetAsyncKeyState(16) And GetAsyncKeyState(192) Then
  Me.Visible = True
  Me.SetFocus
  VI = "2"
  Exit Sub
 End If
End If
If VI = "2" Then
 If GetAsyncKeyState(17) And GetAsyncKeyState(16) And GetAsyncKeyState(192) Then
  Me.Visible = False
  VI = "1"
  Exit Sub
 End If
End If
Rem \\ COOL TIP - GetAsyncKeyState(17) is the Key "Ctrl"
Rem \\            If you want to change the keys / View Keys ect...
Rem \\            write: 'Msgbox KeyCode' in the 'Form_KeyDown' Sub
End Sub

Private Sub tmrMDWN_Timer()
Rem \\ If the mouse is CLicked / Held down for 5 Secconds, then END the program.
End
End Sub
