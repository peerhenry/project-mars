/// @description Format date timestamp to string with pattern YYYYMMDDHHMMSS
/// @arg datetime

var arg_datetime = argument0;

var year = string(date_get_year(arg_datetime));
var month = scr_str_pad_left(string(date_get_month(arg_datetime)), "0", 2);
var day = scr_str_pad_left(string(date_get_day(arg_datetime)), "0", 2);
var hour = scr_str_pad_left(string(date_get_hour(arg_datetime)), "0", 2);
var mins = scr_str_pad_left(string(date_get_minute(arg_datetime)), "0", 2);
var secs = scr_str_pad_left(string(date_get_second(arg_datetime)), "0", 2);

return year + month + day + hour + mins + secs;