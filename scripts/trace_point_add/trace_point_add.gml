/// @description add point to trace
/// @param trace_id
/// @param x
/// @param y

enum TRACE_STEP
{
	X = 0,
	Y = 1,
	LENGTH = 2,
	DIR = 3
}

var l_step = ds_list_create();
l_step[| TRACE_STEP.X] = argument1;
l_step[| TRACE_STEP.Y] = argument2;
if (ds_list_size(argument0) == 0)
{
	l_step[| TRACE_STEP.LENGTH] = 0;
	l_step[| TRACE_STEP.DIR] = 0;
}
else
{
	var l_prev_step = argument0[| ds_list_size(argument0) - 1];
	l_step[| TRACE_STEP.LENGTH] = point_distance(l_prev_step[| TRACE_STEP.X], 
	l_prev_step[| TRACE_STEP.Y], l_step[| TRACE_STEP.X], l_step[| TRACE_STEP.Y]);
	l_step[| TRACE_STEP.DIR] = point_direction(l_step[| TRACE_STEP.X], l_step[| TRACE_STEP.Y],
	l_prev_step[| TRACE_STEP.X], l_prev_step[| TRACE_STEP.Y]);
}

ds_list_add(argument0, l_step);