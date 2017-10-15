//draw_set_halign(fa_center); 
//draw_set_valign(fa_middle);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(font_hud);
//draw_set_color(global.btn_color);
draw_set_color(color);
draw_text(40, 40, msg);
if(done)
{
	var last_line_y = 80;
	var fail_count = ds_list_size(failed_test_list);
	var line_count = 0;
	if(!passed)
	{
		if(fail_count == 0) show_error("tests failed but count was 0", true);
		// display failed tests
		for(var n = 0 ; n < fail_count; n++)
		{
			var next_test = ds_list_find_value(failed_test_list, n);
			draw_text(80, 80+32*(1+line_count), next_test);
			line_count++;
			// display assertions
			var assertions = assertion_map[? next_test];
			for(var m = 0; m < ds_list_size(assertions); m++)
			{
				var assert_result = assertions[|m];
				draw_text(100, 80+32*(1+line_count), assert_result);
				line_count++;
			}
		}
		last_line_y = 80+32*(1+line_count);
	}
	// display test summary
	var pass_count = ds_list_size(passed_test_list);
	draw_set_color(c_white);
	draw_text(80, last_line_y, "pass: " + string(pass_count) + "   fail: " + string(fail_count));
}