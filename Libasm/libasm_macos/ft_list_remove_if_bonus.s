			global		_ft_list_remove_if
			extern		_free

			section		.text

_ft_list_remove_if: ;rdi = **begin_list , rsi = *data_ref , rdx = *cmp, rcx = *free_fct
			push		rbp
			push		rbx
			push		r12
			push		r13
			push		r14
			push		r15
			mov			rbx, rdx ; *cmp
			mov			r12, rcx ; free_fct
			mov			r15, rsi ; data_ref

			xor			rax, rax ; rax = zero
			cmp 		rdi, rax ;if **begin = null
			jz			end
			cmp			[rdi], rax ;if *begin = null
			jz			end

begin_loop:	mov			rbp, [rdi] ; temp = *begin_list
			or	 		rbp, rbp ; if *begin = 0
			jz			end
			push		rdi ; protect **begin
			mov			rdi, [rbp] ; begin->data
			mov			rsi, r15 ;dataref
			call		rbx ; cmp data et dataref
			pop			rdi
			or			rax, rax ; if cmp = 0
			jz			free_elt1
			mov			rbp, [rdi] ;new = *begin_list

loop:		or			rbp, rbp ; if new =0
			jz			end

loop2:		mov			r13, [rbp + 8] ;temp = new->next
			or			r13, r13 ;if temp = 0
			jz			end
			push		rdi ;protect **begin
			mov			rdi, [r13] ;temp->data
			mov			rsi, r15
			call		rbx ; cmp data et dataref
			pop			rdi
			or			rax, rax ; cmp = 0
			jz			free_elt2
inc_new:	mov			rbp, [rbp + 8] ;new = new->next
			jmp			loop

free_elt1:	mov			r13, rbp ; temp = *begin
			mov			rbp, [rbp + 8]; begin = temp->next
			push		rdi ; protect **begin
			or 			r12, r12 ; if freefct != NULL
			jz			free_tmp1
			mov			rdi, [r13] ; temp->data
			call		r12 ; free_fct

free_tmp1:	mov			rdi, r13 ;free temp
			call		_free
			pop			rdi ; **begin
			mov			[rdi], rbp ; *begin = temp->next
			jmp			begin_loop

free_elt2:	; temp = new->next made in loop2
			mov			rax, [r13 + 8]
			mov			[rbp + 8], rax ; new->next = temp->next
			push		rdi ; protect **begin
			or			r12, r12 ;if freefct != NULL
			jz			free_tmp2
			mov			rdi, [r13]
			call		r12 ; free_fct data

free_tmp2:	mov			rdi, r13
			call 		_free ; free(temp)
			pop			rdi ; restore **begin
			jmp			loop2

end:		mov			rsi, r15
			mov			rcx, r12
			mov			rdx, rbx
			pop			r15
			pop			r14
			pop			r13
			pop 		r12
			pop			rbx
			pop			rbp
			ret
