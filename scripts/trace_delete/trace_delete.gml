/// @description deleting whole trace
/// @param trace_id

while (ds_list_size(argument0) > 0)
{
	ds_list_destroy(argument0[| 0]);
	ds_list_delete(argument0, 0);
}
ds_list_destroy(argument0);