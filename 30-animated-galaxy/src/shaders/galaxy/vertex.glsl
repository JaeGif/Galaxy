uniform float uSize;
uniform float uTime;
attribute float aScale;
attribute vec3 aRandomness;
varying vec3 vColor;

void main() {
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);

    // Spin
    // calculate angle depending on uTime and the distance


    float angle = atan(modelPosition.x, modelPosition.z);
    float distanceToCenter = length(modelPosition.xz); // everything is centered
    float angleOffset = (1.0 / distanceToCenter) * uTime * 0.2; // inverse distance
    angle += angleOffset;

    modelPosition.x = cos(angle) * distanceToCenter;
    modelPosition.z = sin(angle) * distanceToCenter;

    // randomness
    modelPosition.xyz += aRandomness;
    
    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;

    gl_Position = projectedPosition;
    gl_PointSize = uSize * aScale;

    // size attenuation
    gl_PointSize *= ( 1.0 / - viewPosition.z );

    // color
    vColor = color;
    // use uv to draw patterns on the plane
    // however, each vertex is a full particle
}