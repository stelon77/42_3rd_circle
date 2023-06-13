			global 		_ft_write
			extern 		___error

section		.text

_ft_write:	mov 		rax, 0x2000004 	;systemcall write(rdi, rsi, rdx)
			syscall
			jc 			error 	;if error flag c up
			ret

error:		push		rbp ;save rbp
			mov			bpl, al ; errno
			call		___error ; pointer on errno in rax
			mov			byte [rax], bpl ;
			mov			rax, -1 ; ret = -1
			pop			rbp
			ret

