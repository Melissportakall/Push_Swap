/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   push_swap.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mportaka <mportaka@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/03/22 12:12:07 by mportaka          #+#    #+#             */
/*   Updated: 2024/03/22 12:44:03 by mportaka         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "push_swap.h"
#include <stdlib.h>
#include <unistd.h>

void	ft_push_swap(char **av)
{
	t_stack	stack;
	int		size;
	int		i;

	i = -1;
	size = ft_strlen_p(av);
	stack.a = malloc(sizeof(int) * size);
	if (!stack.a)
		return ;
	stack.size_a = size;
	stack.b = malloc(sizeof(int) * size);
	if (!stack.b)
	{
		free (stack.a);
		return ;
	}
	stack.size_b = 0;
	while (++i < size)
		stack.a[i] = ft_atoi_p(av[i], stack.a);
	ft_check_repeat(stack.a, size);
	ft_sort(&stack, size);
	free (stack.a);
	free (stack.b);
}

int	main(int ac, char **av)
{
	char	**data;

	data = NULL;
	if (av_control(av))
	{
		write(1, "Error\n", 6);
		return (0);
	}
	if (ac > 1)
	{
		av++;
		if (ac == 2)
		{
			data = ft_split(*av, ' ');
			ft_push_swap(data);
		}
		else
			ft_push_swap(av);
	}
	if (data)
		free_(data);
	return (0);
}
