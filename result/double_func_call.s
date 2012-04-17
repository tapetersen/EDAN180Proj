    .text   
    .global main
main:
    pushl   %ebp            # save dynlink
    movl    %esp, %ebp      # set framepointer
    subl    $16, %esp       # allocate stackspace
    movl    %ecx, -4(%ebp)  # save statlink
    movl    %ebp, %ecx      
    call    main.one        
    movl    %eax, -12(%ebp) 
    movl    %ebp, %ecx      
    call    main.one        
    movl    %eax, -16(%ebp) 
    movl    -12(%ebp), %eax 
    movl    -16(%ebp), %edx 
    addl    %edx, %eax      
    movl    %eax, -8(%ebp)  
    leave   
    ret     
main.one:
    pushl   %ebp            # save dynlink
    movl    %esp, %ebp      # set framepointer
    subl    $4, %esp        # allocate stackspace
    movl    %ecx, -4(%ebp)  # save statlink
    movl    $1, %eax        
    leave   
    ret     

