if(holds_suit && suit_oxygen < 100)
{
	suit_oxygen += suit_closet_replenishment;
	if(suit_oxygen > 100) suit_oxygen = 100;
}
event_inherited();