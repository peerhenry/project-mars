var origin_x = argument0;
var origin_y = argument1;
var arg_x = argument2;
var arg_y = argument3;
var arg_build = argument4;
var arg_rotation = argument5;

var origin_i = scr_rc_to_gi(origin_x);
var origin_j = scr_rc_to_gi(origin_y);
var arg_i = scr_rc_to_gi(arg_x);
var arg_j = scr_rc_to_gi(arg_y);

var diff_i = arg_i - origin_i;
var diff_j = arg_j - origin_j;
var abs_diff_i = abs(diff_i);
var abs_diff_j = abs(diff_j);

var diff_is_significant = abs_diff_i  > 0 || abs_diff_j > 0;

if(diff_is_significant)
{
	if(arg_build == global.basetile)
	{
		for(var ni = min(0, diff_i); ni <= max(0, diff_i); ni++)
		{
			for(var nj = min(0, diff_j); nj <= max(0, diff_j); nj++)
			{
				var b_x = scr_gi_to_rc(origin_i + ni);
				var b_y = scr_gi_to_rc(origin_j + nj);
				scr_build(b_x, b_y, arg_build, arg_rotation);
			}
		}
	}
	else if(arg_build == global.wall)
	{
		if(abs_diff_i > abs_diff_j)
		{
			// horizontal wall
			var i_left = origin_i + min(0, diff_i);
			var i_right = origin_i + max(diff_i, 0);
			for(var n = i_left; n <= i_right; n++)
			{
				var b_x = scr_gi_to_rc(n);
				scr_build(b_x, arg_y, arg_build, arg_rotation);
			}
		}
		else
		{
			// vertical wall
			var j_top = origin_j + min(0, diff_j);
			var j_bottom = origin_j + max(diff_j, 0);
			for(var n = j_top; n <= j_bottom; n++)
			{
				var b_y = scr_gi_to_rc(n);
				scr_build(arg_x, b_y, arg_build, arg_rotation);
			}
		}
	}
}
else scr_build(arg_x, arg_y, arg_build, arg_rotation);