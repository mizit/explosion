if (mouse_check_button_pressed(mb_left))
{
	instance_create_depth(mouse_x, mouse_y, 0, obj_explosion);	
}

trace_point_add(mouse_trace, mouse_x, mouse_y);
if (ds_list_size(mouse_trace) > mouse_trace_size)
{
	trace_point_delete(mouse_trace, 0);
}