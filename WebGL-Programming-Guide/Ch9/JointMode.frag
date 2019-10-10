#ifdef GL_ES
precision mediump float;
#endif
uniform vec3 u_LightColor;
uniform vec3 u_LightPosition;
uniform vec3 u_AmbientLight;
varying vec3 v_Normal;
varying vec3 v_Position;
varying vec4 v_Color;
void main(){
    // 计算变换后的法向量并归一化
    vec3 normal = normalize(v_Normal);
    // 计算光线方向并归一化
    vec3 lightDirection = normalize(u_LightPosition - v_Position);
    // Dot product of the light direction and the orientation of a surface (the normal)
    float nDotL = max(dot(lightDirection, normal), 0.0);
    // Calculate the color due to diffuse reflection
    vec3 diffuse = u_LightColor * v_Color.rgb * nDotL;
    vec3 ambient = u_AmbientLight * v_Color.rgb;
    gl_FragColor = vec4(diffuse + ambient, v_Color);
}