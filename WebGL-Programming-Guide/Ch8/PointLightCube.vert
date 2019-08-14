attribute vec4 a_Position;
attribute vec4 a_Color;
attribute vec4 a_Normal;        // Normal
uniform mat4 u_MvpMatrix;
uniform mat4 u_ModelMatrix;     // 模型矩阵
uniform mat4 u_NormalMatrix;    // 用于变换法向量的矩阵
uniform vec3 u_LightColor;      // Light color
uniform vec3 u_LightPosition;   // 光源坐标 (世界坐标系)
uniform vec3 u_AmbientLight;    // 环境光
varying vec4 v_Color;
void main() {
    gl_Position = u_MvpMatrix * a_Position;
    // 计算变换后的法向量并归一化
    vec3 normal = normalize(vec3(u_NormalMatrix * a_Normal));
    // 计算顶点的世界坐标
    vec4 vertexPosition = u_ModelMatrix * a_Position;
    // 计算光线方向并归一化
    vec3 lightDirection = normalize(u_LightPosition - vec3(vertexPosition));
    // Dot product of the light direction and the orientation of a surface (the normal)
    float nDotL = max(dot(lightDirection, normal), 0.0);
    // Calculate the color due to diffuse reflection
    vec3 diffuse = u_LightColor * a_Color.rgb * nDotL;
    vec3 ambient = u_AmbientLight * a_Color.rgb;
    // 两者相加得到最终光线
    v_Color = vec4(diffuse + ambient, a_Color.a);
}