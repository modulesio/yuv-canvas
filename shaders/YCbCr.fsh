// inspired by https://github.com/mbebenita/Broadway/blob/master/Player/canvas.js

precision lowp float;

uniform sampler2D uTextureY;
uniform sampler2D uTextureCb;
uniform sampler2D uTextureCr;
uniform sampler2D uContent;
varying vec2 vLumaPosition;
varying vec2 vChromaPosition;
varying vec2 vContentPosition;
void main() {
   // Y, Cb, and Cr planes are uploaded as LUMINANCE textures.
   float fY = texture2D(uTextureY, vLumaPosition).x;
   float fCb = texture2D(uTextureCb, vChromaPosition).x;
   float fCr = texture2D(uTextureCr, vChromaPosition).x;
   vec4 c = texture2D(uContent, vContentPosition);

   // Premultipy the Y...
   float fYmul = fY * 1.1643828125;

   // And convert that to RGB!
   gl_FragColor = vec4(
     fYmul + 1.59602734375 * fCr - 0.87078515625,
     fYmul - 0.39176171875 * fCb - 0.81296875 * fCr + 0.52959375,
     fYmul + 2.017234375   * fCb - 1.081390625,
     1
   );
   gl_FragColor.rgb = (gl_FragColor.rgb * (1.0 - c.a)) + (c.rgb * c.a);
}
