section .data
    hello_smg db 'Hello, World!',0x0A ; 'Hello, World!' string followed by newline

section .text
    global _start           ; makes the _start label accessible outside this file

_start:
  mov rax, 1                ; syscall number for sys_write
  mov rdi, 1                ; file descriptor 1 is stdout
  mov rsi, hello_smg        ; address of string to output
  mov rdx, 14               ; number of bytes
  syscall                   ; invoke operating system to perform the operation

  mov rax, 60               ; syscall number for sys_exit
  xor rdi, rdi              ; exit code 0
  syscall                   ; invoke operating system to exit
