// the delta is the change to an alternative grid cell for navigation.
var n = argument0;

i = 0;
a = 1;
b = 2;
c = 3;
d = 4;

if(n < 4) return n;

var M = floor( (1 + sqrt(1 + 8*n)) / 4 );
var R = M*(2*M - 1);
var p = n - R;
var q = p div M;

switch(q)
{
	case 0:
		return a;
	case 1:
		return b;
	case 2:
		return c;
	case 3:
		{
			if(q == 3*M) return i;
			return d;
		}
	default:
		return d;
}