# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mportaka <mportaka@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/22 12:11:20 by mportaka          #+#    #+#              #
#    Updated: 2024/03/22 12:37:10 by mportaka         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = push_swap

BONUS_NAME = checker

CC = gcc -g

CFLAGS = -Wall -Wextra -Werror

CFILES_1 = push_swap.c

CFILES_2 = function.c \
			function2.c \
			function3.c \
			rules_a.c \
			rules_b.c \
			utils.c \
			utils2.c

BONUS_FILES = checker.c get_next_line.c

OBJS_1 = $(CFILES_1:.c=.o)

OBJS_2 = $(CFILES_2:.c=.o)

BONUS_OBJS = $(BONUS_FILES:.c=.o)


$(NAME): $(OBJS_1) $(OBJS_2)
	@$(CC) $(CFLAGS) $(OBJS_1) $(OBJS_2) $(LIBFTM) -o $(NAME)
	@echo "\nPush_swap is ready"

$(BONUS_NAME): $(BONUS_OBJS) $(OBJS_2) 
	@$(CC) $(CFLAGS) $(BONUS_OBJS) $(OBJS_2) $(LIBFTM) -o $(BONUS_NAME)
	@echo "\nChecker is ready"

all: $(NAME) $(BONUS_NAME)
	@echo "\nAll files compiled successfully"

bonus: ${BONUS_NAME} 
	@echo "\nBonus files compiled successfully"	

clean:
		@rm -f $(OBJS_1) $(OBJS_2) $(BONUS_OBJS)
		@echo "\nObjects files deleted"

fclean: clean
		@rm -rf $(NAME) $(BONUS_NAME)
		@echo "\nArchive file deleted"

re: fclean all