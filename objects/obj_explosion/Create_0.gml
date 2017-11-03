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
beams_num = 200;
for (var i = 0; i < beams_num; i++)
{
	var l_speed = random(20);
	ds_list_add(beams, beam_create(x, y, l_speed, 
	random_range(360 * i / beams_num, 360 * (i + 1) / beams_num), l_speed / (room_speed)));
}