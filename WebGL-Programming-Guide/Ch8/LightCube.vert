attribute vec4 a_Position;
attribute vec4 a_Color;
attribute vec4 a_Normal;                 // 法向量
uniform mat4 u_MvpMatrix;
uniform vec3 u_LightColor;              // 光源颜色
uniform vec3 u_LightDirection;          // 归一化世界坐标
varying vec4 v_Color;
void main(){
    gl_Position = u_MvpMatrix * a_Position;
    vec3 normal = normalize(vec3(a_Normal));    // 对向量进行归一化处理
    float nDotL = max(dot(u_LightDirection, normal), 0.0);  // 计算光线方向与法向量的点积
    vec3 diffuse = u_LightColor * vec3(a_Color) * nDotL;    // 计算漫反射光颜色
    v_Color = a_Color;
}