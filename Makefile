CC = cc
CFLAGS = $(ALL_INCLUDES) -Wall -Wextra -Werror -MMD -MP
MAKEFLAGS += --no-print-directory
HEADER = so_long.h
NAME = so_long

BUILD_DIR = obj/
SRC_DIR = src/
INCLUDE = include/
ALL_INCLUDES = -I$(INCLUDE) -I$(INCLUDE_LIBFT) -I$(INCLUDE_FT_PRINTF) -I$(MLX_DIR)/include

#LIBFT
INCLUDE_LIBFT = include/libft/
LIBFT = include/libft/libft.a

#FT_PRINTF
INCLUDE_FT_PRINTF = include/ft_printf/
FT_PRINTF = include/ft_printf/libftprintf.a

#MLX42
MLX_DIR = MLX42
MLX_REPO = https://github.com/codam-coding-college/MLX42.git
MLX = $(MLX_DIR)/build/libmlx42.a
LIBS = -ldl -lglfw -pthread -lm

SRC=main.c

OBJ = $(SRC:%.c=$(BUILD_DIR)%.o)
DEPS = $(SRC:%.c=$(BUILD_DIR)%.d)
OBJ_DIR = $(sort $(shell dirname $(OBJ)))

all: $(NAME)

$(NAME): $(OBJ) $(LIBFT) $(FT_PRINTF) $(MLX)
	@$(CC) $(CFLAGS) $(LIBFT) $(FT_PRINTF) $(MLX) $(LIBS) $^ -o $@
	@echo "push_swap link"

$(LIBFT):
	@make -C include/libft

$(FT_PRINTF):
	@make -C include/ft_printf

$(MLX): $(MLX_DIR)
	@cmake $(MLX_DIR) -B $(MLX_DIR)/build && make -C $(MLX_DIR)/build -j4

$(MLX_DIR):
	@git clone $(MLX_REPO) $(MLX_DIR)

$(BUILD_DIR)%.o: $(SRC_DIR)%.c | $(OBJ_DIR)
	@$(CC) $(CFLAGS) -c $< -o $@ -I$(HEADER)

$(OBJ_DIR):
	@mkdir -p $@

clean:
	@make -C include/libft/ clean
	@make -C include/ft_printf/ clean
	rm -rf $(BUILD_DIR)

fclean: clean
	rm -rf $(NAME)
	@rm -f $(LIBFT)
	@rm -f $(FT_PRINTF)
	@rm -rf $(MLX_DIR)/build

re: fclean all

.PHONY: all clean fclean re

-include $(DEPS)