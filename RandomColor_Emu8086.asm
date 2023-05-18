org 100h
jmp begin  
flagS db 0
flagF db 0

ytop2 dw  0030h,006fh,
ybottom2  dw  0068h,00A8h
ytop dw 000fh
ybottom dw 0038h
xleft dw  0077h, 00ffh, 0190h
xright dw 00F7h,0180h, 0207h
skor db 0 
mouse_status dw 0
mouse_x dw 0
mouse_y dw 0 
rand_color dw ? 
enter dw 1c0dh
y_axis db 6
x_axis db 15
width db 15
height db 6
color_array db 74h,34h,14h,44h,54h,64h 
color db 0Fh  
msg db 'Please Select A Box','$' 
msg1 db 10,     '                                                                          ' , 13,10
    db 10,10,  '        *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  ' , 13,10
    db 10,    '      *                                                                   *', 13,10
    db     '           Welcome to the Color Guessing Game!                               ', 13,10
    db     '      *                                                                   *', 13,10
    db     '           Rules:                                              ', 13,10
    db     '      *    The game will start with the computer choosing a random color  *', 13,10 
    db     '           As long as the player guesses the color correctly,     '         ,13,10
    db     '      *    the score is increased.                                        *',13,10
    db     '           If the player cannot guess the color correctly,                   ',13,10
    db     '      *    the game will be over.                                         *',13,10
    db     '                                                                              ',13,10 
    db     '      *    Press enter to start game                                      *',13,10 
    db     '                                                                             ',13,10 
    db     '      *    Good Luck!!!                                                   *',13,10  
    db     '                                                                              ',13,10 
    db     '      *                                                                   *',13,10 
    db     '                                                                             ',13,10 
    db     '      *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  * *', '$'   
     
     
     
msg2 db   '                                                                          ' , 13,10
    db     '        *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  ' , 13,10
    db     '      *                                                                   *', 13,10
    db     '                                                                              ', 13,10
    db     '      *                                                                   *', 13,10
    db     '                                                                            ', 13,10
    db     '      *                                                                   *', 13,10 
    db     '                GAME OVER...                                                ',13,10
    db     '      *                                                                   *',13,10
    db     '                                                                     ',13,10 
    db     '      *                                                                   *',13,10 
    db     '                                                                           ',13,10 
    db     '      *                                                                   *',13,10  
    db     '                Press Enter to Play Again                                ',13,10 
    db     '      *                                                                   *',13,10 
    db     '                                                                           ',13,10 
    db     '      *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  * *', '$'
    
    msgw db     '                                                                          ' , 13,10
    db     '        *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  ' , 13,10
    db     '      *                                                                   *', 13,10
    db     '                                                                              ', 13,10
    db     '      *                                                                   *', 13,10
    db     '                CONGRATULATIONS YOU WIN THE GAME !!!!                           ', 13,10
    db     '      *                                                                   *', 13,10 
    db     '                SCORE:100                                                      ',13,10
    db     '      *                                                                   *',13,10
    db     '                                                                     ',13,10 
    db     '      *                                                                   *',13,10 
    db     '                                                                           ',13,10 
    db     '      *                                                                   *',13,10  
    db     '                  ',13,10 
    db     '      *                                                                   *',13,10 
    db     '                                                                           ',13,10 
    db     '      *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  * *', '$'  
    

 msg3 db 10, 'Congrualations your guess is correct.  Score:','$' 
 msg4 db 10, 'Wrong Choice Correct Color:Light Gray  Score: ','$'
 msg5 db 10, 'Wrong Choice Correct Color:Cyan  Score: ','$'
 msg6 db 10, 'Wrong Choice Correct Color:Dark Blue Score:','$'
 msg7 db 10, 'Wrong Choice Correct Color:Red Score:','$'
 msg8 db 10, 'Wrong Choice Correct Color:Magenta Score:','$'
 msg9 db 10, 'Wrong Choice Correct Color:Yellow Score:','$'  
 mh0  db '00','$'
 mh1  db '10','$'
 mh2  db '20','$'
 mh3  db '30','$'
 mh4  db '40','$'
 mh5  db '50','$'
 mh6  db '60','$'
 mh7  db '70','$'
 mh8  db '80','$'
 mh9  db '90','$'     
     
begin:
 LEA dx,msg1
 mov Ah,9
 int 21h
 jmp wait_for_enter
  
 wait_for_enter:
 mov ah,00
 int 16h
 cmp enter, ax
 je  clean
 jmp wait_for_enter  

  

 
 clean:
 cmp flagF,1
 je ClearScore
 cmp flagF,0
 je Clean1
 clearScore:
 mov flagF,0
 mov skor,0  
 clean1:
 mov x_axis, 15
 mov y_axis, 6
 mov bp,0 
 xor ax,ax
 xor bx,bx
 xor cx,cx
 xor dx,dx
 mov ax, 0600h
 mov bh,07
 mov cx,0000
 mov dx,184fh
 int 10h 
 mov bh, 00h
 mov dh, 02h
 mov dl,02h 
 mov ah, 02h
 int 10h  
 
 
  
