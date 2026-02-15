#pragma author Teinishi
#pragma desccription Stormworks phys
#pragma magic [ 70 68 79 73 ] @ 0x00

import type.magic;

struct Vector3f {
    float x, y, z;
};

struct Submesh {
    u16 vertex_count;
    Vector3f vertices[vertex_count];
    type::Magic<"\x00\x00">;
};

struct Phys {
    type::Magic<"phys">;
    type::Magic<"\x02\x00">;
    u16 submesh_count;
    Submesh submeshes[submesh_count];
};

Phys phys @ 0x00;
