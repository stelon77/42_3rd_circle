/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lcoiffie <lcoiffie@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/06/14 17:44:35 by lcoiffie          #+#    #+#             */
/*   Updated: 2020/06/21 22:33:51 by lcoiffie         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

void	duptest(char *s1)
{
	char *mine = NULL;
	char *native = NULL;

	mine = ft_strdup(s1);
	native = strdup(s1);
	printf("\nsource = '%s' ; ma fonction = '%s'; fonction native = '%s'\n", s1, mine, native);
	free(mine);
	mine = NULL;
	free(native);
	native = NULL;
}

void	buff_init(char *buff)
{
	int i = -1;

	while (++i < 16)
		buff[i] = '\0';
}

void	write_test(int fd, const void *buf, size_t nbyte)
{
	int	retour;
	errno = 0;

	if ((retour = ft_write(fd, buf, nbyte)) < 0)
	{
		perror("vous avez une erreur");
	}
	printf("\nretour = %d\n", retour);
}

void	read_test(int fd, void *buf, size_t nbyte)
{
	int	retour;
	errno = 0;


	if ((retour = ft_read(fd, buf, nbyte)) < 0)
	{
		perror("vous avez une erreur");
	}
	printf("\nretour = %d\n", retour);
}

int		main(void)
{

	printf("\n\n--------test de strlen---------------\n\n");

	char *s1 = "Ceci est un tres long message, mais ca marche aussi";
	printf("longueur de : -%s-  ma fonction : %zu  la fonction native : %lu \n", "papa", ft_strlen("papa"), strlen("papa"));
	printf("longueur de : -%s-  ma fonction : %zu  la fonction native : %lu \n", "maman", ft_strlen("maman"), strlen("maman"));
	printf("longueur de : -%s-  ma fonction : %zu  la fonction native : %lu \n", "", ft_strlen(""), strlen(""));
	printf("longueur de : -%s-  ma fonction : %zu  la fonction native : %lu \n", "str", ft_strlen("str"), strlen("str"));
	printf("longueur de : -%s-  ma fonction : %zu  la fonction native : %lu \n", s1, ft_strlen(s1), strlen(s1));
	printf("longueur de : -%s-  ma fonction : %zu \nah ben non la fonction native fait un segfault !!\n\n\n ",NULL, ft_strlen(NULL));

	printf("-------test de strcpy--------------\n\n");

	char	buffer1[100] = {0};
	char 	buffer2[100] = {0};

	printf("dest = %s, source = %s\n", buffer1, "maman");
	printf("ma fonction = %s\n", ft_strcpy(buffer1, "maman"));
	printf("la fonction native = %s\n\n", strcpy(buffer2, "maman"));
	printf("dest = %s, source = %s\n", buffer1, "papa");
	printf("ma fonction = %s\n", ft_strcpy(buffer1, "papa"));
	printf("la fonction native = %s\n\n", strcpy(buffer2, "papa"));
	printf("dest = %s, source = %s\n", buffer1, "");
	printf("ma fonction = %s\n", ft_strcpy(buffer1, ""));
	printf("la fonction native = %s\n\n", strcpy(buffer2, ""));
	printf("dest = %s, source = %s\n", buffer1, "papa");
	printf("ma fonction = %s\n", ft_strcpy(buffer1, "papa"));
	printf("la fonction native = %s\n\n", strcpy(buffer2, "papa"));
	printf("dest = %s, source = %s\n", buffer1, NULL);
	printf("ma fonction = %s (protegee)\n\n", ft_strcpy(buffer1, NULL));
	printf("la aussi la fonction native segfault \n - si une des chaines  = NULL\n - si la dest est plus petite que la source\n\n");

	printf("-------test de strcmp--------------\n\n");

	printf("comparaison entre 'dada' et 'dada'\n");
	printf("moi = %d / natif = %d\n", ft_strcmp("dada", "dada"), strcmp("dada", "dada"));
	printf("comparaison entre 'dada' et 'Dada'\n");
	printf("moi = %d / natif = %d\n\n", ft_strcmp("dada", "Dada"), strcmp("dada", "Dada"));
	printf("comparaison entre 'dada' et 'dadada'\n");
	printf("moi = %d / natif = %d\n\n", ft_strcmp("dada", "dadada"), strcmp("dada", "dadada"));
	printf("comparaison entre 'dadada' et 'dada'\n");
	printf("moi = %d / natif = %d\n\n", ft_strcmp("dadada", "dada"), strcmp("dadada", "dada"));
	printf("comparaison entre 'dada' et ''\n");
	printf("moi = %d / natif = %d\n\n", ft_strcmp("dada", ""), strcmp("dada", ""));
	printf("comparaison entre '' et 'dada'\n");
	printf("moi = %d / natif = %d\n\n", ft_strcmp("", "dada"), strcmp("", "dada"));
	printf("comparaison entre '' et ''\n");
	printf("moi = %d / natif = %d\n\n", ft_strcmp("", ""), strcmp("", ""));
	printf("comparaison entre '' et NULL\n");
	printf("moi = %d / natif = segfault\n\n", ft_strcmp("", NULL));
	printf("comparaison entre NULL et ''\n");
	printf("moi = %d / natif = segfault\n\n", ft_strcmp("", NULL));
	printf("comparaison entre NULL et NULL\n");
	printf("moi = %d / natif = segfault\n\n\n", ft_strcmp(NULL, NULL));

	printf("-------test de write--------------\n\n");

	int		fd = 0;
	char*	texte = "et c'est la conclusion\n";

	write_test(1, "lolo", 3);
	write_test(1, "lolo", 4);
	write_test(1, "lolololo", 5);
	write_test(-3, "lolo", 3);
	write_test(1, NULL, 5);
	write_test(1, "Hello World\n", 12);
	write_test(1, "lolo", 0);
	printf("On va ecrire maintenant dans test.txt");
	fd = open("./test.txt", O_WRONLY | O_CREAT | O_TRUNC | O_APPEND, 0666);
	write_test(fd, "Hello World\n", 12);
	write_test(fd, buffer1, 4);
	write_test(fd, "\n", 1);
	write_test(fd, texte, strlen(texte));
	close(fd);

	printf("-------test de read--------------\n\n");

	char	buffer_read1[100] = {0};
	char	buffer_read2[100] = {0};
	char	buffer_read3[16] = {0};

	read_test(0, buffer_read1, 100);
	printf("vous venez de taper : \n %s  dans la console\n", buffer_read1);
	read_test(0, buffer_read2, 100);
	printf("vous venez de taper : \n %s  dans la console\n", buffer_read2);
	printf("Avec mauvais fd\n");
	read_test(-3, buffer_read1, 50);
	printf("\nOn ouvre maintenant notre fichier test.txt\n\n");
	fd = open("./test.txt", O_RDONLY);
	read_test(fd, buffer_read3, 15);
	printf(" les 15 premiers caracteres sont  : %s\n", buffer_read3);
	buff_init(buffer_read3);
	read_test(fd, buffer_read3, 15);
	printf(" les 15 suivant sont : %s\n", buffer_read3);
	buff_init(buffer_read3);
	read_test(fd, buffer_read3, 15);
	printf(" puis : %s\n", buffer_read3);
	close(fd);

	printf("-------test de strdup--------------\n\n");

	duptest("coucou");
	duptest("Voila un message beaucoup plus long");
	duptest("");
	printf("\nsource = %s ; ma fonction = %s; fonction native = segfault\n\n\n", NULL, ft_strdup(NULL));

	printf("----------DONE------------------\n\n");
	return (0);
}
