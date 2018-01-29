//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 MaskColor;

void main()
{
	float alpha = texture2D( gm_BaseTexture, v_vTexcoord ).w;
    gl_FragColor = v_vColour * vec4(MaskColor.xyz, MaskColor.w * alpha);
}