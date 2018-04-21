/// @arg named_dependencies
var dep_labels = argument0;
if(!is_array(dep_labels))
{
	dep_labels = [dep_labels];
}
var dep_array = map_script(dep_labels, class_dependency);
return new(c_dependencies, dep_array);