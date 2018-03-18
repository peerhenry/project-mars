event_inherited();

enum menu_tutorial_index{
	basics,
	energy,
	water,
	oxygen,
	back
}

// highest index first
menu[menu_tutorial_index.back] = "Back";

menu[menu_tutorial_index.basics] = "Part 1 - Basics";
menu[menu_tutorial_index.energy] = "Part 2 - Energy";
menu[menu_tutorial_index.water] = "Part 3 - Water";
menu[menu_tutorial_index.oxygen] = "Part 4 - Oxygen";


// highest index first
colors[menu_tutorial_index.back] = c_white;
colors[menu_tutorial_index.basics] = c_white;
colors[menu_tutorial_index.energy] = c_white;
colors[menu_tutorial_index.water] = c_white;
colors[menu_tutorial_index.oxygen] = c_white;