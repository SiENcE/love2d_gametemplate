local Game = require 'game'
local InGame = Game:addState('InGame')

function InGame:enteredState()
	self:log('Entering InGame')
	love.graphics.setColor( 255, 255, 255, 255 )
end

function InGame:exitedState()
	self:log('Exiting InGame')
end

function InGame:draw()
	_ingame_.texture['left-hand-climber-hi']:draw(0,0)
	_ingame_.texture['left-hand-climber-hi3']:draw(love.mouse.getX(), love.mouse.getY())
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
