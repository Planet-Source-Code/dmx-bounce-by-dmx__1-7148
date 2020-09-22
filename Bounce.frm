VERSION 5.00
Begin VB.Form Bounce 
   Caption         =   "Bounce"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   2040
      Top             =   1920
   End
   Begin VB.Image Pic 
      Height          =   480
      Left            =   2040
      Picture         =   "Bounce.frx":0000
      Top             =   1320
      Width           =   480
   End
End
Attribute VB_Name = "Bounce"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Motion As Integer

Private Sub Timer1_Timer()
'Select The Case Of Motion
Select Case Motion
    Case 1
        'Move Pic Left And UP
        Pic.Move Pic.Left - 125, Pic.Top - 100
        'Test To See If Pic Left Is Less Than Or Equal To 0
        If Pic.Left <= 0 Then
            'Make Pic Move Right And Up
            Motion = 2
        'Test To See If Pic Top Is Less Than Or Equal To 0
        ElseIf Pic.Top <= 0 Then
            'Make Pic Move Left And Down
            Motion = 4
        'End If
        End If
    Case 2
        'Move Pic Right And Up
        Pic.Move Pic.Left + 125, Pic.Top - 125
        'Test To See If Pic Left Is Greater Than Or Equal To The Form Width -
        'The Pic Width
        If Pic.Left >= (Bounce.Width - Pic.Width) Then
            'Move Pic Left And Up
            Motion = 1
        'Test To See If Pic Top Is Less Than Or Equal To 0
        ElseIf Pic.Top <= 0 Then
            'Move Pic Right And Down
            Motion = 3
        'End If
        End If
    Case 3
        'Move Pic Right And Down
        Pic.Move Pic.Left + 125, Pic.Top + 125
        'Test To See If Pic Is Greater Than Or Equal To The Form Width -
        'The Pic Width
        If Pic.Left >= (Bounce.Width - Pic.Width) Then
            'Move Pic Left And Down
            Motion = 4
        'Test To See If Pic Top + 720 Is Greater Than Or Equal To The Form Height
        ElseIf Pic.Top + 720 >= Bounce.Height Then
            'Move Pic Right And UP
            Motion = 2
        'End If
        End If
    Case 4
        'Move Pic Left And Down
        Pic.Move Pic.Left - 125, Pic.Top + 125
        'Test To See If Pic Left Is Less Than Or Equal To 0
        If Pic.Left <= 0 Then
        'Move Pic Right And Down
            Motion = 3
        'Test To See If Pic Top + 720 Is Greater Than Or Equal To The Form Height
        ElseIf Pic.Top + 720 >= Bounce.Height Then
            'Move Pic Left And Up
            Motion = 1
        'End If
        End If
    Case Else
        'If Motion Isn't Already Set, Set It To 1
        Motion = 1
'End Select
End Select
End Sub
