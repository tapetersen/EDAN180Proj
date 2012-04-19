    .text   
    .global main
main:
    pushl   %ebp            # save dynlink
    movl    %esp, %ebp      # set framepointer
    subl    $4, %esp        # allocate stackspace
    movl    %ecx, -4(%ebp)  # save statlink
    leave   
    ret     

