-- Quad.lua is distributed under the zlib/libpng License (http://opensource.org/licenses/Zlib)
-- author: Florian Fischer (c)^2015

local class = require ( 'lib/middleclass' )
local Quad = class('Quad')

-- love.graphics.draw( x, y, r, sx, sy, ox, oy, kx, ky )
function Quad:initialize(image, x, y, width, height, sw, sh, ox, oy, kx, ky)
	self.image = image
	self.x = x
	self.y = y
	self.width = width
	self.height = height
	self.sw = sw
	self.sh = sh
	self.ox = ox or 0	-- optional offset in texture atlas with cropped alpha
	self.oy = oy or 0 -- optional offset in texture atlas with cropped alpha
	self.kx = kx
	self.ky = ky
	if self.x and self.y and self.width and self.height then
		self.quad = love.graphics.newQuad( self.x, self.y, self.width, self.height, self.sw, self.sh )
	else
		self.width = self.image:getWidth()
		self.height = self.image:getHeight()
	end
end

--[[
number x - The position to draw the object (x-axis).
number y - The position to draw the object (y-axis).
number r (0) Orientation (radians).
number sx (1) Scale factor (x-axis).
number sy (sx) Scale factor (y-axis).
number ox (0) Origin offset (x-axis).
number oy (0) Origin offset (y-axis).
number kx (0) Shearing factor (x-axis).
number ky (0) Shearing factor (y-axis).
]]--
function Quad:draw(...)
	if self.quad then
		--  love 091 style
		love.graphics.draw(self.image, self.quad, ...)

		-- this is old!!
	--	love.graphics.drawq(self.image, self.quad, ...)
	else
		love.graphics.draw(self.image, ...)
	end
end

function Quad:setFilter( min, max)
	self.image:setFilter(min,max)
end

function Quad:getImage()
	return self.image
end

function Quad:getQuad()
	return self.quad
end

-- return width of the quad
function Quad:getWidth()
	return self.width
end

-- return height of the quad
function Quad:getHeight()
	return self.height
end

function Quad:save( filename )
	local x, y, w, h = self:getQuad():getViewport()
	local imageData = love.image.newImageData( w, h )
	imageData:paste(self.image:getData(), 0, 0, x, y, w, h)
	if filename and type(filename) == 'string' then
		imageData:encode( filename, 'png' )
	else
		imageData:encode( 'file.png', 'png' )
	end
end

return Quad
