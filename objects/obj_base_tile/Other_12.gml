/// @description Finalize construction
event_inherited();
var room_logic_basetile = script_container_resolve(script_container, "room_logic_basetile");
script_execute(room_logic_basetile, x, y);