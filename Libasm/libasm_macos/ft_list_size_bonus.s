			global			_ft_list_size

			section			.text

_ft_list_size: ;rdi *begin_list
			push			rsi
			xor				rax, rax ; i = 0
			cmp				rdi, 0 ; *beginlist = NULL
			jz				end
			inc				rax ; i = 1

count:		mov				rsi, 0
			cmp				[rdi +8], rsi ; if beginlist->next = NULL
			jz				end
			inc				rax ; i++
			mov				rdi, [rdi + 8] ;beginlist = beginlist->next
			jmp				count;

end:		pop				rsi
			ret				; return(i)
