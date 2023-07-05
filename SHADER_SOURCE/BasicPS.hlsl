#include "global.hlsli"

struct VSIn
{
    float4 Position : POSITION;
    float2 UV : TEXCOORD;
    float3 Normal : NORMAL;
};

struct VSOut
{
    float4 Position : SV_Position;
    float2 UV : TEXCOORD;
    float3 WorldPos : POSITION;
    float3 Normal : NORMAL;
    float intensity : FOG;
};

float4 main(VSOut In) : SV_Target
{
    float4 OutColor = float4(0.5f, 0.5f, 0.5f, 1.0f);
    
    float4 Out = float4(1.0f, 0.0f, 1.0f, 1.0f);
        //OUT.intensity = saturate(dot(-LightDir, vWorldDir));
        //float3 vWorldDir = normalize(mul(float4(In.Position.xyz, 0.0f), world).xyz);
    float3 LightDir = normalize(globalLightDir);
    
    // staturate 0 ~ 1 범위를 초과하는 값을 0 ~ 1 사이로 고정
    float intensity = saturate(dot(-LightDir, In.Normal));
    
    Out.xyz = (intensity * OutColor.xyz * globalLightColor)
                + (OutColor.xyz * globalLightAmb);
    
    return Out;
        
}