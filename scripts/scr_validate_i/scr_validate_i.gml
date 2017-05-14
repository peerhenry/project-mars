var validation_i = argument0;
var map_i = argument1;

if(validation_i == build_validation_i.inside)
{
	return map_i == 1;
}

if(validation_i == build_validation_i.outside)
{
	return map_i == 0;
}

return true; // validation_i == build_validation_i.any