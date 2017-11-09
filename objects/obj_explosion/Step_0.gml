for (var i = 0; i < ds_list_size(beams); i++)
{
	var beam = beams[| i];
	beam[| BEAM.LENGTH] += beam[| BEAM.SPEED_UP];
	//beam[| BEAM.SPEED_UP] = max(0, beam[| BEAM.SPEED_UP] - beam[| BEAM.ACCEL]);
	if (beam[| BEAM.SPEED_UP] < 0)
	{
		beam[| BEAM.ACCEL] *= 2;
	}
	beam[| BEAM.SPEED_UP] -= beam[| BEAM.ACCEL];
	/*if (beam[| BEAM.SPEED_UP] == 0)
	{
		beam[| BEAM.SPEED_DOWN] += beam[| BEAM.ACCEL] / 2;
		beam[| BEAM.X] += lengthdir_x(beam[| BEAM.SPEED_DOWN], beam[| BEAM.DIR]);
		beam[| BEAM.Y] += lengthdir_y(beam[| BEAM.SPEED_DOWN], beam[| BEAM.DIR]);
		beam[| BEAM.LENGTH] = max(0, beam[| BEAM.LENGTH] - beam[| BEAM.SPEED_DOWN]);*/
		if (beam[| BEAM.LENGTH] < 0)
		{
			ds_list_delete(beams, i);
			i--;
			ds_list_destroy(beam);
		}
	//}
}
if (ds_list_size(beams) == 0)
{
	instance_destroy();
}
