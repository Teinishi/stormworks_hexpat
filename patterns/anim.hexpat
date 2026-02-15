#pragma author Teinishi
#pragma description Stormworks anim
#pragma magic [ 61 6E 69 6D ] @ 0x00
#pragma endian little

import type.color;

using RGBA8 = type::RGBA8;

struct Vector3f {
    float x, y, z;
};

struct Quaternion {
    float x, y, z, w;
};

struct Matrix9 {
    float m[9];
};

struct Matrix12 {
    float m[12];
};

struct Text {
    u16 length;
    char text[length];
};

struct Header {
    char signature[4];
    u32;
};

struct AnimMeshVertex {
    Vector3f position;
    RGBA8 color;
    float;
    float;
    Vector3f normal;
    float bone_index_0;
    float bone_index_1;
    float bone_weight_0;
    float bone_weight_1;
};

enum ShaderType: u32 {
    Default = 0,
    Glass = 1,
    Additive = 2
};

struct AnimMesh {
    u32;
    ShaderType shader_type;
    u16;
    u32 vertices_data_size;
    AnimMeshVertex vertices[vertices_data_size / 52];
    u32 indices_data_size;
    u32 indices[indices_data_size / 4];
};

struct Bone {
    Text name;
    Matrix12 transform;
    s32 parent_index;
    u32 child_count;
    u32 child_indices[child_count];
};

struct Pose {
    Text name;
    u32 bone_count;
    Matrix12 bone_transforms[bone_count];
};

struct Keyframe<T> {
    u16 timestamp;
    T value;
};

struct BoneMotion {
    u32 bone_index;
    u32 translation_keyframe_count;
    Keyframe<Vector3f> translation_keyframes[translation_keyframe_count];
    u32 rotation_keyframe_count;
    Keyframe<Quaternion> rotation_keyframes[rotation_keyframe_count];
};

struct Motion {
    Text name;
    u32 bone_count;
    BoneMotion bone_motions[bone_count];
};

struct UnknownData {
    u32;
    Matrix12;
    float;
    float;
    Matrix9;
    Matrix9;
    float;
    float;
};

struct Anim {
    Header header;
    u32 mesh_count;
    AnimMesh meshes[mesh_count];
    u32 bone_count;
    Bone bones[bone_count];
    u32 pose_count;
    Pose poses[pose_count];
    u32 motion_count;
    Motion motions[motion_count];
    u32 unknown_data_count;
    UnknownData unknown_data[unknown_count];
};

Anim anim @ 0x00;
