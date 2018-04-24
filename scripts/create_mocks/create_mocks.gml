var class = argument0;
var deps = in(class, get_dependencies);
return call_unwrap(deps, "extract_mocks");