// circle open/close shader
uniform float time;
uniform float progress; // 0 = cerrado, 1 = abierto
uniform sampler2D tex;

void main() {
    vec2 uv = gl_FragCoord.xy / textureSize(tex, 0);
    vec2 center = vec2(0.5, 0.5);
    
    float dist = distance(uv, center);
    float radius = smoothstep(progress - 0.1, progress, dist);

    vec4 color = texture(tex, uv);

    // Si dist > progress, vuelve transparente (círculo)
    if (dist > progress) {
        color.a = 0.0;
    }

    gl_FragColor = color;
}

