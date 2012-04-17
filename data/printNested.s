    .text   
    .global main
printNested:
    pushl   %ebp            # save dynlink
    movl    %esp, %ebp      # set framepointer
    subl    $12, %esp       # allocate stackspace
    movl    %ecx, -4(%ebp)  # save statlink
    movl    $1, %eax        
    movl    %eax, -4(%ebp)  
    movl    %ebp, %ecx      
    call    printNested.innerProc
    movl    %eax, -12(%ebp) 
    leave   
    ret     
printNested.innerProc:
    pushl   %ebp            # save dynlink
    movl    %esp, %ebp      # set framepointer
    subl    $4, %esp        # allocate stackspace
    movl    %ecx, -4(%ebp)  # save statlink
    subl    $4, %esp        
    movl    %ebp, %ecx      
    movl    -4(%ebp), %ebp  
    movl    -4(%ebp), %eax  
    movl    %ecx, %ebp      
    movl    %eax, -8(%ebp)  
    movl    %ebp, %ecx      
    call    writeint        
    addl    $4, %esp        
    leave   
    ret     

