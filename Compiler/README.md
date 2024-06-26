# [Brainf*** Compiler](/README.md#brainf)

I'm the man who can implement a compiler of a Turing complete programming language.


### **\<List>**

- [VBA : Compiler & Debugger Version 0.9 (2024.06.26)](#vba--compiler--debugger-version-09-20240626)


## [VBA : Compiler & Debugger Version 0.9 (2024.06.26)](#list)

- Features
  ![Brainfuck Compiler Ver. 0.9](/Compiler/Images/BrainfuckCompiler_0.9.png)
  - Above all, the compilation of Brainfuck code is successful.
  - The input value requested by the `,` keyword can be applied.
  - Display the values stored in each pointer on the left side of the screen to monitor them(up to 255 pointers can be used).
- Future Improvements
  - Reflect changes in pointer values immediately on the screen during code execution for debugging purposes.
  - Display the corresponding ASCII character for the pointer value.
  - Gradually output intermediate results during the program's progress, not just the final result.
  - Show unused pointer values as empty cells instead of zero.
  - Clear the cells in column `B` that display pointer values and the cell `D18` that displays the execution result when the `Run` button is pressed.
- Code
  <details>
    <summary>BrainfuckCompiler_0.9.bas</summary>

  ```vba
  Option Explicit
  ```
  ```vba
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
  ```
  ```vba
  Private Sub btnRun_Click()

      Application.Calculation = xlManual
          Call RunBrainfuck
      Application.Calculation = xlAutomatic

  End Sub
  ```
  </details>
