			global	_ft_strlen

			section	.text

_ft_strlen: xor		rax, rax ; i = 0
			cmp		rdi, 0 ; !str
			jz		end

count:		cmp 	byte [rdi + rax], 0 ;str[i] = 0
			jz		end
			inc		rax ; i++
			jmp		count

end:		ret ; return i
