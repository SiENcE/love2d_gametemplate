-- Quad.lua is distributed under the zlib/libpng License (http://opensource.org/licenses/Zlib)
-- author: Florian Fischer (c)^2015

local class = require ( 'lib/middleclass' )
local Quad = class('Quad')

function Quad:initialize(image, x, y, width, height, sw, sh)
	self.image = image
	self.x = x
	self.y = y
	self.width = width
	self.height = height
	self.sw = sw
	self.sh = sh
	if x and y and width and height then
		self.quad = love.graphics.newQuad(x, y, width, height, sw, sh)
	end
end

function Quad:draw(...)
	if self.quad then
		--  love 091 style
		love.graphics.draw(self.image, self.quad, ...)

		-- this is old!!
--		love.graphics.drawq(self.image, self.quad, ...)
	else
		love.graphics.draw(self.image, ...)
	end
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

return Quad