random_color:
  MOV AH, 00h
  INT 1AH   
  mov  ax, dx
  xor  dx, dx
  mov  cx, 5
  div  cx
  add  dl, '0'
  sub  dl,30h 
  mov rand_color, dx   
  
start:
mov ah, 09h
int 10h
mov si,0
mov bh, 0
mov dh, 3 ; Calculate the y-axis position for the message
mov dl, 30 ; Calculate the x-axis position for the message
mov ah, 02h
int 10h
LEA dx, msg
mov ah, 09h
int 21h

draw_first_rectangles: 
  mov bx, si ; Load cl into bl as the index
  mov bh, 0 ; Set the high byte of bx to 0 (assuming color array is in the same segment)
  mov al, color_array[bx] ; Access the color element using bx as the index
  mov color, al ; Store the color value in color
  push ax ; save registers
  push bx
  push cx
  push dx
  
  mov bh, color ; set color
  mov ch, y_axis
  mov cl, x_axis
  mov dh, y_axis
  add dh, height
  mov dl, x_axis
  add dl, width
  mov ah,06h
  int 10h

  pop dx ; restore registers
  pop cx
  pop bx
  pop ax

  add x_axis, 17 
  inc si ; Increment si
  cmp si, 3 ; Compare si with 3
  jl draw_first_rectangles


mov si, 3 ; Start from index 3 for the second set of rectangles
mov x_axis, 15 ; Reset x_axis to the starting position
add y_axis, 8 ; Calculate the new y_axis for the second set of rectangles

