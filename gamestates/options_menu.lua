local Game = require 'game'
local MainMenu = require 'gamestates.main_menu'

local OptionsMenu = Game:addState('OptionsMenu', MainMenu)

function OptionsMenu:enteredState()
  self:log('Entering OptionsMenu')

  self.optmenu = Menu:new({
    { 'Keyboard', function() self:pushState('KeyboardMenu') end },
    { 'Sound', function() self:pushState('SoundMenu') end },
    { 'Back', function() self:popState() end },
  })
end

function OptionsMenu:exitedState()
  self.optmenu = nil
  self:log('Exiting OptionsMenu')
end

function OptionsMenu:draw()
	self.optmenu:draw()
end

function OptionsMenu:keypressed(key, code)
  if key == 'escape' then
	self:popState()
  end
end

function OptionsMenu:mousepressed(x,y,button)
	TEsound.play( _menu_.sounds['click'], 'sfx')
	
	self.optmenu:mousepressed(x,y,button)
end

return OptionsMenu
