/// @description checks if an adjacent spot is in room
function scr_gate_touches_room(argument0, argument1) {
	var le_room = argument0;
	var gate = argument1;

	return scr_room_contains(le_room, gate.x + 32, gate.y)
	|| scr_room_contains(le_room, gate.x - 32, gate.y)
	|| scr_room_contains(le_room, gate.x, gate.y + 32)
	|| scr_room_contains(le_room, gate.x, gate.y - 32);


}
