SRCS		= 	ft_write.s \
				ft_strlen.s \
				ft_strcpy.s \
				ft_strcmp.s \
				ft_read.s \
				ft_strdup.s

SRCS_B		=	ft_atoi_base_bonus.s \
				ft_list_push_front_bonus.s \
				ft_list_size_bonus.s \
				ft_list_sort_bonus.s \
				ft_list_remove_if_bonus.s

OBJS		= ${SRCS:.s=.o}

OBJS_B		= ${SRCS_B:.s=.o}

RM			= rm -f

ASM			= nasm

ASMFLAGS	= -fmacho64 -lc

NAME		= libasm.a

.s.o:
			${ASM} ${ASMFLAGS}  -o $@ $<

${NAME}:	${OBJS}
			ar -crs ${NAME} ${OBJS}

all:		${NAME}

bonus:		${OBJS_B} ${OBJS}
			ar -crs ${NAME}	${OBJS}	${OBJS_B}

clean:
			${RM} ${OBJS} ${OBJS_B}

fclean:		clean
			${RM} ${NAME}

re:			fclean all

test:		${NAME}
			gcc -Wall -Wextra -Werror -L. -lasm main.c

test_bonus: bonus
			gcc -Wall -Wextra -Werror -L. -lasm main_bonus.c

.PHONY:		all clean fclean re bonus test test_bonus
