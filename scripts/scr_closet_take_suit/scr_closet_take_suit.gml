var arg_closet = argument0;
var arg_astronaut = argument1;

if(!arg_astronaut.wears_suit && arg_closet.holds_suit){
	arg_astronaut.wears_suit = true;
	arg_closet.holds_suit = false;
	arg_closet.image_index += 4;
	arg_astronaut.suit_oxygen = arg_closet.suit_oxygen;
}