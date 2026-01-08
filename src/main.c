/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ldepenne <ldepenne@student.42angouleme.    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2026/01/03 11:08:46 by ldepenne          #+#    #+#             */
/*   Updated: 2026/01/08 11:18:32 by ldepenne         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../include/so_long.h"

int	main(void)
{
	mlx_t		*mlx;
	// mlx_image_t	*img;

	mlx_set_setting(MLX_MAXIMIZED, true);
	mlx = mlx_init(WIDTH, HEIGHT, "Yes Window", true);
	if (!mlx)
		ft_printf("nop\n");
		// ft_error();
	// img = mlx_new_image(mlx, 256, 256);
	// if (!img || (mlx_image_to_window(mlx, img, 0, 0) < 0))
		// ft_error();
	// mlx_put_pixel(img, 0, 0, 0xFF0000FF);
	// mlx_loop_hook(mlx, ft_hook, mlx);
	mlx_loop(mlx);
	mlx_terminate(mlx);
	return (EXIT_SUCCESS);
}