varying vec3 vColor;

void main() {


    // disc
    // float strength = 1.0 - step(0.5, distance(gl_PointCoord, vec2(0.5)));

    // LINEAR DIFFUSE point pattern
    // distance from the center influences the alpha
/*     float strength = distance(gl_PointCoord, vec2(0.5));
    strength *= 2.0;
    strength = 1.0 - strength; */

    // light point pattern EXPONENTIAL DIFFUSE
    float strength = distance(gl_PointCoord, vec2(0.5));
    strength = 1.0 - strength;
    strength = pow(strength, 5.0);

    // final color
    vec3 color = mix(vec3(0.0), vColor, strength);

    gl_FragColor = vec4(color, 1.0);

    #include <colorspace_fragment>
}