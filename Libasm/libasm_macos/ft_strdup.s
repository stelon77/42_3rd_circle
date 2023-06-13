				global		_ft_strdup
				extern		_malloc
				extern		___error
				extern		_ft_strlen
				extern		_ft_strcpy

				section		.text

_ft_strdup:		push		rbx ; stack alignement
				xor			rax, rax
				or			rdi, rdi
				jz			end_null ;s1 = null


length:			call		_ft_strlen
				inc			rax ;strlen + 1


memory_alloc:	mov			rbx, rdi
				mov			rdi, rax
				call		_malloc ; malloc dest
				or			rax, rax
				jz			error ; malloc error if flag zero

duplicate:		mov			rsi, rbx ;s1
				mov			rdi, rax ;dest
				call		_ft_strcpy

end:			mov			rdi, rbx ; s1 in rdi (const char*)
end_null:		pop			rbx
				ret

error:			call		___error ; pointer on errno
				mov			byte[rax], 12 ; ENOMEM
				xor			rax, rax ; ret = null
				jmp			end
