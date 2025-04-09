.model small  
.stack 100h  

.data  
cr equ 0dh   ; Define carriage return  
lf equ 0ah   ; Define line feed  

msg1 db 'Enter a lower-case letter: $'  
msg2 db 0dh,0ah, 'In upper case it is: '  
upper db ?,'$'  

msg3 db 0dh,0ah,0dh,0ah, 'Enter an upper-case letter: $'  
msg4 db 0dh,0ah, 'In lower case it is: '  
lower db ?,'$'  

.code  

main proc  
    ; ------------------------------  
    ; Data Segment Initialization  
    ; ------------------------------  
    mov ax, @data      
    mov ds, ax          

    ; ------------------------------  
    ; Step 1: Convert Lowercase to Uppercase  
    ; ------------------------------  
    lea dx, msg1        ; Load address of msg1 (prompt for lowercase letter)  
    mov ah, 9           ; DOS function to display a string  
    int 21h             ; Print the message  

    mov ah, 1           ; DOS function to take a single character input  
    int 21h             ; Get user input in AL  

    sub al, 20h         ; Convert lowercase to uppercase (by subtracting 32 in ASCII)  
    mov upper, al       ; Store the converted uppercase letter  

    ; ------------------------------  
    ; Step 2: Display the Uppercase Letter  
    ; ------------------------------  
    lea dx, msg2        ; Load address of msg2 (output message)  
    mov ah, 9           ; DOS function to display a string  
    int 21h             ; Print the message  

    mov ah, 2           ; DOS function to display a single character  
    mov dl, upper       ; Load uppercase character into DL  
    int 21h             ; Print the uppercase character  

    ; ------------------------------  
    ; Step 3: Convert Uppercase to Lowercase  
    ; ------------------------------  
    lea dx, msg3        ; Load address of msg3 (prompt for uppercase letter)  
    mov ah, 9           ; DOS function to display a string  
    int 21h             ; Print the message  

    mov ah, 1           ; DOS function to take a single character input  
    int 21h             ; Get user input in AL  

    add al, 20h         ; Convert uppercase to lowercase (by adding 32 in ASCII)  
    mov lower, al       ; Store the converted lowercase letter  

    ; ------------------------------  
    ; Step 4: Display the Lowercase Letter  
    ; ------------------------------  
    lea dx, msg4        ; Load address of msg4 (output message)  
    mov ah, 9           ; DOS function to display a string  
    int 21h             ; Print the message  

    mov ah, 2           ; DOS function to display a single character  
    mov dl, lower       ; Load lowercase character into DL  
    int 21h             ; Print the lowercase character  

    ; ------------------------------  
    ; Step 5: Exit the Program  
    ; ------------------------------  
    mov ah, 4ch         ; DOS function to terminate the program  
    int 21h             ; Exit program and return control to the OS  

main endp  
end main  
