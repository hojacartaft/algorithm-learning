--[[
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant 
 * of patent rights can be found in the PATENTS file in the same directory.
]]--


-- Allows to display colors.
-- Modified code from https://github.com/hoelzro/ansicolors .

local colormt = {}

function colormt:__tostring()
    return self.value
end

function colormt:__concat(other)
    return tostring(self) .. tostring(other)
end

function colormt:__call(s)
    return self .. s .. _M.reset
end

colormt.__metatable = {}

local function makecolor(value)
    return setmetatable({ value = string.char(27) .. '[' .. tostring(value) .. 'm' }, colormt)
end

local colors = {
    -- attributes
    reset = 0,
    clear = 0,
    bright = 1,
    dim = 2,
    underscore = 4,
    blink = 5,
    reverse = 7,
    hidden = 8,

    -- foreground
    black = 30,
    red = 31,
    green = 32,
    yellow = 33,
    blue = 34,
    magenta = 35,
    cyan = 36,
    white = 37,

    -- background
    onblack = 40,
    onred = 41,
    ongreen = 42,
    onyellow = 43,
    onblue = 44,
    onmagenta = 45,
    oncyan = 46,
    onwhite = 47,
}

for c, v in pairs(colors) do
    _G[c] = makecolor(v)
end
