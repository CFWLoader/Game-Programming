attribute vec4 a_Position;
attribute vec4 a_Color;
attribute vec4 a_Normal;        // Normal
uniform mat4 u_MvpMatrix;
uniform mat4 u_NormalMatrix;    // 变换法向量的矩阵逆转置矩阵 P301
uniform vec3 u_LightColor;      // Light color
uniform vec3 u_LightDirection;  // Light direction (in the world coordinate, normalized)
uniform vec3 u_AmbientLight;    // 环境光
varying vec4 v_Color;
void main() {
    gl_Position = u_MvpMatrix * a_Position;
    // 计算变换后的法向量并归一化
    vec3 normal = normalize(vec3(u_NormalMatrix * a_Normal));
    // Dot product of the light direction and the orientation of a surface (the normal)
    float nDotL = max(dot(u_LightDirection, normal), 0.0);
    // Calculate the color due to diffuse reflection
    vec3 diffuse = u_LightColor * a_Color.rgb * nDotL;
    vec3 ambient = u_AmbientLight * a_Color.rgb;
    // 两者相加得到最终光线
    v_Color = vec4(diffuse + ambient, a_Color.a);
}