draw_second_rectangles: 
  mov bx, si ; Load cl into bl as the index
  mov bh, 0 ; Set the high byte of bx to 0 (assuming color array is in the same segment)
  mov al, color_array[bx] ; Access the color element using bx as the index
  mov color, al ; Store the color value in color
  push ax ; save registers
  push bx
  push cx
  push dx
  
  mov bh, color ; set color
  mov ch, y_axis
  mov cl, x_axis
  mov dh, y_axis
  add dh, height
  mov dl, x_axis
  add dl, width
  mov ah,06h
  int 10h

  pop dx ; restore registers
  pop cx
  pop bx
  pop ax

  add x_axis, 17 
  inc si ; Increment si
  cmp si, 5 ; Compare si with 5
  jle draw_second_rectangles 
  
 wait_for_click:
 
 mov ax, 03h ; get mouse status
 int 33h
 mov mouse_x, cx
 mov mouse_y, dx

 mov mouse_status, bx
 cmp bx, 1 ; check if left button is pressed
 jne wait_for_click
  
 lea si,ytop2
 lea di,ybottom2
 
 cmpytop:
 mov ax,[si]
 cmp dx,ax
 jl Wait_for_click
 mov ax,[di] 
 cmp dx,ax 
 jl  setRegister1
 add si,2
 add di,2
 mov ax,[si]
 cmp dx,ax
 jl Wait_for_click
 mov ax,[di] 
 cmp dx,ax 
 jl  setRegister2
 jmp wait_for_click
 
 
 setRegister1:
 lea si,xleft
 lea di,xright
 jmp cmpxleft
    
 setRegister2:
 mov bp,3
 lea si,xleft
 lea di,xright
 jmp cmpxleft
 
 cmpxleft:
 mov ax,[si]
 cmp cx,ax
 jg cmpx
 dec bp
 mov ax,[di-2]
 cmp cx,ax
 jl result

 cmpx:
 inc bp
 cmp bp,3
 je  lastBox 
 cmp bp,6
 je lastBox
 add si,2
 add di,2 
 jmp cmpxleft 
 
 lastBox:
 dec bp
 
 result:
 cmp bp,rand_color 
 mov si, rand_color
 je success
 
 fail:
 mov flagF,1
 mov ax, 0600h
 mov bh,07
 mov cx,0000
 mov dx,184fh
 int 10h
 mov bh, 00h
 mov dh, 02h
 mov dl, 02h 
 mov ah, 02h
 int 10h      
 mov dx, offset msg2
 mov Ah,9
 int 21h 
 cmp rand_color,0
 je  mesaj0
 cmp rand_color,1
 je mesaj1
 cmp rand_color,2
 je mesaj2
 cmp rand_color,3
 je mesaj3
 cmp rand_color, 4
 je mesaj4
 cmp rand_color,5
 je mesaj5
 
 
  
 mesaj0:
 mov bh, 00h
 mov dh, 0ch
 mov dl, 10h 
 mov ah, 02h
 int 10h  
 LEA dx,msg4
 mov Ah,9
 int 21h 
 jmp checkSkor
 mov ah,00
 int 16h 
  
 cmp enter,ax
 je  clean
  
 mesaj1:
 mov bh, 00h
 mov dh, 0Ch
 mov dl,10h 
 mov ah, 02h
 int 10h
 LEA dx,msg5
 mov Ah,9
 int 21h 
 jmp checkSkor
 mov ah,00
 int 16h
 cmp enter,ax
 je  clean 
 
 mesaj2:
 mov bh, 00h
 mov dh, 0Ch
 mov dl,10h 
 mov ah, 02h
 int 10h   
 LEA dx,msg6
 mov Ah,9
 int 21h 
 jmp checkSkor
 mov ah,00
 int 16h
 cmp enter,ax
 je  clean
 
 
 mesaj3:
 mov bh, 00h
 mov dh, 0Ch
 mov dl,10h 
 mov ah, 02h
 int 10h 
 LEA dx,msg7
 mov Ah,9
 int 21h  
 jmp checkSkor 
 mov ah,00
 int 16h
 cmp enter,ax
 je  clean
 
  
 mesaj4:
 mov bh, 00h
 mov dh, 0ch
 mov dl,10h 
 mov ah, 02h
 int 10h
 LEA dx,msg8
 mov Ah,9
 int 21h 
 jmp checkSkor
 mov ah,00
 int 16h
 cmp enter,ax
 je  clean
 
  
 mesaj5:
 mov bh, 00h
 mov dh, 0Ch
 mov dl,10h 
 mov ah, 02h
 int 10h
 LEA dx,msg9
 mov Ah,9  
 jmp checkSkor
 int 21h
 mov ah,00
 int 16h
 cmp enter,ax
 je  clean
 
 
 checkSkor:
 cmp skor,0
 je m0
 cmp skor,1
 je m1 
 cmp skor,2
 je m2
 cmp skor,3
 je m3
 cmp skor,4
 je m4
 cmp skor,5
 je m5
 cmp skor,6
 je m6
 cmp skor,7
 je m7
 cmp skor,8
 je m8
 cmp skor,9
 je m9
 
 
 
 m0:
 LEA dx,mh0
 mov Ah,9
 int 21h 
 mov ah,00
 int 16h
 cmp enter,ax
 je  clean
 
  
 m1:
 LEA dx,mh1
 mov Ah,9
 int 21h 
 mov ah,00
 int 16h
 cmp enter,ax
 je  clean
  
 m2: 
 LEA dx,mh2
 mov Ah,9
 int 21h 
 mov ah,00
 int 16h
 cmp enter,ax
 je  clean
  
 m3:
 LEA dx,mh3
 mov Ah,9
 int 21h 
 mov ah,00
 int 16h
 cmp enter,ax
 je  clean
  
 m4:
 LEA dx,mh4
 mov Ah,9
 int 21h 
 mov ah,00
 int 16h
 cmp enter,ax
 je  clean
  
 m5:
 LEA dx,mh5
 mov Ah,9
 int 21h 
 mov ah,00
 int 16h
 cmp enter,ax
 je  clean
  
 m6:
 LEA dx,mh6
 mov Ah,9
 int 21h 
 mov ah,00
 int 16h
 cmp enter,ax
 je  clean
  
 m7:
 LEA dx,mh7
 mov Ah,9
 int 21h 
 mov ah,00
 int 16h
 cmp enter,ax
 je  clean
  
 m8:
 LEA dx,mh8
 mov Ah,9
 int 21h 
 mov ah,00
 int 16h
 cmp enter,ax
 je  clean
  
 m9:
 LEA dx,mh9
 mov Ah,9
 int 21h 
 mov ah,00
 int 16h
 cmp enter,ax
 je  clean
  
 
 mesajWin:

 mov ax, 0600h
 mov bh,07
 mov cx,0000
 mov dx,184fh
 int 10h  
 
 
 mov bh, 00h
 mov dh, 02h
 mov dl,02h 
 mov ah, 02h
 int 10h
 LEA dx,msgw
 mov Ah,9
 int 21h
  
 end:
 mov AH, 4ch
 int 21h 
 
 success:
 mov flags,1 
 mov bp,0
 inc skor
 cmp skor,10
 je mesajWin
 mov bh, 00h
 mov dh, 02h
 mov dl,0fh 
 mov ah, 02h
 int 10h
 LEA dx,msg3
 mov Ah,9
 int 21h
 jmp checkSkor
 jmp clean
 ret




ret
