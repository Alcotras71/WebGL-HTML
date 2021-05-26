uniform float time;
varying float vNoise;
varying vec2 vUv;
uniform vec2 hover;
uniform float hoverState;

void main() {
  vec3 newPosition = position;
  float PI = 3.1415925;

  // float noise = cnoise(vec3(position.x * 4., position.y * 4. + time / 5., 0.)); ------- FOR PLANE GEOMETRY

  // float noise = cnoise(3. * vec3(position.x, position.y, position.z + time / 30.));

  // newPosition.z += 0.1 * sin( (newPosition.x + time / 10.) * 2. * PI);
  // newPosition.z += 0.2 * noise;

  float dist = distance(uv, hover);
  newPosition.z += hoverState * 10. * sin(dist * 10. + time);

  // float dist = distance(position, vec2(0.5));
  // newPosition.z += 0.05 * sin(dist * 40. - time);

  // newPosition += 0.1 * normal * noise;

  vNoise = hoverState * sin(dist * 10. - time);
  vUv = uv;

  gl_Position = projectionMatrix * modelViewMatrix * vec4(newPosition, 1.0);
}