/// @description Remove door from room1 and room2
event_inherited();

var door_destroy_logic = resolve_script(script_container, "door_destroy_logic");
script_execute(door_destroy_logic, id);