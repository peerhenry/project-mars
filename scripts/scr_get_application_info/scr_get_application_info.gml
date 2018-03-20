/// @description Get application title, version and build information

var build = " (build: " + scr_date_format(GM_build_date) + ")";
var dev_mode = global.dev_env ? " DEVELOPER MODE" : "";

return game_display_name + " v" + GM_version + build + dev_mode;