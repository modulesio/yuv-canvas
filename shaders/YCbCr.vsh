precision lowp float;

attribute vec2 aPosition;
attribute vec2 aLumaPosition;
attribute vec2 aChromaPosition;
attribute vec2 aContentPosition;
varying vec2 vLumaPosition;
varying vec2 vChromaPosition;
varying vec2 vContentPosition;
void main() {
    gl_Position = vec4(aPosition, 0, 1);
    vLumaPosition = aLumaPosition;
    vChromaPosition = aChromaPosition;
    vContentPosition = aContentPosition;
}
