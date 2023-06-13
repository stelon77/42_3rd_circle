/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main_bonus.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lcoiffie <lcoiffie@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/06/16 22:51:17 by lcoiffie          #+#    #+#             */
/*   Updated: 2020/06/20 00:01:05 by lcoiffie         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm_bonus.h"

void afficher_liste_str(t_list *begin)
{
	t_list *actuel;

	if (!begin)
	{
		printf("NULL\n");
		return;
	}
	actuel = begin;
	while (actuel)
	{
		printf("%s -> ", actuel->data);
		actuel = actuel->next;
	}
	printf("NULL\n");
}

void free_data(void *str)
{
	if (str)
	{
		free(str);
		str  = NULL;
	}
}

void	test_atoi(char *s1, char *base)
{
	int ret;

	ret = ft_atoi_base(s1, base);
	printf("nombre : %s\nbase : %s\nresult = %d\n\n", s1, base, ret);
}

void	test_chainees(char *str1, char *str2)
{
	printf("\n---------test de list_push_front--------------\n");
	printf("\n---------test de list_size--------------\n");
	printf("\n---------test de list_sort--------------\n");
	printf("\n---------test de list_remove_if--------------\n");


	t_list *list_test;
	char *data1 = "coucou";

	list_test = NULL;
	ft_list_push_front(&list_test, ft_strdup(str1));
	ft_list_push_front(&list_test, ft_strdup(str1));
	ft_list_push_front(&list_test, ft_strdup("ca a l'air de marcher"));
	ft_list_push_front(&list_test, ft_strdup(str2));
	printf("\nliste actuelle :\n");
	afficher_liste_str(list_test);
	printf("la taille de la liste est : %d\n", ft_list_size(list_test));
	ft_list_push_front(&list_test, ft_strdup(str2));
	ft_list_push_front(&list_test, ft_strdup(str1));
	ft_list_push_front(&list_test, ft_strdup(str2));
	printf("\nliste actuelle :\n");
	afficher_liste_str(list_test);
	printf("la taille de la liste est : %d\n", ft_list_size(list_test));
 	ft_list_push_front(&list_test, ft_strdup(data1));
	ft_list_push_front(&list_test, ft_strdup(str2));
	ft_list_push_front(&list_test, ft_strdup(str2));
	printf("\nliste de travail :\n");
	afficher_liste_str(list_test);
	printf("la taille de la liste est : %d\n", ft_list_size(list_test));

	printf("\nla liste triee donne:\n");
	ft_list_sort(&list_test, ft_strcmp);
	afficher_liste_str(list_test);

	printf("\non retire argv[1] (%s)\n", str1);
	ft_list_remove_if(&list_test, str1, ft_strcmp, free_data);
	afficher_liste_str(list_test);
	printf("\non retire 'ca a l'air de marcher'\n");
	ft_list_remove_if(&list_test, "ca a l'air de marcher", ft_strcmp, free_data);
	afficher_liste_str(list_test);
	printf("\non retire argv[2] (%s)\n", str2);
	ft_list_remove_if(&list_test, str2, ft_strcmp, free_data);
	afficher_liste_str(list_test);
	printf("\non retire data1 (%s)\n", data1);
	ft_list_remove_if(&list_test, data1, ft_strcmp, free_data);
	afficher_liste_str(list_test);
	return;
}

void	test_atoi_base(char *str1, char *str2)
{
printf("\n\n---------test atoi_base--------------\n\n");

	test_atoi(str1, str2);
	test_atoi("\t\n\r\v\f ++-+--4387", "0123456789");
	test_atoi("-42", "0123456789");
	test_atoi("0", "0123456789");
	test_atoi("1", "0123456789");
	test_atoi("1215415478", "0123456789");
	test_atoi("-0", "0123456789");
	test_atoi("-1", "0123456789");
	test_atoi("-42", "0123456789");
	test_atoi("--42", "0123456789");
	test_atoi("-+-42", "0123456789");
	test_atoi("-+-+-+42", "0123456789");
	test_atoi("-+-+-+-42", "0123456789");
	test_atoi("-1215415478", "0123456789");
	test_atoi("2147483647", "0123456789");
	test_atoi("2147483648", "0123456789");
	test_atoi("-2147483648", "0123456789");
	test_atoi("-2147483649", "0123456789");
	test_atoi("2a", "0123456789abcdef");
	test_atoi("ff", "0123456789abcdef");
	test_atoi("poney", "poney");
	test_atoi("dommage", "invalid");
	test_atoi("dommage", "aussi invalide");
	test_atoi("dommage", "+toujours");
	test_atoi("dommage", "-stop");
	test_atoi("dommage", "  \t\nenought!");
	test_atoi("    +42", "0123456789");
	test_atoi("    -42", "0123456789");
	test_atoi("    42", "0123456789");
	test_atoi("  \t\n\r\v\f  42", "0123456789");
	test_atoi("  \t\n\r\v\f  -42", "0123456789");
	test_atoi("42FINIS !", "0123456789");
	test_atoi("-42FINIS !", "0123456789");
	test_atoi("C'est dommage42", "0123456789");
	printf("------------c'est fini--------------\n");
}

int	main(int argc, char *argv[])
{
	if (argc != 3)
	{
		printf("Pour le programme de test, mettez 2 arguments\n");
		return (0);
	}
	test_chainees(argv[1], argv[2]);
	test_atoi_base(argv[1], argv[2]);

 	return (0);
}