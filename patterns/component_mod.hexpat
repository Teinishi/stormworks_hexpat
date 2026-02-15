#pragma author Teinishi
#pragma description Stormworks Component Mod
#pragma endian little

import std.mem;

struct File {
    char name[];
    u32 data_size;
    std::mem::Bytes<data_size> data;
};

struct ComponentMod {
    u32 data_size;
    char definition[];
    u16 file_count;
    File files[file_count];
    u8;
};

ComponentMod component_mod @ 0x00;
