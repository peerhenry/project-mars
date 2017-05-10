/// @description Insert description here
// You can write your code in this editor

if(holds_suit && suit_oxygen < 100)
{
	suit_oxygen += global.suit_closet_replenishment;
	if(suit_oxygen > 100) suit_oxygen = 100;
}