				global			_ft_strcmp

				section			.text

_ft_strcmp:		push			rdx
				push			rcx
				xor				rax, rax ; cmp = 0
				or				rdi, rdi ; if !s1
				jz				end
				or				rsi, rsi ; if !s2
				jz				end
				xor				rdx, rdx ; i = 0

loop:			mov				cl, byte [rsi + rdx]
				cmp				byte [rdi + rdx], cl ; compare s2[i] et s1[i]
				jl				lower ; if s2 < s1
				jg				greater ; if s2 > s1
				or				cl, cl ; s1[i] = '\0'
				jz				end
				inc				rdx ; i++
				jmp				loop

lower:			mov				rax, -1 ; cmp = -1
				jmp				end

greater:		mov				rax, 1 ;cmp = 1

end:			pop				rcx
				pop				rdx
				ret