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
dust_beams = ds_list_create();
dust_colors = ds_list_create();
beams_num = 20;
for (var i = 0; i < beams_num; i++)
{
	var l_speed = random(20);
	var l_dir  = random_range(360 * i / beams_num, 360 * (i + 1) / beams_num);
	l_dir = random(360);
	ds_list_add(beams, beam_create(x, y, l_speed, l_dir, l_speed / (room_speed / 6)));
	ds_list_add(dust_beams, beam_create(x, y, l_speed * 2, l_dir, l_speed / (room_speed / 12)));
	var gray = 40 + i * 7;
	ds_list_add(dust_colors, make_color_rgb(gray, gray, gray));
}

/*repeat (beams_num)
{
	var tmp_part = instance_create_depth(x, y, depth, obj_exp_part);
	tmp_part.direction = random(360);
	tmp_part.speed = 3 + random(6);
}
*/

dust_ps = part_system_create();
dust_pt = part_type_create();
dust_em = part_emitter_create(dust_ps);
dust_base = 30;
part_type_alpha2(dust_pt, 1, 0);
part_type_shape(dust_pt, pt_shape_smoke);
part_type_color1(dust_pt, c_gray);
part_type_size(dust_pt, 0.1, 0.2, 0.0, 0);


//traces = ds_list_create();

