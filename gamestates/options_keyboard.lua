local Game = require 'game'
local MainMenu = require 'gamestates.main_menu'

local KeyboardMenu = Game:addState('KeyboardMenu', MainMenu)

function KeyboardMenu:enteredState()
  self:log('Entering KeyboardMenu')
  love.graphics.setColor( 255, 255, 255, 255 )

  self.keymenu = Menu:new({
    { 'Keyboard', function() end },
    { 'Back', function() self:popState() end },
  })
end

function KeyboardMenu:exitedState()
  self.keymenu = nil
  self:log('Exiting KeyboardMenu')
end

function KeyboardMenu:draw()
	self.keymenu:draw()
end

function KeyboardMenu:keypressed(key, code)
  if key == 'escape' then
	self:popState()
  end
end

function KeyboardMenu:mousepressed(x,y,button)
	TEsound.play( _menu_.sound['click'], 'sfx')
	
	self.keymenu:mousepressed(x,y,button)
end

return KeyboardMenu
