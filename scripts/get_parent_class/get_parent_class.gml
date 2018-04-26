/// @arg class
var class = argument0;
var result = in(class, get_parent); // WARNING: using call_static would cause an infinite loop
if(result.refused_request)
{
	destroy(result);
	return c_object;
}
return unwrap(result);