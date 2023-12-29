.model SMALL 
.code 
 ORG 100h 
tdata: jmp proses
 ljudul db 13,10,'Menghitung Keliling Segitiga ( Jumlah Keliling <=9 )$'
 lsisi1 db 13,10,'Sisi 1 : $' 
 lsisi2 db 13,10,'Sisi 2 : $' 
 lsisi3 db 13,10,'Sisi 3 : $' 
 lkeliling db 13,10,'Keliling : $' 
 ; menyiapkan memori (var) untuk menerima inputan keyboard 
 vsisi1 db 23,?,23 dup(?) 
 vsisi2 db 23,?,23 dup(?) 
 vsisi3 db 23,?,23 dup(?) 
 vkeliling db 23,?,23 dup(?) 

proses:
    ; Menampilkan judul
    mov dx, offset ljudul
    mov ah, 09h
    int 21h

    ; Meminta input sisi 1
    mov dx, offset lsisi1
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    sub al, 30h ; Konversi dari ASCII ke decimal
    mov vsisi1, al

    ; Meminta input sisi 2
    mov dx, offset lsisi2
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    sub al, 30h ; Konversi dari ASCII ke decimal
    mov vsisi2, al

    ; Meminta input sisi 3
    mov dx, offset lsisi3
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    sub al, 30h ; Konversi dari ASCII ke decimal
    mov vsisi3, al

    ; keliling = sisi1 + sisi2 + sisi3
    mov al, vsisi1
    add al, vsisi2
    add al, vsisi3
    mov vkeliling, al

    ; Menampilkan keliling
    mov dx, offset lkeliling
    mov ah, 09h
    int 21h
    mov dl, vkeliling
    add dl, 30h ; Konversi dari decimal ke ASCII
    mov ah, 02h
    int 21h

    mov ax, 4c00h
    int 21h
