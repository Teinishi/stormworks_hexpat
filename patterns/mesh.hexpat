#pragma author Teinishi
#pragma description Stormworks mesh
#pragma magic [ 6D 65 73 68 ] @ 0x00
#pragma endian little

import type.magic;
import type.color;

using RGBA8 = type::RGBA8;

struct Vector3f {
    float x, y, z;
};

struct Text {
    u16 length;
    char text[length];
};

struct Vertex {
    Vector3f position;
    RGBA8 color;
    Vector3f normal;
};

enum ShaderType: u16 {
    Default = 0,
    Glass = 1,
    Additive = 2
};

struct Submesh {
    u32 index_buffer_start;
    u32 index_buffer_length;
    type::Magic<"\x00\x00">;
    ShaderType shader_type;
    Vector3f bounds_min;
    Vector3f bounds_max;
    type::Magic<"\x00\x00">;
    Text name;
    Vector3f;
};

struct Mesh {
    type::Magic<"mesh"> signature;
    type::Magic<"\x07\x00">;
    type::Magic<"\x01\x00">;
    u16 vertex_count;
    type::Magic<"\x13\x00\x00\x00">;
    Vertex vertices[vertex_count];
    u32 indices_count;
    u16 indices[indices_count];
    u16 submesh_count;
    Submesh submeshes[submesh_count];
    u16;
};

Mesh mesh @ 0x00;
