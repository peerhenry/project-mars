/// @description Finds an mdu pile to assign and begins action.
/// @param astronaut
/// @param construction
function scr_fetch_mdu(argument0, argument1) {
	var arg_astronaut = argument0;
	var arg_construction = argument1;

	// put all mdu piles inside an array
	var count = instance_number(obj_mdu_pile);
	var array;
	var counter = 1;
	with(obj_mdu_pile)
	{
		array[count - counter] = id;
		counter++;
	}
	var xx = arg_astronaut.x;
	var yy = arg_astronaut.y;

	// sort the array by distance from astronaut (BUBBLED LOOP)
	for(var i=0;i<count;i++)
	{
	     for(var j=0;j<count-1;j++)
	     {
	          if point_distance(xx,yy,array[j].x,array[j].y) > point_distance(xx,yy,array[j+1].x,array[j+1].y)
	          {
	               var aux=array[j+1]
	               array[j+1]=array[j] //'pushing' higher value to the 'right' of the array
	               array[j]=aux //'pushing' lower value to the 'left' of the array
	          }
	     }
	}

	// loop
	for(var i=0;i<count;i++)
	{
		var next_pile = array[i];
		var assigned = scr_try_to_assign(next_pile, arg_astronaut)
		if(assigned)
		{
			scr_update_astro_and_construction(arg_astronaut, arg_construction, astronaut_action.fetching_mdu);
			return true;
		}
	}
	return false;


}
