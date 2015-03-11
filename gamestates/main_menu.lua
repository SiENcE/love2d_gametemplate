local Game = require 'game'
local MainMenu = Game:addState('MainMenu')

function MainMenu:enteredState()
	self:log('Entering MainMenu')

	TEsound.playLooping( _menu_.texture['ANThology'], 'music', nil, 1.0)

	self.menu = Menu:new({
		{ 'Start Game', function() self:gotoState('Loading', 'InGame', require( 'subclass/ingameressources' ), _ingame_ ) end },
		{ 'Options', function() self:pushState('OptionsMenu') end },
		{ 'Exit', function() self:exit() end }
	})
	
	self.fadein = { alpha = 0 }
	-- Title text
	flux.to(self.fadein, 2, { alpha = 1 }):ease("linear")
end

function MainMenu:exitedState()
	TEsound.stop('music', false)
	self.menu = nil
	self:log('Exiting MainMenu')
end

function MainMenu:draw()
	love.graphics.setColor(255, 255, 255, self.fadein.alpha * 255)
	self.menu:draw()
end

function MainMenu:mousepressed(x,y,button)
	TEsound.play( _menu_.texture['click'], 'sfx')
	
	self.menu:mousepressed(x,y,button)
end

return MainMenu
