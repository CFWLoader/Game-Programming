#ifdef GL_ES
precision mediump float;        // Precision qualifier (See Chapter 6)
#endif
varying vec4 v_Color;
void main() {
    gl_FragColor = v_Color;    // Set color.
}