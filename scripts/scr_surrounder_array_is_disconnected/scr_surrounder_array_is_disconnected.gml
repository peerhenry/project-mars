/// @param array
var arg_array = argument0;
var flips = 0;
for(var n = 0; n < 8; n++)	// E NE N NW W SW S SE
{
	var instance1 = arg_array[n];
	var instance2 = arg_array[(n + 1) % 8];
	// If only one existing instance is found in two adjacent tiles, count it as a flip
	if( (instance1 == noone && instance2 != noone) || (instance1 != noone && instance2 == noone))
	{
		flips++;
	}
}

// There must be at least 3 flips in order for the surrounding instances to be disconnected
return flips > 2;