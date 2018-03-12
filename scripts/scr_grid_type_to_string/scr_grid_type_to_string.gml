/// @arg grid_type
var grid_type_string = "";
switch(argument0)
{
	case macro_grid_electric:
		grid_type_string = "Electric grid";
		break;
	case macro_grid_water:
		grid_type_string = "Water grid";
		break;
	case macro_grid_oxygen:
		grid_type_string = "Oxygen grid";
		break;
	case macro_grid_hydrogen:
		grid_type_string = "Hydrogen grid";
		break;
}
return grid_type_string;