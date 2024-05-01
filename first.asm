section .data
    num1 DB 5
    num2 DB 15
    ; reserve 20 bytes for the result string
    resultBuffer resb 20    

section .text
    global _start

  ;;;;;;;;;;;;
  ; Arithmetic
  ;;;;;;;;;;;;

_start:
  mov rsi, [num1]
  mov rdi, [num2]
  ; add num2 and num1 and store the results in rsi
  add rsi, rdi      

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Implement resultBufferLength,
  ; Calculating the length 
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ; assume the conversion routine sets up RDI to point right after the last valid char
  ; load the address of the start of resultBuffer
  mov rcx, resultBuffer 
  ; subtract the start address from the end address
  sub rdi, rcx
  ; move the calculated length into rdx for sys_write
  mov rdx, rdi

  ;;;;;;;;;;;;;;;;;;;;
  ; Prepare for output
  ;;;;;;;;;;;;;;;;;;;;
 
  ; move syscall number for sys_write
  mov rax, 1        
  ; file descriptior for stdout
  mov rdi, 1        
  ; address of the buffer containing the result string 
  mov rsi, resultBuffer 
  ; rdx already contains the length from previous calculations
  ; perform the syscall
  syscall
  
  ;;;;;;;;;;;;;;;;
  ; exit procedure
  ;;;;;;;;;;;;;;;;

  ; syscall number for sys_exit
  mov rax, 60
  ; exit code 0
  xor rdi, rdi
  ; perform the syscall
  syscall


