    .text   
    .global main
main:
    pushl   %ebp            # save dynlink
    movl    %esp, %ebp      # set framepointer
    subl    $20, %esp       # allocate stackspace
    movl    %ecx, -4(%ebp)  # save statlink
    movl    %ebp, %ecx      
    call    read            
    movl    %eax, %eax      
    movl    %eax, -4(%ebp)  
loop_0:
    movl    -4(%ebp), %eax  
    movl    $0, %edx        
    cmpl    %edx, %eax      
    setl    %al             
    andl    $0x000000ff, %eax
    movl    %eax, -16(%ebp) 
    movl    -16(%ebp), %eax 
    cmpl    $1, %eax        
    je      endLoop_0       
    subl    $4, %esp        
    movl    -4(%ebp), %eax  
    movl    %eax, -24(%ebp) 
    movl    %ebp, %ecx      
    call    main.factorial  
    addl    $4, %esp        
    movl    %eax, -20(%ebp) 
    movl    -20(%ebp), %eax 
    movl    %eax, -4(%ebp)  
    subl    $4, %esp        
    movl    -4(%ebp), %eax  
    movl    %eax, -24(%ebp) 
    movl    %ebp, %ecx      
    call    writeint        
    addl    $4, %esp        
    movl    %ebp, %ecx      
    call    writeln         
    movl    %ebp, %ecx      
    call    read            
    movl    %eax, %eax      
    movl    %eax, -4(%ebp)  
    jmp     loop_0          
endLoop_0:
    leave   
    ret     
main.factorial:
    pushl   %ebp            # save dynlink
    movl    %esp, %ebp      # set framepointer
    subl    $20, %esp       # allocate stackspace
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
    jmp     else_0          
if_0:
    movl    $1, %eax        
    leave   
    ret     
    jmp     fi_0            
else_0:
    subl    $4, %esp        
    movl    8(%ebp), %eax   
    movl    $1, %edx        
    subl    %edx, %eax      
    movl    %eax, -16(%ebp) 
    movl    -16(%ebp), %eax 
    movl    %eax, -24(%ebp) 
    movl    -4(%ebp), %ecx  
    call    main.factorial  
    addl    $4, %esp        
    movl    %eax, -20(%ebp) 
    movl    8(%ebp), %eax   
    movl    -20(%ebp), %edx 
    imull   %edx, %eax      
    movl    %eax, -12(%ebp) 
    movl    -12(%ebp), %eax 
    leave   
    ret     
    jmp     fi_0            
fi_0:

