// vector operations needed for stl volume stuff

pub fn cross(comptime T: type, a: @Vector(3, T), b: @Vector(3, T)) @Vector(3, T) {
    return @Vector(3, T){ a[1] * b[2] - a[2] * b[1], a[2] * b[0] - a[0] * b[2], a[0] * b[1] - a[1] * b[0] };
}

pub fn dot(comptime T: type, a: @Vector(3, T), b: @Vector(3, T)) T {
    return @reduce(.Add, a * b);
}
