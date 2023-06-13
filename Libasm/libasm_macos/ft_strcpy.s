			global		_ft_strcpy

			section		.text

_ft_strcpy:	mov			rax, rdi ; *dest in rax
			push		rbp
			push		rdx
			xor			rbp, rbp ;i = 0
			or			rdi,rdi ; !dest
			jz			end
			cmp			rsi, 0 ;!src
			jz			end

loop:		mov			dl, byte [rsi + rbp]
			mov			byte [rax + rbp], dl ; dest[i] = src[i]
			cmp			byte [rsi + rbp], 0 ; rsrc[i] = "\0"
			jz			end
			inc			rbp ; i++
			jmp			loop

end:		pop			rdx
			pop			rbp
			ret

