.model small  
.stack 100h  

.data  
cr equ 0dh   ; Define carriage return  
lf equ 0ah   ; Define line feed  

msg1 db 'Enter a digit: $'  
msg2 db 0dh,0ah, 'In ASCII it is: '  
char db ?,'$'  

msg3 db 0dh,0ah,0dh,0ah, 'Enter an ASCII character: $'  
msg4 db 0dh,0ah, 'As a digit, it is: '  
char1 db ?,'$'  

.code  

main proc  
    ; ------------------------------  
    ; Data Segment Initialization  
    ; ------------------------------  
    mov ax, @data      
    mov ds, ax          

    ; ------------------------------  
    ; Step 1: Convert Digit to ASCII  
    ; ------------------------------  
    lea dx, msg1        ; Load address of msg1 (prompt for digit input)  
    mov ah, 9           ; DOS function to display a string  
    int 21h             ; Print the message  

    mov ah, 1           ; DOS function to take a single character input  
    int 21h             ; Get user input in AL  

    sub al, 30h         ; Convert digit to ASCII (subtracting 48 in decimal)  
    mov char, al        ; Store the converted ASCII value  

    ; ------------------------------  
    ; Step 2: Display the ASCII Equivalent  
    ; ------------------------------  
    lea dx, msg2        ; Load address of msg2 (output message)  
    mov ah, 9           ; DOS function to display a string  
    int 21h             ; Print the message  

    mov ah, 2           ; DOS function to display a single character  
    mov dl, char        ; Load ASCII character into DL  
    int 21h             ; Print the ASCII equivalent  

    ; ------------------------------  
    ; Step 3: Convert ASCII to Digit  
    ; ------------------------------  
    lea dx, msg3        ; Load address of msg3 (prompt for ASCII input)  
    mov ah, 9           ; DOS function to display a string  
    int 21h             ; Print the message  

    mov ah, 1           ; DOS function to take a single character input  
    int 21h             ; Get user input in AL  

    add al, 30h         ; Convert ASCII to digit (adding 48 in decimal)  
    mov char1, al       ; Store the converted digit  

    ; ------------------------------  
    ; Step 4: Display the Digit Equivalent  
    ; ------------------------------  
    lea dx, msg4        ; Load address of msg4 (output message)  
    mov ah, 9           ; DOS function to display a string  
    int 21h             ; Print the message  

    mov ah, 2           ; DOS function to display a single character  
    mov dl, char1       ; Load digit into DL  
    int 21h             ; Print the digit equivalent  

    ; ------------------------------  
    ; Step 5: Exit the Program  
    ; ------------------------------  
    mov ah, 4ch         ; DOS function to terminate the program  
    int 21h             ; Exit program and return control to the OS  

main endp  
end main  
