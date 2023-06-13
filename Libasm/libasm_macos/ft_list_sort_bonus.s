			global		_ft_list_sort

			section		.text

_ft_list_sort: ;rdi = **begin_list, rsi = *cmp
init:		push		rbp
			push		r12
			push		r13
			xor			rax, rax ; rax = 0
			cmp			rax, rdi ; if begin_list = null
			jz			end
			cmp 		rax, [rdi] ; if *begin_list = null
			jz			end
			cmp			rax, [rdi + 8]; if *begin_list->next = null
			jz			end
			mov			r12, [rdi] ; list1(r12) = *begin_list

loop1:		xor			rbp, rbp ; rbp = 0
			cmp			[r12 + 8], rbp ; while list1->next
			jz			end
			mov			r13, [r12 + 8] ; list2(r13) = list1->next

loop2:		xor			rbp, rbp ; rbp = 0
			cmp			r13, rbp ; while list2
			jz			incr_list1
			push		rdi
			push		rbx
			mov			rbx, rsi ; protect (*cmp)
			mov			rdi, [r12] ;list1->content to rdi
			mov			rsi, [r13] ;list2->content to rsi
			call		rbx ; *cmp
			cmp			eax, 0
			jg			swap

swap_ret:	mov			rsi, rbx ; restore (*cmp)
			pop			rbx
			pop			rdi
			mov			r13, [r13 + 8] ;list2 = list2->next
			jmp			loop2

incr_list1:	mov			r12, [r12 + 8] ;list 1 = list1->next
			jmp			loop1

swap:		mov			rsi, [r13] ;list2->content to rsi
			mov			rdi, [r12] ;list1->content to rdi
			mov 		[r12], rsi ;rsi to list1->content
			mov			[r13], rdi ;rdi to list2->content
			jmp			swap_ret

end:
			pop			r13
			pop			r12
			pop 		rbp
			ret