# Lua Vector Library

A simple 2D/3D vector library for use within Lua.

## Features
- 2D and 3D vector support
- Vector arithmetic operations (+, -, *, /)
- Vector negation
- Distance calculations
- Get/Set operations
- snake_case and PascalCase aliases

## Usage
```lua
require("vector")

-- Create vectors
local vec2d = Vector2D(1, 2)
local vec3d = Vector3D(1, 2, 3)

-- Vector arithmetic
local sum = vec2d + Vector2D(2, 3)
local scaled = vec3d * Vector3D(2, 2, 2)
local negated = -vec2d

-- Get vector components
local x, y = vec2d:get()
local x, y, z = vec3d:get()

-- Calculate distance
local distance = vec2d:distance(Vector2D(4, 5))
```

## Supported
  - Tested on LuaJIT 2.1.1736781742
