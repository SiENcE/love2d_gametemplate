-- Quad (internal class)
local class = require ( 'lib/middleclass' )
local Quad = class('Quad')

function Quad:initialize(img, x, y, width, height, sw, sh)
	self.img = img
	if x and y and width and height then
		self.quad = love.graphics.newQuad(x, y, width, height, sw, sh)
	end
end

function Quad:draw(...)
	if self.quad then
		love.graphics.draw(self.img, self.quad, ...)
	else
		love.graphics.draw(self.img, ...)
	end
end

function Quad:getDimensions()
	if not self.quad then return end
	local x, y, w, h = self.quad:getViewport()
    return w, h
end

return Quad
