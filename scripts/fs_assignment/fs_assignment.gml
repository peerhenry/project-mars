var function = argument[0];
var args = argument[1];
var here = f_assignment;

switch(function)
{
	case "get_closest_astro":
		return astro;
	
	case "assign":
		break;
	
	case "command_assign":
		var interactable = args[0];
		
		// if interactable can take just one assignment, do it with closest selected astro, rest just moves there
		// if multi assignment (mdu pile) sort astros by distance, try to assign each of them, just move otherwise
		
		/*
		var sorted_astros = call(here, "sort_object_by_distance_from")
		if( interactable.can_multi_assign )
		{
			with(obj_task_actor)
			{
				if(is_selected)
				{}
			}
		}
		
		*/
		
		break;
	
	case test:
		break;
}