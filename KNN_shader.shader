shader_type canvas_item;

uniform float size : hint_range(1,150.0,1.0);

uniform float r : hint_range(0.00001,100.0);
uniform float h : hint_range(0.00001,1.0);
uniform float lerpvalue:hint_range(0.0,1.0);
uniform float weight_treshold:hint_range(0.66,0.95);
uniform float lerp_treshold:hint_range(0.001,1.0);

vec3 lerp(vec3 colorone, vec3 colortwo, float value)
{
	//lerp from https://www.shadertoy.com/view/XlSSRW
    return (colorone + value*(colortwo-colorone));
} 



void fragment(){
	vec3 c = textureLod(SCREEN_TEXTURE, SCREEN_UV, 0.0).rgb;
	vec3 sum = vec3(0.0);
	float weightsum = 0.0;
	float blocksize = size/2.0;
	float fcount = 0.0;
	float lerpc = lerpvalue;
	
	float isize = 2.0 * size +1.0;
	isize *= isize;
	
	for (float x = -blocksize; x <= blocksize; x++){
			for (float y = -blocksize; y <= blocksize; y++){
				vec3 screen = textureLod(SCREEN_TEXTURE, SCREEN_UV + vec2(x,y) * SCREEN_PIXEL_SIZE, 0.0).rgb;
				
				float weight = exp(-( (abs(y-x)  )/ r + ( abs(dot(screen-c , screen-c)) )/h)) ;
				
				if ( weight > weight_treshold){
					fcount += weight;
				}

				weightsum += weight;
				sum += screen * weight;
		}
		
	}
	sum /= weightsum;

	lerpc = (fcount < lerp_treshold *isize) ? lerpc: 1.0 -lerpc;

	COLOR.rgb = lerp(c,sum,lerpc);

}