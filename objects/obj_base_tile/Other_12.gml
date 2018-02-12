/// @description Finalize construction
event_inherited();
var room_logic_basetile = resolve(script_container, "room_logic_basetile");
script_execute(room_logic_basetile, x, y);
// remove rubble

var rubble = instance_position(x, y, obj_rubble);
instance_destroy(rubble);