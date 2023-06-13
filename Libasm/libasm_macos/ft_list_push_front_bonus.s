			global		_ft_list_push_front
			extern		_malloc
			extern		___error

			section		.text
;size of t_list = 16, size of *void  = 8 , size of *next = 8

_ft_list_push_front:  ; rdi = **beginlist ; rsi= *data ;
			push		rbx ; stack alignement
			push		rsi
			push		rdi
			mov			rdi, 16 ; = sizeof t_list
			call		_malloc ; rax = new
			pop			rdi
			pop			rsi
			or			rax, rax ;ret malloc = 0
			jz			error
			push		rdx
			xor			rdx, rdx
			mov			[rax + 8], rdx ; new->next =  NULL
			mov			[rax], rsi; new->data = data
			mov			rdx, [rdi] ; *beginlist
			mov			[rax + 8], rdx ; new->next = *beginlist
			mov			[rdi], rax ; *beginlist = new
			pop			rdx

end:		pop			rbx
			ret

error:		call		___error ; pointeur sur errno
			mov			byte[rax], 12 ; ENOMEM
			xor			rax, rax ; retour  = NULL
			jmp			end

