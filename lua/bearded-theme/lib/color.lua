-- Advanced color manipulation utilities for BeardedTheme
-- Based on HSL color space for better color blending

local M = {}

---@class Color
local Color = {}
local Color_mt = {
    __index = Color,
    __tostring = function(self)
        return self:to_hex()
    end,
}

-- Simple hex to RGB conversion
local function hex_to_rgb(hex)
    if hex:lower() == "none" then
        return { 0, 0, 0 }
    end
    
    hex = hex:gsub("#", "")
    if #hex == 3 then
        hex = hex:gsub(".", "%1%1")
    end
    
    local r = tonumber(hex:sub(1, 2), 16) / 255
    local g = tonumber(hex:sub(3, 4), 16) / 255
    local b = tonumber(hex:sub(5, 6), 16) / 255
    
    return { r, g, b }
end

-- Simple RGB to hex conversion
local function rgb_to_hex(rgb)
    local r = math.floor(rgb[1] * 255 + 0.5)
    local g = math.floor(rgb[2] * 255 + 0.5)
    local b = math.floor(rgb[3] * 255 + 0.5)
    return string.format("#%02x%02x%02x", r, g, b)
end

-- Convert RGB to HSL
local function rgb_to_hsl(rgb)
    local r, g, b = rgb[1], rgb[2], rgb[3]
    local max = math.max(r, g, b)
    local min = math.min(r, g, b)
    local h, s, l = 0, 0, (max + min) / 2

    if max == min then
        h, s = 0, 0 -- achromatic
    else
        local d = max - min
        s = l > 0.5 and d / (2 - max - min) or d / (max + min)
        
        if max == r then
            h = (g - b) / d + (g < b and 6 or 0)
        elseif max == g then
            h = (b - r) / d + 2
        elseif max == b then
            h = (r - g) / d + 4
        end
        h = h / 6
    end

    return { h * 360, s * 100, l * 100 }
end

-- Convert HSL to RGB
local function hsl_to_rgb(hsl)
    local h, s, l = hsl[1] / 360, hsl[2] / 100, hsl[3] / 100
    local r, g, b

    if s == 0 then
        r, g, b = l, l, l -- achromatic
    else
        local function hue_to_rgb(p, q, t)
            if t < 0 then t = t + 1 end
            if t > 1 then t = t - 1 end
            if t < 1/6 then return p + (q - p) * 6 * t end
            if t < 1/2 then return q end
            if t < 2/3 then return p + (q - p) * (2/3 - t) * 6 end
            return p
        end

        local q = l < 0.5 and l * (1 + s) or l + s - l * s
        local p = 2 * l - q
        
        r = hue_to_rgb(p, q, h + 1/3)
        g = hue_to_rgb(p, q, h)
        b = hue_to_rgb(p, q, h - 1/3)
    end

    return { r, g, b }
end

local function none_to_hex()
    return "NONE"
end

---Create a new color object from a RGB hex string
---@param hex string Hex color
---@return Color
function Color.new(hex)
    if hex:lower() == "none" then
        return setmetatable({ H = 0, S = 0, L = 0, to_hex = none_to_hex }, Color_mt)
    end
    
    local rgb = hex_to_rgb(hex)
    local hsl = rgb_to_hsl(rgb)
    
    return setmetatable({ H = hsl[1], S = hsl[2], L = hsl[3] }, Color_mt)
end

function Color:to_rgb()
    return hsl_to_rgb({ self.H, self.S, self.L })
end

function Color:to_hex()
    local rgb = self:to_rgb()
    return rgb_to_hex(rgb)
end

local function blend_rgb(a, b, ratio)
    local result = {}
    for i = 1, 3 do
        result[i] = math.sqrt((1 - ratio) * math.pow(a[i], 2) + ratio * math.pow(b[i], 2))
    end
    return result
end

--- Blend Color with another color (hex)
---@param color_b string Hex color
---@param ratio number Blend ratio [0, 1]
---@return Color
function Color:blend(color_b, ratio)
    if color_b:lower() == "none" then
        return self
    end
    
    local rgb_a = self:to_rgb()
    local rgb_b = hex_to_rgb(color_b)
    local blended_rgb = blend_rgb(rgb_a, rgb_b, ratio)
    local blended_hsl = rgb_to_hsl(blended_rgb)
    
    self.H, self.S, self.L = blended_hsl[1], blended_hsl[2], blended_hsl[3]
    return self
end

---@param ratio number Brighten ratio [-1, 1]
---@param bg? string background color, if light, ratio = -ratio
---@return Color
function Color:brighten(ratio, bg)
    if bg and bg:lower() == "none" then
        return self
    end
    
    local bg_lightness = bg and rgb_to_hsl(hex_to_rgb(bg))[3] or 0
    ratio = bg_lightness > 50 and -ratio or ratio

    local lspace = ratio > 0 and 100 - self.L or self.L
    self.L = math.max(0, math.min(100, self.L + lspace * ratio))
    return self
end

---@param ratio number Saturate ratio [-1, 1]
---@return Color
function Color:saturate(ratio)
    local sspace = ratio > 0 and 100 - self.S or self.S
    self.S = math.max(0, math.min(100, self.S + sspace * ratio))
    return self
end

---@param ratio number Lighten ratio [-1, 1]
---@return Color
function Color:lighten(ratio)
    local lspace = ratio > 0 and 100 - self.L or self.L
    self.L = math.max(0, math.min(100, self.L + lspace * ratio))
    return self
end

---@param ratio number Darken ratio [-1, 1]
---@return Color
function Color:darken(ratio)
    return self:lighten(-ratio)
end

return setmetatable(M, {
    __call = function(_, ...)
        return Color.new(...)
    end,
})
