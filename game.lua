local class = require ( 'lib/middleclass' )
local Stateful = require ( 'lib/stateful' )
local Game = class('Game'):include(Stateful)

-- includes
flux	 = require "lib.flux"
cron     = require 'lib.cron'
Menu     = require 'lib.menu'
require ('lib/TEsound')

--debug music
TEsound.sound=true
TEsound.music=true

-- global Ressources
_menu_ = { image = {}, texture = {}, sound = {} }
_ingame_ = { image = {}, texture = {}, sound = {} }

local fps_ = 0
--local paused_ = false
local screenwidth, screenheight = 1280,720

--------------------------------------------------------------------------------
-- don't change this, put your code into the baseXXX functions !!!!
-- Also include "default safe" methods for the callbacks
-- This way we don't have to define "mousepressed" on the states that don't need it
--------------------------------------------------------------------------------
function Game:update(dt)
end
function Game:draw()
end
function Game:keypressed(key,unicode)
end
function Game:keyreleased(key,unicode)
end
function Game:mousepressed(x, y, button)
end
function Game:mousereleased(x, y, button)
end
function Game:focus()
end
function Game:quit()
end

--------------------------------------------------------------------------------
-- main functions
--------------------------------------------------------------------------------
function Game:initialize()
	local success = love.window.setMode( screenwidth, screenheight )
	love.graphics.setDefaultFilter( 'nearest', 'nearest' )
	
	-- menu ressources
	self:gotoState('Loading', 'MainMenu', require( 'subclass/menuressources' ), _menu_ )
end

function Game:baseUpdate(dt)
	fps_ = love.timer.getFPS()

	-- update music/sound
	TEsound.cleanup()

	cron.update(dt)
	flux.update(dt)

	-- call standard
	self:update(dt)
end

function Game:baseDraw()
	-- draw game
	self:draw()
end

-- by default, exit when pressing 'escape'
function Game:baseKeypressed(key, code)
	print( 'Game:baseKeypressed', key )

--	if key == 'escape' then
--		self:exit()
--	end
	
	-- call standard
	self:keypressed(key,unicode)
end

function Game:baseKeyreleased(key, code)
	-- call standard
	self:keyreleased(key,unicode)
end

function Game:baseMousepressed(x,y,button)
	-- call standard
	self:mousepressed(x, y, button)
end

function Game:baseMousereleased(x,y,button)
	-- call standard
	self:mousereleased(x, y, button)
end

function Game:baseFocus(f)
	-- call standard
	self:focus()
end

function Game:baseQuit()
	-- call standard
	self:quit()
end

--------------------------------------------------------------------------------
-- Include the methods available in all states here
--------------------------------------------------------------------------------

-- Screen Options
function Game:GetScreenwidth()
	return screenwidth
end

function Game:GetScreenheight()
	return screenheight
end

-- prints output in the console
-- If you are on windows you will need to activate it first, see
--   https://love2d.org/wiki/Config_Files
-- for details (you have to set t.console to true)
function Game:log(...)
  print(...)
end

function Game:exit()
  self:log("Goodbye!")
  love.event.push('quit')
end

return Game
