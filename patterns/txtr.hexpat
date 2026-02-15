#pragma author Teinishi
#pragma desccription Stormworks txtr
#pragma magic [ 54 58 54 52 ] @ 0x00
#pragma pattern_limit 16777216
#pragma endian little

import type.magic;
import type.color;
using RGBA8 = type::RGBA8;
using RGB565 = type::RGB565;

struct UncompressedImage {
    u32 data_size;
    RGBA8 bitmap[data_size / 4];
};

struct BC3Block {
    u8 alpha0;
    u8 alpha1;
    u48 alpha_indices;
    RGB565 color0;
    RGB565 color1;
    u32 color_indices;
};

struct CompressedImage {
    u32 data_size;
    BC3Block blocks[data_size / 16];
};

enum CompressionType: u32 {
    Uncompressed = 2,
    Compressed = 3
};

struct Txtr {
    type::Magic<"TXTR">;
    type::Magic<"\x03\x00\x00\x00">;
    CompressionType compression_type;
    type::Magic<"\x00">;
    u16 width;
    u16 height;
    u16 mipmap_count;
    match (compression_type) {
        (CompressionType::Uncompressed): UncompressedImage mipmaps[mipmap_count];
        (CompressionType::Compressed): CompressedImage mipmaps[mipmap_count];
    }
    u16;
};

Txtr txtr @ 0x00;
