-- game & gamestate requires
local Game = require 'game'

-- global game states
require 'gamestates.loading'
require 'gamestates.main_menu'
require 'gamestates.options_menu'
require 'gamestates.options_sound'
require 'gamestates.options_keyboard'
require 'gamestates.ingame'

-- game instance
local testgame = nil	-- main game object

-- basic LÖVE callbacks used on this game; add more as needed
function love.load()
	testgame = Game:new() -- initialize game
end

function love.update(dt)
	testgame:baseUpdate(dt)
end

function love.draw()
	testgame:baseDraw()
end

function love.keypressed(key, code)
	testgame:baseKeypressed(key, code)
end

function love.keyreleased(key, code)
	testgame:baseKeyreleased(key, code)
end

function love.mousepressed(x,y,button)
	testgame:baseMousepressed(x,y,button)
end

function love.mousereleased(x,y,button)
	testgame:baseMousereleased(x,y,button)
end

function love.focus(f)
	testgame:baseFocus(f)
end

function love.quit()
	testgame:baseQuit()
end

