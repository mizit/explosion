/// @description trying to draw trace
/// @param trace_id
/// @param width base of triangle
/// @param color

var l_trace = argument0;
var l_width = argument1;
var l_color = argument2;
/*draw_set_color(l_color);
for (var i = 0; i < ds_list_size(l_trace); i++)
{
	var l_step = l_trace[| i];
	draw_line_angle(l_step[| TRACE_STEP.X], l_step[| TRACE_STEP.Y],
	l_step[| TRACE_STEP.LENGTH], l_step[| TRACE_STEP.DIR]);
}*/

if (ds_list_size(l_trace) < 2)
{
	return 0;
}
var l_length = 0;
var l_num = ds_list_size(l_trace);
var l_old_x1 = noone, l_old_y1 = noone;
var l_old_x2 = noone, l_old_y2 = noone;
for (var i = 0; i < l_num - 1; i++)
{
	l_length += ds_list_find_index(l_trace[| i], TRACE_STEP.LENGTH);
}
var l_step_zero = l_trace[| 0];
var l_step = l_trace[| 1]
l_old_x1 = l_step_zero[| TRACE_STEP.X] + lengthdir_x(l_width / 2, 270 - l_step[| TRACE_STEP.DIR]);
l_old_y1 = l_step_zero[| TRACE_STEP.Y] + lengthdir_y(l_width / 2, 270 - l_step[| TRACE_STEP.DIR]);
l_old_x2 = l_step_zero[| TRACE_STEP.X] + lengthdir_x(l_width / 2, 450 - l_step[| TRACE_STEP.DIR]);
l_old_y2 = l_step_zero[| TRACE_STEP.Y] + lengthdir_y(l_width / 2, 450 - l_step[| TRACE_STEP.DIR]);
var l_cur_length = l_step[| TRACE_STEP.LENGTH];
var l_old_color = draw_get_color();
draw_set_color(l_color);
for (var i = 1; i < l_num - 1; i++)
{
	l_step = l_trace[| i];
	var l_x1, l_x2, l_y1, l_y2;
	var l_cur_width = l_width// * (1 - l_cur_length / l_length);
	l_x1 = l_step[| TRACE_STEP.X] + lengthdir_x(l_width / 2, l_step[| TRACE_STEP.DIR] - 90);
	l_y1 = l_step[| TRACE_STEP.Y] + lengthdir_y(l_width / 2, l_step[| TRACE_STEP.DIR] - 90);
	l_x2 = l_step[| TRACE_STEP.X] + lengthdir_x(l_width / 2, l_step[| TRACE_STEP.DIR] + 90);
	l_y2 = l_step[| TRACE_STEP.Y] + lengthdir_y(l_width / 2, l_step[| TRACE_STEP.DIR] + 90);
	draw_primitive_begin(pr_trianglestrip);
	draw_vertex(l_old_x2, l_old_y2);
	draw_vertex(l_x2, l_y2);
	draw_vertex(l_old_x1, l_old_y1);
	draw_vertex(l_x1, l_y1);
	draw_primitive_end();
	l_cur_length += l_step[| TRACE_STEP.LENGTH];
	l_old_x1 = l_x1;
	l_old_y1 = l_y1;
	l_old_x2 = l_x2;
	l_old_y2 = l_y2;
}
draw_set_color(l_old_color);