.model small  
.stack 100h  

lf equ 0ah   ; Define line feed (LF) for new line
cr equ 0dh   ; Define carriage return (CR) for new line

.data  
a db 'Enter input a: $'    ; Message for first input
b db 'Enter input b: $'    ; Message for second input
c db 'The result is: $'    ; Message for displaying result
d db 'Subtraction',0ah,0dh,'$'  ; "Subtraction" label followed by new line
e db 'Addition',0ah,0dh,'$'     ; "Addition" label followed by new line

.code  

main proc  
    
    ; ------------------------------
    ; Data Segment Initialization  
    ; ------------------------------
    mov ax, @data  
    mov ds, ax    

    ; ------------------------------
    ; Step 1: Perform Addition  
    ; ------------------------------
    
    mov ah,9        ; DOS function to display a string  
    lea dx,e        ; Load the address of the "Addition" label  
    int 21h         ; Print "Addition"  

    ; Prompt for First Input (a)  
    mov ah,9        
    lea dx,a        ; Load the address of "Enter input a:"  
    int 21h         

    mov ah,1        ; DOS function to take input character  
    int 21h         ; Take first character input (ASCII stored in AL)  
    mov bl,al       ; Store input in BL  

    ; Print New Line  
    mov ah,2        
    mov dl,cr       ; Carriage return  
    int 21h         
    mov dl,lf       ; Line feed  
    int 21h         

    ; Prompt for Second Input (b)  
    mov ah,9        
    lea dx,b        ; Load the address of "Enter input b:"  
    int 21h        

    mov ah,1        ; DOS function to take input character  
    int 21h         ; Take second character input  
    mov bh,al       ; Store input in BH  

    ; Print New Line  
    mov ah,2        
    mov dl,cr       
    int 21h         
    mov dl,lf       
    int 21h         

    ; Display Result Label  
    mov ah,9        
    lea dx,c        ; Load the address of "The result is:"  
    int 21h        

    ; Perform Addition of ASCII values  
    add bl, bh      ; Add ASCII values of input characters  
    sub bl, 48      ; Convert from ASCII to decimal  

    ; Display Result  
    mov ah,2        
    mov dl,bl       ; Load result into DL  
    int 21h         

    ; Print New Line  
    mov ah,2        
    mov dl,cr       
    int 21h         
    mov dl,lf       
    int 21h         

    ; ------------------------------
    ; Step 2: Perform Subtraction  
    ; ------------------------------

    mov ah,9        
    lea dx,d        ; Load the address of "Subtraction" label  
    int 21h        

    ; Prompt for First Input (a) Again  
    mov ah,9        
    lea dx,a        ; Load the address of "Enter input a:"  
    int 21h        

    mov ah,1        
    int 21h        
    mov bl,al       ; Store input in BL  

    ; Print New Line  
    mov ah,2        
    mov dl,cr       
    int 21h         
    mov dl,lf       
    int 21h         

    ; Prompt for Second Input (b) Again  
    mov ah,9        
    lea dx,b        ; Load the address of "Enter input b:"  
    int 21h        

    mov ah,1        
    int 21h        
    mov bh,al       ; Store input in BH  

    ; Print New Line  
    mov ah,2        
    mov dl,cr       
    int 21h         
    mov dl,lf       
    int 21h         

    ; Display Result Label  
    mov ah,9        
    lea dx,c        ; Load the address of "The result is:"  
    int 21h        

    ; Perform Subtraction of ASCII values  
    sub bl, bh      ; Subtract ASCII values of input characters  
    add bl, 48      ; Convert from decimal back to ASCII  

    ; Display Result  
    mov ah,2        
    mov dl,bl       ; Load result into DL  
    int 21h        

    ; ------------------------------
    ; Exit the Program  
    ; ------------------------------
    mov ah,4ch      
    int 21h         

main endp  
end main  
