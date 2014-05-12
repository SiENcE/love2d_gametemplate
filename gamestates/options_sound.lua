local Game = require 'game'
local MainMenu = require 'gamestates.main_menu'

local SoundMenu = Game:addState('SoundMenu', MainMenu)

function SoundMenu:enteredState()
  self:log('Entering SoundMenu')

  self.sndmenu = Menu:new({
    { 'Sound', function() end },
    { 'Back', function() self:popState() end },
  })
end

function SoundMenu:exitedState()
  self.sndmenu = nil
  self:log('Exiting SoundMenu')
end

function SoundMenu:draw()
	self.sndmenu:draw()
end

function SoundMenu:keypressed(key, code)
  if key == 'escape' then
    self:popState()
  end
end

function SoundMenu:mousepressed(x,y,button)
	TEsound.play( _menu_.sounds['click'], 'sfx')
	
	self.sndmenu:mousepressed(x,y,button)
end

return SoundMenu
