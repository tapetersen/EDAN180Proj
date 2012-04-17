    .text   
    .global main
main:
    pushl   %ebp            # save dynlink
    movl    %esp, %ebp      # set framepointer
    subl    $116, %esp      # allocate stackspace
    movl    %ecx, -4(%ebp)  # save statlink
    movl    $1, %eax        
    movl    %eax, -4(%ebp)  
    movl    $2, %eax        
    movl    %eax, -4(%ebp)  
    movl    $3, %eax        
    movl    %eax, -4(%ebp)  
    movl    $1, %eax        
    movl    %eax, -4(%ebp)  
    movl    $1, %eax        
    movl    %eax, -4(%ebp)  
    movl    $0, %eax        
    movl    %eax, -4(%ebp)  
    movl    -4(%ebp), %eax  
    movl    -4(%ebp), %edx  
    addl    %edx, %eax      
    movl    %eax, -36(%ebp) 
    movl    -36(%ebp), %eax 
    movl    %eax, -4(%ebp)  
    movl    -4(%ebp), %eax  
    movl    -4(%ebp), %edx  
    subl    %edx, %eax      
    movl    %eax, -40(%ebp) 
    movl    -40(%ebp), %eax 
    movl    %eax, -4(%ebp)  
    movl    -4(%ebp), %eax  
    movl    -4(%ebp), %edx  
    imull   %edx, %eax      
    movl    %eax, -44(%ebp) 
    movl    -44(%ebp), %eax 
    movl    %eax, -4(%ebp)  
    movl    -4(%ebp), %eax  
    movl    -4(%ebp), %ecx  
    movl    $0, %edx        
    idivl   %ecx            
    movl    %eax, -48(%ebp) 
    movl    -48(%ebp), %eax 
    movl    %eax, -4(%ebp)  
    movl    -4(%ebp), %eax  
    movl    -4(%ebp), %edx  
    cmpl    %edx, %eax      
    setl    %al             
    andl    $0x000000ff, %eax
    movl    %eax, -52(%ebp) 
    movl    -52(%ebp), %eax 
    movl    %eax, -4(%ebp)  
    movl    -4(%ebp), %eax  
    movl    -4(%ebp), %edx  
    cmpl    %edx, %eax      
    setg    %al             
    andl    $0x000000ff, %eax
    movl    %eax, -56(%ebp) 
    movl    -56(%ebp), %eax 
    movl    %eax, -4(%ebp)  
    movl    -4(%ebp), %eax  
    movl    -4(%ebp), %edx  
    cmpl    %edx, %eax      
    setle   %al             
    andl    $0x000000ff, %eax
    movl    %eax, -60(%ebp) 
    movl    -60(%ebp), %eax 
    movl    %eax, -4(%ebp)  
    movl    -4(%ebp), %eax  
    movl    -4(%ebp), %edx  
    cmpl    %edx, %eax      
    setge   %al             
    andl    $0x000000ff, %eax
    movl    %eax, -64(%ebp) 
    movl    -64(%ebp), %eax 
    movl    %eax, -4(%ebp)  
    movl    -4(%ebp), %eax  
    movl    -4(%ebp), %edx  
    cmpl    %edx, %eax      
    sete    %al             
    andl    $0x000000ff, %eax
    movl    %eax, -68(%ebp) 
    movl    -68(%ebp), %eax 
    movl    %eax, -4(%ebp)  
    movl    -4(%ebp), %eax  
    movl    -4(%ebp), %edx  
    cmpl    %edx, %eax      
    setne   %al             
    andl    $0x000000ff, %eax
    movl    %eax, -72(%ebp) 
    movl    -72(%ebp), %eax 
    movl    %eax, -4(%ebp)  
    movl    -4(%ebp), %eax  
    movl    -4(%ebp), %edx  
    cmpl    %edx, %eax      
    setl    %al             
    andl    $0x000000ff, %eax
    movl    %eax, -80(%ebp) 
    movl    -4(%ebp), %eax  
    movl    -4(%ebp), %edx  
    cmpl    %edx, %eax      
    sete    %al             
    andl    $0x000000ff, %eax
    movl    %eax, -84(%ebp) 
    movl    -80(%ebp), %eax 
    movl    -84(%ebp), %edx 
    orl     %edx, %eax      
    movl    %eax, -76(%ebp) 
    movl    -76(%ebp), %eax 
    movl    %eax, -4(%ebp)  
    movl    -4(%ebp), %eax  
    movl    -4(%ebp), %edx  
    orl     %edx, %eax      
    movl    %eax, -88(%ebp) 
    movl    -88(%ebp), %eax 
    movl    %eax, -4(%ebp)  
    movl    -4(%ebp), %eax  
    movl    -4(%ebp), %edx  
    andl    %edx, %eax      
    movl    %eax, -92(%ebp) 
    movl    -92(%ebp), %eax 
    movl    %eax, -4(%ebp)  
    movl    -4(%ebp), %eax  
    xorl    $1, %eax        
    movl    %eax, -96(%ebp) 
    movl    -96(%ebp), %eax 
    movl    %eax, -4(%ebp)  
    movl    $1, %eax        
    cmpl    $1, %eax        
    je      if_0            
    jmp     fi_0            
if_0:
    movl    -4(%ebp), %eax  
    movl    $1, %edx        
    addl    %edx, %eax      
    movl    %eax, -100(%ebp)
    movl    -100(%ebp), %eax
    movl    %eax, -4(%ebp)  
    jmp     fi_0            
fi_0:
    movl    $0, %eax        
    cmpl    $1, %eax        
    je      if_1            
    jmp     else_1          
if_1:
    movl    -4(%ebp), %eax  
    movl    $2, %edx        
    addl    %edx, %eax      
    movl    %eax, -104(%ebp)
    movl    -104(%ebp), %eax
    movl    %eax, -4(%ebp)  
    jmp     fi_1            
else_1:
    movl    -4(%ebp), %eax  
    movl    $2, %edx        
    subl    %edx, %eax      
    movl    %eax, -108(%ebp)
    movl    -108(%ebp), %eax
    movl    %eax, -4(%ebp)  
    jmp     fi_1            
fi_1:
    movl    $1, %eax        
    movl    %eax, -4(%ebp)  
loop_0:
    movl    -4(%ebp), %eax  
    movl    $3, %edx        
    cmpl    %edx, %eax      
    sete    %al             
    andl    $0x000000ff, %eax
    movl    %eax, -112(%ebp)
    movl    -112(%ebp), %eax
    cmpl    $1, %eax        
    je      endLoop_0       
    movl    -4(%ebp), %eax  
    movl    $1, %edx        
    addl    %edx, %eax      
    movl    %eax, -116(%ebp)
    movl    -116(%ebp), %eax
    movl    %eax, -4(%ebp)  
    jmp     loop_0          
endLoop_0:
    movl    %ebp, %ecx      
    call    read            
    movl    %eax, %eax      
    movl    %eax, -4(%ebp)  
    subl    $4, %esp        
    movl    -4(%ebp), %eax  
    movl    %eax, -120(%ebp)
    movl    %ebp, %ecx      
    call    writeint        
    addl    $4, %esp        
    movl    %ebp, %ecx      
    call    writeln         
    leave   
    ret     

