event_inherited();

enum menu_tutorial_index
{
	basics,
	energy,
	water,
	oxygen,
	back
}

list_items = [
	["Part 1 - Basics", menu_tutorial_index.basics],
	["Part 2 - Energy", menu_tutorial_index.energy],
	["Part 3 - Water", menu_tutorial_index.water],
	["Part 4 - Oxygen", menu_tutorial_index.oxygen],
	["Back", menu_tutorial_index.back]
];

event_user(2); //initialize list buttons