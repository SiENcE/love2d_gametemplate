local Game = require 'game'
local InGame = Game:addState('InGame')

function InGame:enteredState()
	self:log('Entering InGame')
end

function InGame:exitedState()
	self:log('Exiting InGame')
end

function InGame:draw()
	love.graphics.draw(media.images['climber'], 0,0)
	love.graphics.print("Press ESC to go back", 250, 280)
end

function InGame:keypressed(key, code)
	if key == 'escape' then
		self:gotoState('MainMenu')
	end
end

function InGame:mousepressed(x,y,button)
end

return InGame
