const std = @import("std");
const os = std.os;
const fs = std.fs;

const warn = std.debug.print;

pub fn read_stl_acii(filename: []const u8) !void {
    var gp = std.heap.GeneralPurposeAllocator(.{ .safety = true }){};
    defer _ = gp.deinit();
    const allocator = gp.allocator();

    var file = try fs.openFileAbsolute(filename, .{});
    defer file.close();

    const buffer_size = 2000;
    const file_buffer = try file.readToEndAlloc(allocator, buffer_size);
    defer allocator.free(file_buffer);

    var iter = std.mem.split(u8, file_buffer, "\n");
    while (iter.next()) |line| {
        warn("-- {s} -- \n", .{line});
    }
}
