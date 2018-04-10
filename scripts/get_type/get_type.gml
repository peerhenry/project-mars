var inst = argument0;
var is_map = ds_exists(inst, ds_type_map);
if(is_map) return inst[? "script"];
return script_get_name(inst.script);