function scr_any_task_actors_selected() {
	with(obj_task_actor)
	{
		if(is_selected) return true;
	}
	return false;


}
