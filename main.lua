-- include
flux	 = require "lib.flux"
cron     = require 'lib.cron'
Menu     = require 'lib.menu'

-- game & gamestate requires
local Game = require 'game'

-- global game states
require 'gamestates.loading'
require 'gamestates.main_menu'
require 'gamestates.options_menu'
require 'gamestates.options_sound'
require 'gamestates.options_keyboard'
require 'gamestates.ingame'

-- global Ressources
media = { images = {}, sounds = {} }

-- game instance
local testgame = nil	-- main game object

-- basic LÖVE callbacks used on this game; add more as needed
function love.load()
	testgame = Game:new() -- initialize game
end

function love.draw()
	testgame:draw()
end

function love.update(dt)
	cron.update(dt)
	flux.update(dt)
	testgame:update(dt)
end

function love.keypressed(key, code)
	testgame:keypressed(key, code)
end

function love.keyreleased(key, code)
	testgame:keyreleased(key, code)
end

function love.mousepressed(x,y,button)
	testgame:mousepressed(x,y,button)
end

function love.mousereleased(x,y,button)
	testgame:mousereleased(x,y,button)
end

function love.quit()
	testgame:quit()
end

