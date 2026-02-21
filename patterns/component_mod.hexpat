#pragma author Teinishi
#pragma description Stormworks Component Mod
#pragma endian little

import std.mem;
import type.magic;

struct File {
    char name[];
    u32 data_size;
    std::mem::Bytes<data_size> data;
};

struct ComponentMod {
    u32 data_size;
    try {
        // Since Stormworks v1.15.11
        type::Magic<"\x01\x00\x00\x00">;
        char definition_name[];
        char definition[];
    } catch {
        // Until Stormworks v1.15.10
        char definition[];
    }
    u16 file_count;
    File files[file_count];
};

ComponentMod component_mod @ 0x00;