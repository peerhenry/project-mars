/// @arg class
var class = argument0;
var deps = in(class, get_dependencies);
var mocks = create_mocks(deps);
var instance = noone;
switch(array_length_1d(mocks))
{
	case 0:
		instance = new(class);
		break;
	case 1:
		instance = new(class, mocks[0]);
		break;
	case 2:
		instance = new(class, mocks[0], mocks[1]);
		break;
	case 3:
		instance = new(class, mocks[0], mocks[1], mocks[2]);
		break;
	case 4:
		instance = new(class, mocks[0], mocks[1], mocks[2], mocks[4]);
		break;
}
if(instance == noone) scr_panic("Could not setup testable");
return tuple(instance, mocks);