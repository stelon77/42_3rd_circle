				global			_ft_atoi_base
				extern			_ft_strlen

				section			.text

_ft_atoi_base:	push			rbp
				push			rdx
				push			rcx
				push			r8
				push			r9
				mov				r8d, 1 ; neg


base_length:	mov				rbp, rdi ;str -> rbp
				mov				rdi, rsi ; base ->rdi
				call			_ft_strlen ; base length
				mov				rdx, rax ; baselength ->rdx
				xor				rax, rax ; ret = 0
				cmp 			rdx, 2 ; base = 0 or 1 chararcter
				jl				end
				xor				rsi, rsi ; i = 0;

;base length = rdx ; base = rdi ; i = rsi ; str = rbp ; rax = ret, et r9 = j ; r8 = neg
forbid_char:	;forbidden character in base
				mov				cl, byte [rdi + rsi]
				cmp				cl, 0 ; base [i] = "\0"
				jz				atoi
				cmp				cl, 9
				jl				redundancy
				cmp				cl, 13
				jle				end ; 9 < base[i] < 13 = whitespace
				cmp				cl, 32 ; space
				jz				end
				cmp				cl, 43 ; signe +
				jz				end
				cmp				cl, 45 ; signe -
				jz				end

redundancy:		; check base redudancy
				mov				r9, rsi ;j = i
				inc				r9 ; j = i + 1

loop_count_2:	cmp				byte [rdi + r9], 0 ; base[j] = \0
				jz				loop_count_1
				cmp				byte [rdi + r9], cl ; base[i] = base[j] -> redundancy
				jz				end
				inc				r9 ; j++
				jmp				loop_count_2

loop_count_1:	inc				rsi ; i++
				jmp				forbid_char

atoi:			xor				rsi, rsi ; i = 0;

whitespace:		; check whitespace in str
				mov				cl, byte [rbp + rsi]
				cmp				cl, 0 ; if str[i] = \0
				jz				end
				cmp				cl, 32 ; if space
				jz				w_space_loop
				cmp				cl, 9 ;non whitespace
				jl				sign
				cmp				cl, 13 ; non whitespace
				jg				sign

w_space_loop:	inc				rsi ; i++
				jmp				whitespace

sign:			; check sign
				mov				cl, byte [rbp + rsi]
				cmp				cl, 0 ; if str[i] = \0
				jz				end
				cmp				cl, 43 ; if +
				jz				inc_sign_loop
				cmp				cl, 45	; if -
				jnz				atoi_base

change_sign:	neg				r8d ; inverse 'neg'

inc_sign_loop:	inc				rsi ; i++
				jmp				sign

atoi_base:		xor 			r9, r9 ; j = 0
				mov				cl, byte [rbp + rsi]
				cmp				cl, 0 ; str[i] = \0
				jz				end
compare:		cmp				cl, byte [rdi + r9] ;cmp str[i] base=[j]
				jz				make_int
				inc				r9 ; j++
				cmp				byte [rdi + r9], 0 ; base[j] = \0
				jz				end ;str[i] is not in base -> end
				jmp				compare

make_int:		imul			eax, edx ; ret = ret * base length
				add				eax, r9d ; ret = ret + j
				inc				rsi ; i++
				jmp				atoi_base

end:			imul			eax, r8d ; ret = ret * neg
				mov				rsi, rdi ; rsi = base
				mov				rdi, rbp ; rdi = str
				pop				r9
				pop				r8
				pop				rcx
				pop				rdx
				pop				rbp
				ret