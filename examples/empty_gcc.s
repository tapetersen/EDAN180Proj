    .text
    .global main
main: 
    movq    $42, %rdi         # exit code
    call    exit

