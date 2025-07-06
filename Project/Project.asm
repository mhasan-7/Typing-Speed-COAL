INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
    level1Msg   BYTE "Level 1: Type the following sentence:", 0
    level1Text  BYTE "Assembly is easy.", 0
    level2Msg   BYTE "Level 2: Type the following sentence:", 0
    level2Text  BYTE "Typing in assembly builds logic.", 0
    level3Msg   BYTE "Level 3: Type the following sentence:", 0
    level3Text  BYTE "Real-time performance tracking in assembly is educational.", 0

    promptInput BYTE "Your input: ", 0
    result1     BYTE "Time taken (ms): ", 0
    result2     BYTE "Correct characters: ", 0
    result3     BYTE "Typing Speed (WPM): ", 0
    contPrompt  BYTE "Do you want to continue to the next level? (Y/N): ", 0
    userInput   BYTE 200 DUP(?)

    startTime   DWORD ?
    endTime     DWORD ?
    elapsedTime DWORD ?
    correctCount DWORD ?
    wpm         DWORD ?
    answer      BYTE ?

.code

doLevel PROC
    ; Inputs:
    ;   esi -> sentence text
    ;   edi -> level message

    ; Show level message
    mov edx, edi
    call WriteString
    call CrLf
    mov edx, esi
    call WriteString
    call CrLf
    call CrLf

    ; Start timer
    call GetTickCount
    mov startTime, eax

    ; Ask for user input
    mov edx, OFFSET promptInput
    call WriteString
    mov edx, OFFSET userInput
    mov ecx, 200
    call ReadString

    ; End timer
    call GetTickCount
    mov endTime, eax
    mov eax, endTime
    sub eax, startTime
    mov elapsedTime, eax

    ; Compare input with original
    xor ecx, ecx
    xor ebx, ebx

compareLoop:
    mov al, BYTE PTR [esi + ecx]
    cmp al, 0
    je doneCompare

    mov dl, BYTE PTR [userInput + ecx]
    cmp dl, 0
    je doneCompare

    cmp al, dl
    jne notMatch
    inc ebx

notMatch:
    inc ecx
    jmp compareLoop

doneCompare:
    mov correctCount, ebx

    ; WPM = (correct / 5) * (60000 / elapsedTime)
    mov eax, correctCount
    xor edx, edx
    mov ecx, 5
    div ecx
    mov ebx, eax

    mov eax, 60000
    xor edx, edx
    div elapsedTime
    mul ebx
    mov wpm, eax

    ; Output results
    call CrLf
    mov edx, OFFSET result1
    call WriteString
    mov eax, elapsedTime
    call WriteInt
    call CrLf

    mov edx, OFFSET result2
    call WriteString
    mov eax, correctCount
    call WriteInt
    call CrLf

    mov edx, OFFSET result3
    call WriteString
    mov eax, wpm
    call WriteInt
    call CrLf

    ret
doLevel ENDP

main PROC
    ; ----- Level 1 -----
    mov esi, OFFSET level1Text
    mov edi, OFFSET level1Msg
    call doLevel

    ; Ask to continue
    call CrLf
    mov edx, OFFSET contPrompt
    call WriteString
    call ReadChar
    mov answer, al
    call CrLf

    cmp al, 'Y'
    jne exitProgram
    cmp al, 'y'
    jne exitProgram

    ; ----- Level 2 -----
    mov esi, OFFSET level2Text
    mov edi, OFFSET level2Msg
    call doLevel

    ; Ask to continue
    call CrLf
    mov edx, OFFSET contPrompt
    call WriteString
    call ReadChar
    mov answer, al
    call CrLf

    cmp al, 'Y'
    jne exitProgram
    cmp al, 'y'
    jne exitProgram

    ; ----- Level 3 -----
    mov esi, OFFSET level3Text
    mov edi, OFFSET level3Msg
    call doLevel

exitProgram:
    call CrLf
    invoke ExitProcess, 0
main ENDP

END main
