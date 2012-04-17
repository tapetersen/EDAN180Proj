    .text   
    .global main
main:
    pushl   %ebp            # save dynlink
    movl    %esp, %ebp      # set framepointer
    subl    $24, %esp       # allocate stackspace
    movl    %ecx, -4(%ebp)  # save statlink
    movl    $1, %eax        
    movl    $0, %edx        
    andl    %edx, %eax      
    movl    %eax, -16(%ebp) 
    movl    $1, %eax        
    xorl    $1, %eax        
    movl    %eax, -20(%ebp) 
    movl    -16(%ebp), %eax 
    movl    -20(%ebp), %edx 
    orl     %edx, %eax      
    movl    %eax, -12(%ebp) 
    movl    $3, %eax        
    movl    8(%ebp), %edx   
    cmpl    %edx, %eax      
    sete    %al             
    andl    $0x000000ff, %eax
    movl    %eax, -24(%ebp) 
    movl    -12(%ebp), %eax 
    movl    -24(%ebp), %edx 
    orl     %edx, %eax      
    movl    %eax, -8(%ebp)  
    leave   
    ret     

