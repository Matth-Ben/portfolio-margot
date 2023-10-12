import leefTexture from './../../images/shadow-1024.jpg'
import { GUI } from 'dat.gui'

class LoadShader {
  constructor( element ) {
    const BASE_VERTEX_SHADER = `
      attribute vec2 position;
      varying vec2 fragCoord;

      void main() {    
        gl_Position = vec4(position, 0, 1.0);
        fragCoord = position * 0.5 + 0.5;
      }
    `;

    const BASE_FRAGMENT_SHADER = `
      precision highp float;
      varying vec2 fragCoord;

      uniform sampler2D textureSampler;
      uniform float uRatio;
      uniform bool uShowNoise;
      uniform float uOpacity;
      uniform float uTime;
      uniform float uSpeed;
      uniform float uSizeX;
      uniform float uSizeY;
      uniform float uPower;
      uniform int uNoise;
      uniform bool uEnableSmooth;
      uniform float uMinSmooth;
      uniform float uMaxSmooth;

      //	Classic Perlin 3D Noise 
      //	by Stefan Gustavson
      vec4 permute(vec4 x){return mod(((x*34.0)+1.0)*x, 289.0);}
      vec4 taylorInvSqrt(vec4 r){return 1.79284291400159 - 0.85373472095314 * r;}
      vec3 fade(vec3 t) {return t*t*t*(t*(t*6.0-15.0)+10.0);}
      
      float cnoise(vec3 P){
        vec3 Pi0 = floor(P); // Integer part for indexing
        vec3 Pi1 = Pi0 + vec3(1.0); // Integer part + 1
        Pi0 = mod(Pi0, 289.0);
        Pi1 = mod(Pi1, 289.0);
        vec3 Pf0 = fract(P); // Fractional part for interpolation
        vec3 Pf1 = Pf0 - vec3(1.0); // Fractional part - 1.0
        vec4 ix = vec4(Pi0.x, Pi1.x, Pi0.x, Pi1.x);
        vec4 iy = vec4(Pi0.yy, Pi1.yy);
        vec4 iz0 = Pi0.zzzz;
        vec4 iz1 = Pi1.zzzz;
      
        vec4 ixy = permute(permute(ix) + iy);
        vec4 ixy0 = permute(ixy + iz0);
        vec4 ixy1 = permute(ixy + iz1);
      
        vec4 gx0 = ixy0 / 7.0;
        vec4 gy0 = fract(floor(gx0) / 7.0) - 0.5;
        gx0 = fract(gx0);
        vec4 gz0 = vec4(0.5) - abs(gx0) - abs(gy0);
        vec4 sz0 = step(gz0, vec4(0.0));
        gx0 -= sz0 * (step(0.0, gx0) - 0.5);
        gy0 -= sz0 * (step(0.0, gy0) - 0.5);
      
        vec4 gx1 = ixy1 / 7.0;
        vec4 gy1 = fract(floor(gx1) / 7.0) - 0.5;
        gx1 = fract(gx1);
        vec4 gz1 = vec4(0.5) - abs(gx1) - abs(gy1);
        vec4 sz1 = step(gz1, vec4(0.0));
        gx1 -= sz1 * (step(0.0, gx1) - 0.5);
        gy1 -= sz1 * (step(0.0, gy1) - 0.5);
      
        vec3 g000 = vec3(gx0.x,gy0.x,gz0.x);
        vec3 g100 = vec3(gx0.y,gy0.y,gz0.y);
        vec3 g010 = vec3(gx0.z,gy0.z,gz0.z);
        vec3 g110 = vec3(gx0.w,gy0.w,gz0.w);
        vec3 g001 = vec3(gx1.x,gy1.x,gz1.x);
        vec3 g101 = vec3(gx1.y,gy1.y,gz1.y);
        vec3 g011 = vec3(gx1.z,gy1.z,gz1.z);
        vec3 g111 = vec3(gx1.w,gy1.w,gz1.w);
      
        vec4 norm0 = taylorInvSqrt(vec4(dot(g000, g000), dot(g010, g010), dot(g100, g100), dot(g110, g110)));
        g000 *= norm0.x;
        g010 *= norm0.y;
        g100 *= norm0.z;
        g110 *= norm0.w;
        vec4 norm1 = taylorInvSqrt(vec4(dot(g001, g001), dot(g011, g011), dot(g101, g101), dot(g111, g111)));
        g001 *= norm1.x;
        g011 *= norm1.y;
        g101 *= norm1.z;
        g111 *= norm1.w;
      
        float n000 = dot(g000, Pf0);
        float n100 = dot(g100, vec3(Pf1.x, Pf0.yz));
        float n010 = dot(g010, vec3(Pf0.x, Pf1.y, Pf0.z));
        float n110 = dot(g110, vec3(Pf1.xy, Pf0.z));
        float n001 = dot(g001, vec3(Pf0.xy, Pf1.z));
        float n101 = dot(g101, vec3(Pf1.x, Pf0.y, Pf1.z));
        float n011 = dot(g011, vec3(Pf0.x, Pf1.yz));
        float n111 = dot(g111, Pf1);
      
        vec3 fade_xyz = fade(Pf0);
        vec4 n_z = mix(vec4(n000, n100, n010, n110), vec4(n001, n101, n011, n111), fade_xyz.z);
        vec2 n_yz = mix(n_z.xy, n_z.zw, fade_xyz.y);
        float n_xyz = mix(n_yz.x, n_yz.y, fade_xyz.x); 
        return 2.2 * n_xyz;
      }
      
      //	Simplex 3D Noise 
      //	by Ian McEwan, Ashima Arts
      float snoise(vec3 v){ 
        const vec2  C = vec2(1.0/6.0, 1.0/3.0) ;
        const vec4  D = vec4(0.0, 0.5, 1.0, 2.0);
      
        // First corner
        vec3 i  = floor(v + dot(v, C.yyy) );
        vec3 x0 =   v - i + dot(i, C.xxx) ;
      
        // Other corners
        vec3 g = step(x0.yzx, x0.xyz);
        vec3 l = 1.0 - g;
        vec3 i1 = min( g.xyz, l.zxy );
        vec3 i2 = max( g.xyz, l.zxy );
      
        //  x0 = x0 - 0. + 0.0 * C 
        vec3 x1 = x0 - i1 + 1.0 * C.xxx;
        vec3 x2 = x0 - i2 + 2.0 * C.xxx;
        vec3 x3 = x0 - 1. + 3.0 * C.xxx;
      
        // Permutations
        i = mod(i, 289.0 ); 
        vec4 p = permute( permute( permute( 
                  i.z + vec4(0.0, i1.z, i2.z, 1.0 ))
                + i.y + vec4(0.0, i1.y, i2.y, 1.0 )) 
                + i.x + vec4(0.0, i1.x, i2.x, 1.0 ));
      
        // Gradients
        // ( N*N points uniformly over a square, mapped onto an octahedron.)
        float n_ = 1.0/7.0; // N=7
        vec3  ns = n_ * D.wyz - D.xzx;
      
        vec4 j = p - 49.0 * floor(p * ns.z *ns.z);  //  mod(p,N*N)
      
        vec4 x_ = floor(j * ns.z);
        vec4 y_ = floor(j - 7.0 * x_ );    // mod(j,N)
      
        vec4 x = x_ *ns.x + ns.yyyy;
        vec4 y = y_ *ns.x + ns.yyyy;
        vec4 h = 1.0 - abs(x) - abs(y);
      
        vec4 b0 = vec4( x.xy, y.xy );
        vec4 b1 = vec4( x.zw, y.zw );
      
        vec4 s0 = floor(b0)*2.0 + 1.0;
        vec4 s1 = floor(b1)*2.0 + 1.0;
        vec4 sh = -step(h, vec4(0.0));
      
        vec4 a0 = b0.xzyw + s0.xzyw*sh.xxyy ;
        vec4 a1 = b1.xzyw + s1.xzyw*sh.zzww ;
      
        vec3 p0 = vec3(a0.xy,h.x);
        vec3 p1 = vec3(a0.zw,h.y);
        vec3 p2 = vec3(a1.xy,h.z);
        vec3 p3 = vec3(a1.zw,h.w);
      
        //Normalise gradients
        vec4 norm = taylorInvSqrt(vec4(dot(p0,p0), dot(p1,p1), dot(p2, p2), dot(p3,p3)));
        p0 *= norm.x;
        p1 *= norm.y;
        p2 *= norm.z;
        p3 *= norm.w;
      
        // Mix final noise value
        vec4 m = max(0.6 - vec4(dot(x0,x0), dot(x1,x1), dot(x2,x2), dot(x3,x3)), 0.0);
        m = m * m;
        return 42.0 * dot( m*m, vec4( dot(p0,x0), dot(p1,x1), 
                                      dot(p2,x2), dot(p3,x3) ) );
      }
      
      
      // Voroinoise
      const mat2 myt = mat2(.12121212, .13131313, -.13131313, .12121212);
      const vec2 mys = vec2(1e4, 1e6);
      
      vec2 rhash(vec2 uv) {
        uv *= myt;
        uv *= mys;
        return fract(fract(uv / mys) * uv);
      }
      
      vec3 hash(vec3 p) {
        return fract(
            sin(vec3(dot(p, vec3(1.0, 57.0, 113.0)), dot(p, vec3(57.0, 113.0, 1.0)),
                    dot(p, vec3(113.0, 1.0, 57.0)))) *
            43758.5453);
      }
      
      vec3 voronoi3d(const in vec3 x) {
        vec3 p = floor(x);
        vec3 f = fract(x);
      
        float id = 0.0;
        vec2 res = vec2(100.0);
        for (int k = -1; k <= 1; k++) {
          for (int j = -1; j <= 1; j++) {
            for (int i = -1; i <= 1; i++) {
              vec3 b = vec3(float(i), float(j), float(k));
              vec3 r = vec3(b) - f + hash(p + b);
              float d = dot(r, r);
      
              float cond = max(sign(res.x - d), 0.0);
              float nCond = 1.0 - cond;
      
              float cond2 = nCond * max(sign(res.y - d), 0.0);
              float nCond2 = 1.0 - cond2;
      
              id = (dot(p + b, vec3(1.0, 57.0, 113.0)) * cond) + (id * nCond);
              res = vec2(d, res.x) * cond + res * nCond;
      
              res.y = cond2 * d + nCond2 * res.y;
            }
          }
        }
      
        return vec3(sqrt(res), abs(id));
      }
      
      // Simple Interpolated noise
      float rand2D(in vec2 co){
          return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
      }
      float rand3D(in vec3 co){
          return fract(sin(dot(co.xyz ,vec3(12.9898,78.233,144.7272))) * 43758.5453);
      }
      
      float simple_interpolate(in float a, in float b, in float x)
      {
        return a + smoothstep(0.0,1.0,x) * (b-a);
      }
      float interpolatedNoise3D(in float x, in float y, in float z)
      {
          float integer_x = x - fract(x);
          float fractional_x = x - integer_x;
      
          float integer_y = y - fract(y);
          float fractional_y = y - integer_y;
      
          float integer_z = z - fract(z);
          float fractional_z = z - integer_z;
      
          float v1 = rand3D(vec3(integer_x, integer_y, integer_z));
          float v2 = rand3D(vec3(integer_x+1.0, integer_y, integer_z));
          float v3 = rand3D(vec3(integer_x, integer_y+1.0, integer_z));
          float v4 = rand3D(vec3(integer_x+1.0, integer_y +1.0, integer_z));
      
          float v5 = rand3D(vec3(integer_x, integer_y, integer_z+1.0));
          float v6 = rand3D(vec3(integer_x+1.0, integer_y, integer_z+1.0));
          float v7 = rand3D(vec3(integer_x, integer_y+1.0, integer_z+1.0));
          float v8 = rand3D(vec3(integer_x+1.0, integer_y +1.0, integer_z+1.0));
      
          float i1 = simple_interpolate(v1,v5, fractional_z);
          float i2 = simple_interpolate(v2,v6, fractional_z);
          float i3 = simple_interpolate(v3,v7, fractional_z);
          float i4 = simple_interpolate(v4,v8, fractional_z);
      
          float ii1 = simple_interpolate(i1,i2,fractional_x);
          float ii2 = simple_interpolate(i3,i4,fractional_x);
      
          return simple_interpolate(ii1 , ii2 , fractional_y);
      }
      
      float Noise3D(in vec3 coord, in float wavelength)
      {
        return interpolatedNoise3D(coord.x/wavelength, coord.y/wavelength, coord.z/wavelength);
      }
      
      void main() {

        vec2 responsive = vec2(fragCoord.x,(1. - fragCoord.y)*uRatio);

        // ------------------------------- NOISE

        float noise = .0;

        if (uNoise == 1) {
          noise = cnoise(vec3(responsive.x * uSizeX, responsive.y * uSizeY, uTime * uSpeed)) * uPower;
        } else if (uNoise == 2) {
          noise = snoise(vec3(responsive.x * uSizeX, responsive.y * uSizeY, uTime * uSpeed)) * uPower;
        } else if (uNoise == 3) {
          noise = (voronoi3d(vec3(responsive.x * uSizeX, responsive.y * uSizeY, uTime * uSpeed)) * uPower).r;
        }

        // ------------------------------- SMOOTH
        
        if (uEnableSmooth){
          noise = smoothstep(uMinSmooth, uMaxSmooth, noise);
        }

        // ------------------------------- TEXTURE + NOISE

        vec4 texture = texture2D(textureSampler, responsive + vec2(noise));

        if (uShowNoise){
          gl_FragColor = vec4(vec3(noise), 1.);
        } else {
          gl_FragColor = vec4(texture);
        }
      }
    `

    const image = new Image();
    image.crossOrigin = "Anonymous";
    image.src = '/wp-content/themes/theme-margot/assets/images/shadow-1024.jpg';
    image.onload = function () {
      const hashURL = new URL(document.URL).hash.slice(1);

      // Init vars
      const canvasContainer = element;
      const canvas = element.querySelector(".canvas");
      const gl = canvas.getContext("webgl");
      const program = gl.createProgram();

      // Init experience
      initWebGL();
      initUniforms();
      retinaCanvas();
      hashURL === "debug" && initGUI();

      // -------------------------------------------------------- INIT WEBGL

      function initWebGL()
      {    
        gl.viewport(0, 0, gl.drawingBufferWidth, gl.drawingBufferHeight);

        // Create our vertex shader
        const vertexShader = gl.createShader(gl.VERTEX_SHADER);
        gl.shaderSource(vertexShader, BASE_VERTEX_SHADER);
        gl.compileShader(vertexShader);

        // Create our fragment shader
        const fragmentShader = gl.createShader(gl.FRAGMENT_SHADER);
        gl.shaderSource(fragmentShader, BASE_FRAGMENT_SHADER);
        gl.compileShader(fragmentShader);

        // Create our program
        gl.attachShader(program, vertexShader);
        gl.attachShader(program, fragmentShader);
        gl.linkProgram(program);

        // Enable the program
        gl.useProgram(program);

        // Bind VERTICES as the active array buffer.
        const VERTICES = new Float32Array([-1, -1, -1, 1, 1, 1, -1, -1, 1, 1, 1, -1]);

        const vertexBuffer = gl.createBuffer();
        gl.bindBuffer(gl.ARRAY_BUFFER, vertexBuffer);
        gl.bufferData(gl.ARRAY_BUFFER, VERTICES, gl.STATIC_DRAW);

        // Set and enable our array buffer as the program's "position" variable
        const positionLocation = gl.getAttribLocation(program, "position");
        gl.vertexAttribPointer(positionLocation, 2, gl.FLOAT, false, 0, 0);
        gl.enableVertexAttribArray(positionLocation);

        // Create a texture
        const texture = gl.createTexture();
        gl.activeTexture(gl.TEXTURE0);
        gl.bindTexture(gl.TEXTURE_2D, texture);
        gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, image);
        gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE);
        gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE);
        gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
        gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
      }

      // -------------------------------------------------------- UNIFORMS
      
      // Create uniforms
      function initUniforms()
      {
        // Responsive uniform calculing ratio from canvas element
        gl.uniform1f(gl.getUniformLocation(program, "uRatio"),canvas.clientHeight / canvas.clientWidth);
        gl.uniform1f(gl.getUniformLocation(program, "uTime"), 0.);
        gl.uniform1i(gl.getUniformLocation(program, "uNoise"), 1);
        gl.uniform1i(gl.getUniformLocation(program, "uShowNoise"), 0);
        gl.uniform1f(gl.getUniformLocation(program, "uSpeed"), 0.27);
        gl.uniform1f(gl.getUniformLocation(program, "uSizeX"), 1.);
        gl.uniform1f(gl.getUniformLocation(program, "uSizeY"), 1.);
        gl.uniform1f(gl.getUniformLocation(program, "uPower"), .03);   
        gl.uniform1i(gl.getUniformLocation(program, "uEnableSmooth"), 0.);
        gl.uniform1f(gl.getUniformLocation(program, "uMinSmooth"), 0.);
        gl.uniform1f(gl.getUniformLocation(program, "uMaxSmooth"), 1.);
      }

      // -------------------------------------------------------- INIT GUI

      function initGUI()
      {

          const onUniformsChange = (pType, pName, pValue) => {
            gl[`uniform`+pType](gl.getUniformLocation(program, pName), pValue);
          }

          // Material parameters to update
          const materialParameters = {
              NoiseAlgorythm:gl.getUniform(program, gl.getUniformLocation(program, "uNoise")),
              ShowNoise:gl.getUniform(program, gl.getUniformLocation(program, "uShowNoise")),
              Speed:gl.getUniform(program, gl.getUniformLocation(program, "uSpeed")),
              SizeX:gl.getUniform(program, gl.getUniformLocation(program, "uSizeX")),
              SizeY:gl.getUniform(program, gl.getUniformLocation(program, "uSizeY")),
              Power:gl.getUniform(program, gl.getUniformLocation(program, "uPower")),
              MinSmooth:gl.getUniform(program, gl.getUniformLocation(program, "uMinSmooth")),
              MaxSmooth:gl.getUniform(program, gl.getUniformLocation(program, "uMaxSmooth")),
              EnableSmooth:gl.getUniform(program, gl.getUniformLocation(program, "uEnableSmooth")),
          }


          // Init GUI & parameters
          const gui = new GUI()
          const windFolder = gui.addFolder('Wind parameters')
          windFolder.add(materialParameters, 'NoiseAlgorythm', [1,2,3]).onChange(value => onUniformsChange('1i','uNoise', value))
          windFolder.add(materialParameters, 'ShowNoise', 0, 1).onChange(value => onUniformsChange('1i','uShowNoise', value))
          windFolder.add(materialParameters, 'Speed', 0, 5).onChange(value => onUniformsChange('1f','uSpeed', value))
          windFolder.add(materialParameters, 'SizeX', 0, 5).onChange(value => onUniformsChange('1f','uSizeX', value))
          windFolder.add(materialParameters, 'SizeY', 0, 5).onChange(value => onUniformsChange('1f','uSizeY', value))
          windFolder.add(materialParameters, 'Power', 0, .5).onChange(value => onUniformsChange('1f','uPower', value))
          windFolder.add(materialParameters, 'EnableSmooth', 0, 1).onChange(value => onUniformsChange('1i','uEnableSmooth', value))
          windFolder.add(materialParameters, 'MinSmooth', 0, 1).onChange(value => onUniformsChange('1f','uMinSmooth', value))
          windFolder.add(materialParameters, 'MaxSmooth', 0, 1).onChange(value => onUniformsChange('1f','uMaxSmooth', value))
          windFolder.open()
      }

      // -------------------------------------------------------- RESPONSIVE

      // On window resize
      function onResize()
      {
        // Update retina device support
        retinaCanvas()
      }

      // Support for retina device
      function retinaCanvas()
      {
        const canvasWidth = canvasContainer.clientWidth;
        const canvasHeight = canvasContainer.clientHeight;
        const devicePixelRatio = window.devicePixelRatio || 1;
        canvas.width  = canvasWidth  * devicePixelRatio;
        canvas.height = canvasHeight * devicePixelRatio;
        // Update fragment responsive
        gl.uniform1f(gl.getUniformLocation(program, "uRatio"), canvasHeight / canvasWidth);
        // Refresh canvas
        gl.viewport(0, 0, canvas.width, canvas.height);
      }

      // -------------------------------------------------------- LOOP

      let lastTime;
      const fps = 60;
      const requiredElapsed = 1000 / fps;

      function loop(now) {
          requestAnimationFrame(loop);
          
          if (!lastTime) { lastTime = now; }
          const elapsed = now - lastTime;

          if (elapsed > requiredElapsed) {
              gl.uniform1f(gl.getUniformLocation(program, "uTime"), lastTime / 1000);

              render()
              lastTime = now;
          }
      }

      requestAnimationFrame(loop);

      // -------------------------------------------------------- RENDER

      // Draw vertices
      function render()
      {
        gl.clearColor(1.0, 1.0, 1.0, 1.0);
        gl.clear(gl.COLOR_BUFFER_BIT);
        gl.drawArrays(gl.TRIANGLES, 0, 6);
      }

      // -------------------------------------------------------- EVENTS CALL

      window.addEventListener('resize', onResize)
    };
  }
}
export default LoadShader
