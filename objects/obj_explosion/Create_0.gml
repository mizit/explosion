enum BEAM
{
	X = 0,
	Y = 1,
	LENGTH = 2,
	DIR = 3,
	SPEED_UP = 4,
	SPEED_DOWN = 5,
	ACCEL = 6
}

beams = ds_list_create();
beams_num = 20;
for (var i = 0; i < beams_num; i++)
{
	var l_speed = random(20);
	ds_list_add(beams, beam_create(x, y, l_speed, 
	random_range(360 * i / beams_num, 360 * (i + 1) / beams_num), l_speed / (room_speed / 6)));
}

traces = ds_list_create();




/*ps = part_system_create();

pt = part_type_create();
part_type_color1(pt, c_orange);
part_type_shape(pt, pt_shape_pixel);
part_type_gravity(pt, 3, 270);
part_type_speed(pt, 20, 40, -2, 0);
part_type_direction(pt, 0, 360, 0, 0);
part_type_life(pt, room_speed / 6, room_speed / 3);
part_type_size(pt, 1, 1, 0, 0);
part_type_alpha2(pt, 1, 0);

em = part_emitter_create(ps);
part_emitter_region(ps, em, x, x, y, y, ps_shape_ellipse, ps_distr_gaussian);
part_emitter_burst(ps, em, pt, 50);*/