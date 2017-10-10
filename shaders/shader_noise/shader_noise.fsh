varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec4 noise_uv_wh;
uniform sampler2D noiseTexture;
uniform vec4 uvs_noise;
uniform vec4 uvs_tex;
uniform float dark_band_thickness;
uniform float dark_band_pos;
uniform int obj_j;

vec3 rgb2hsv(vec3 c)
{
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

vec3 hsv2rgb(vec3 c)
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

void main()
{
	vec2 rel_uv = (v_vTexcoord - uvs_tex.xy);
	
	float band_domain = uvs_noise.w*4.0;
	float offset = mod(float(obj_j), 4.0)*uvs_noise.w;
	float band_y = mod(offset + rel_uv.y, band_domain);
	
	rel_uv.y = mod(rel_uv.y, uvs_noise.w);
	vec2 noise_uv = uvs_noise.xy + rel_uv;
	float noiseValue = texture2D(noiseTexture, noise_uv).x;
	
	float band_bottom = mod(dark_band_pos, band_domain);
	float band_top = mod(dark_band_pos + dark_band_thickness, band_domain);
	if(band_bottom > band_top)
	{
		if(band_y > band_bottom || band_y < band_top) noiseValue = 0.4*noiseValue;
	}
	else
	{
		if(band_y > band_bottom && band_y < band_top) noiseValue = 0.4*noiseValue;
	}
	
	vec4 texColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	vec3 tex_hsv = rgb2hsv(vec3(texColor));
	vec3 bright_hsv = vec3(tex_hsv.x, tex_hsv.y, (tex_hsv.z + 1.0)/2.0);
	vec3 bright_rgb = hsv2rgb( bright_hsv );
	float amount = 0.2;
	float red = mix(bright_rgb.r*0.4, noiseValue, amount);
	float green = mix(bright_rgb.g, noiseValue, amount);
	float blue =  mix(bright_rgb.b, noiseValue, amount);
	float alpha = texColor.a*0.65;
	gl_FragColor = vec4(red, green, blue, alpha);
}