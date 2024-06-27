' BrainFuck Interpreter & Debugger Version 0.9 Beta
' 2024.06.26


Option Explicit


Private Sub RunBrainfuck()

    ' Declare variables
    Dim code As String
    Dim inputStr As String
    Dim cells(255) As Long
    Dim ptr As Long
    Dim inputPtr As Long
    Dim codePtr As Long
    Dim loopStack As Collection
    Dim i As Long, loopStart As Long, loopEnd As Long
    Dim output As String
    Dim currentChar As String

    On Error GoTo ErrorHandler

    ' Initialize variables
    code = Range("D2").Value
    inputStr = Range("D17").Value
    ptr = 0
    inputPtr = 1
    codePtr = 1
    Set loopStack = New Collection
    output = ""

    ' Run Brainfuck code
    Do While codePtr <= Len(code)
        currentChar = Mid(code, codePtr, 1)
        Select Case currentChar
            Case ">"
                ptr = (ptr + 1) Mod 256
            Case "<"
                ptr = (ptr - 1) Mod 256
            Case "+"
                cells(ptr) = (cells(ptr) + 1) Mod 256
            Case "-"
                cells(ptr) = (cells(ptr) - 1) Mod 256
            Case "."
                output = output & Chr(cells(ptr))
            Case ","
                If inputPtr <= Len(inputStr) Then
                    cells(ptr) = Asc(Mid(inputStr, inputPtr, 1))
                    inputPtr = inputPtr + 1
                Else
                    cells(ptr) = 0
                End If
            Case "["
                If cells(ptr) = 0 Then
                    loopStart = 1
                    Do While loopStart > 0
                        codePtr = codePtr + 1
                        If Mid(code, codePtr, 1) = "[" Then loopStart = loopStart + 1
                        If Mid(code, codePtr, 1) = "]" Then loopStart = loopStart - 1
                    Loop
                Else
                    loopStack.Add codePtr
                End If
            Case "]"
                If cells(ptr) <> 0 Then
                    codePtr = loopStack(loopStack.Count)
                Else
                    loopStack.Remove loopStack.Count
                End If
        End Select
        codePtr = codePtr + 1
    Loop

    ' Print output
    Range("B2").Value = ptr
    For i = 0 To 25
        Range("B3").Offset(i, 0).Value = cells(i)
    Next i
    Range("D18").Value = output

    Exit Sub

ErrorHandler:

    Range("D18").Value = "Error at position: " & codePtr & ", Character: " & currentChar

End Sub


Private Sub btnRun_Click()

    Application.Calculation = xlManual
        Call RunBrainfuck
    Application.Calculation = xlAutomatic

End Sub
