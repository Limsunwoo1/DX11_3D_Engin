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

VSOut main(VSIn In)
{
    VSOut OUT = (VSOut) 0.0f;
    
    float4 worldPosition = mul(In.Position, world);
    float4 viewPosition = mul(worldPosition, view);
    float4 ProjPosition = mul(viewPosition, projection);
    
    OUT.Position = ProjPosition;
    OUT.UV = In.UV;
    //OUT.Normal = In.Normal;
    
      //Normal position ����.
    //float3 vWorldDir = normalize(mul(float4(In.Position.xyz, 0.0f), world).xyz);
    //float3 LightDir = normalize(globalLightDir);
    
    float3 vWorldNormal = normalize(mul(float4(In.Normal.xyz, 0.0f), world).xyz);
    
    // saturate() �Լ��� 0 ������ ���� 0����, 1 �̻��� ���� 1�� �ٲ��ݴϴ�
    //OUT.intensity = saturate(dot(-LightDir, vWorldDir));
    OUT.WorldPos = worldPosition.xyz;
    OUT.Normal = vWorldNormal.xyz;
    
    return OUT;
}