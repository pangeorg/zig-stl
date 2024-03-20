const std = @import("std");
const stlfile = @import("stlfile.zig");
usingnamespace @import("vector.zig");

pub fn main() !void {
    try stlfile.read_stl_acii("C:\\Users\\gstockinger\\source\\zig\\zig-stl\\test-data\\cube_calibrationtest.stl");
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
