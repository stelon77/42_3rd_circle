			global 		_ft_read
			extern		___error

			section		.text

_ft_read:	mov 		rax, 0x2000003 ; systemcall read
			syscall
			jc error 	;if error, flag c up
			ret

error:		push		rbp ; stack alignement
			mov			bpl, al ;  errno
			call		___error ; pointer on errno
			mov			byte [rax], bpl
			mov			rax, -1 ; ret = -1
			pop			rbp
			ret
