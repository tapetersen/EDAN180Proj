    .global _start
_start: 
    movl    $42,    %ebx # exit code
    movl    $1,     %eax # sys_exit index
    int     $0x80       

