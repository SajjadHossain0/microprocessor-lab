.model small
.stack 100h

.data
    str db 'sajjad hossain$'       ; Original lowercase string
    msg1 db 'Original string: $'
    msg2 db 0dh, 0ah, 'Uppercase string: $'

.code

main proc
    mov ax, @data
    mov ds, ax

    ; Display original string
    lea dx, msg1
    mov ah, 9
    int 21h

    lea dx, str
    mov ah, 9
    int 21h

    ; New line
    mov dl, 0dh
    mov ah, 2
    int 21h
    mov dl, 0ah
    int 21h

    ; Display label for uppercase string
    lea dx, msg2
    mov ah, 9
    int 21h

    ; Convert lowercase to uppercase
    lea si, str       ; Point to string
    convert:
        mov al, [si]  ; Load character
        cmp al, '$'   ; Check end of string
        je done
        cmp al, 'a'
        jb skip       ; Skip if less than 'a'
        cmp al, 'z'
        ja skip       ; Skip if greater than 'z'
        sub al, 32    ; Convert to uppercase

    skip:
        mov dl, al    ; Display character
        mov ah, 2
        int 21h
        inc si
        jmp convert

    done:
    ; Exit program
    mov ah, 4ch
    int 21h

main endp
end main
