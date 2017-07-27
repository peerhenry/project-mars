event_inherited();
text = "Master";
// Set slider percentage and position
var m_gain = audio_get_master_gain(0);
slider.percentage = round(m_gain*100);
slider.x = left_limit + (right_limit - left_limit)*slider.percentage/100;