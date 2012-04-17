    .text   
    .global main
main:
    pushl   %ebp            # save dynlink
    movl    %esp, %ebp      # set framepointer
    subl    $8, %esp        # allocate stackspace
    movl    %ecx, -4(%ebp)  # save statlink
    subl    $4, %esp        
    movl    $5, %eax        
    movl    %eax, -12(%ebp) 
    movl    %ebp, %ecx      
    call    main.printR     
    addl    $4, %esp        
    movl    %eax, -8(%ebp)  
    leave   
    ret     
main.printR:
    pushl   %ebp            # save dynlink
    movl    %esp, %ebp      # set framepointer
    subl    $16, %esp       # allocate stackspace
    movl    %ecx, -4(%ebp)  # save statlink
    movl    8(%ebp), %eax   
    movl    $0, %edx        
    cmpl    %edx, %eax      
    sete    %al             
    andl    $0x000000ff, %eax
    movl    %eax, -8(%ebp)  
    movl    -8(%ebp), %eax  
    cmpl    $1, %eax        
    je      if_0            
    jmp     fi_0            
if_0:
    leave   
    ret     
    jmp     fi_0            
fi_0:
    subl    $4, %esp        
    movl    8(%ebp), %eax   
    movl    %eax, -20(%ebp) 
    movl    %ebp, %ecx      
    call    writeint        
    addl    $4, %esp        
    subl    $4, %esp        
    movl    8(%ebp), %eax   
    movl    $1, %edx        
    subl    %edx, %eax      
    movl    %eax, -12(%ebp) 
    movl    -12(%ebp), %eax 
    movl    %eax, -20(%ebp) 
    movl    -4(%ebp), %ecx  
    call    main.printR     
    addl    $4, %esp        
    movl    %eax, -16(%ebp) 
    leave   
    ret     

