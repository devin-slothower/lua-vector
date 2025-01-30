local vector = {
    x = 0,
    y = 0,
    z = 0,
    dimensions = 0,
}
vector.__index = vector

Vector3D = function(a, b, c)
    local new_vector = setmetatable({}, vector)

    a = type(a) == "number" and a or 0
    b = type(b) == "number" and b or 0
    c = type(c) == "number" and c or 0

    new_vector.x = a
    new_vector.y = b
    new_vector.z = c
    new_vector.dimensions = 3

    return new_vector
end
vector3d = Vector3D

Vector2D = function(a, b)
    local new_vector = Vector3D(a, b)
    new_vector.dimensions = 2

    return new_vector
end
vector2d = Vector2D

-- Overload functions
function vector.__add(a, b)
    local new_vector = Vector3D()

    if (a.dimensions == b.dimensions and a.dimensions == 2) then
        new_vector.dimensions = 2
    end

    new_vector.x = a.x + b.x
    new_vector.y = a.y + b.y
    new_vector.z = (new_vector.dimensions == 3) and a.z + b.z or 0

    return new_vector
end

function vector.__unm(a)
    a.x = -a.x
    a.y = -a.y
    a.z = -a.z

    return a
end

function vector.__sub(a, b)
    return a + (-b)
end

function vector.__mul(a, b)
    local new_vector = Vector3D()

    if (a.dimensions == b.dimensions and a.dimensions == 2) then
        new_vector.dimensions = 2
    end

    new_vector.x = a.x * b.x
    new_vector.y = a.y * b.y
    if (new_vector.dimensions ~= 2) then
        if (a.dimensions == b.dimensions) then
            new_vector.z = a.z * b.z
        else
            new_vector.z = (a.dimensions == 2) and b.z or a.z
        end
    end

    return new_vector
end

function vector.__div(a, b)
    local new_vector = Vector3D()

    if (a.dimensions == b.dimensions and a.dimensions == 2) then
        new_vector.dimensions = 2
    end

    new_vector.x = a.x / b.x
    new_vector.y = a.y / b.y
    if (new_vector.dimensions ~= 2) then
        if (a.dimensions == b.dimensions) then
            new_vector.z = a.z / b.z
        else
            new_vector.z = (a.dimensions == 2) and b.z or a.z
        end
    end

    return new_vector
end

-- Method functions
function vector:Get()
    if (self.dimensions == 3) then
        return self.x, self.y, self.z
    else
        return self.x, self.y
    end
end
vector.get = vector.Get

function vector:Set(a, b, c)
    self.x = a
    self.y = b
    self.z = (self.dimensions == 3) and c or 0
end
vector.set = vector.Set

function vector:Distance(a)
    local x, y, z = self:Get()
    local a_x, a_y, a_z = a:Get()

    z = z or 0
    a_z = a_z or 0

    return math.sqrt((x - a_x)^2 + (y - a_y)^2 + (z - a_z)^2)
end
vector.distance = vector.Distance

return vector
