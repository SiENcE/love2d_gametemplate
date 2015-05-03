local Game = require 'game'
local Loading = Game:addState('Loading')

local loader = require 'lib/love-loader'
local Quad	 = require 'lib/quad'

local currentBackground = 1
local background = {}
--background[1] = love.graphics.newImage("media/images/loading/1.png")
--background[2] = love.graphics.newImage("media/images/loading/2.png")
--background[3] = love.graphics.newImage("media/images/loading/3.png")

--[[
local loader = {}

loader.newImage = love.graphics.newImage
loader.newSource = love.audio.newSource
loader.newFont = love.graphics.newFont
-- ... add the others if you need them

local f,g
loader.start = function(all, one)
  f,g = all,one
end

loader.update = function()
  g()
  f()
end

return loader
]]--

local function processTexture( ressources, ressourceholder )
	for k,v in pairs(ressources.image) do
		if v.quad and type(v.quad) == 'table' then
			for i,j in pairs(v.quad) do
				ressourceholder.texture[i] = Quad:new( ressourceholder.image[ v[1] ], unpack(j))
			end
		else
			ressourceholder.texture[v[1]] = Quad:new( ressourceholder.image[ v[1] ])
		end
	end
end

function Loading:enteredState( nextscene, ressources, ressourceholder, filepath, levelname, gamemode )
	print('Entered Loading ...', filepath, levelname, gamemode)
	if background and #background > 0 then
		currentBackground = math.random(#background)
	end

	self.loading_fadein = { alpha = 0 }
	-- set to 0 to show no loadbar (because love-loader is only resetted when started)
	loader.loadedCount=0
	loader.resourceCount=0

	-- if not already loaded, load ressources
	if ressources and not ressources.done and ressourceholder then
		print("adding sources ...")
		if ressources.image then
			for k,v in pairs(ressources.image) do
--				print(k, v[1], v[2])
				loader.newImage(ressourceholder.image, v[1], v[2])
			end
		end
		if ressources.imagedata then
			for k,v in pairs(ressources.imagedata) do
--				print(k, v[1], v[2])
				loader.newImageData(ressourceholder.image, v[1], v[2])
			end
		end
		if ressources.source then
			for k,v in pairs(ressources.source) do
--				print(k, v[1], v[2], v[3])
				loader.newSource(ressourceholder.sound, v[1], v[2], v[3])
			end
		end
		if ressources.sounddata then
			for k,v in pairs(ressources.sounddata) do
--				print(k, v[1], v[2])
				loader.newSoundData(ressourceholder.sound, v[1], v[2])
			end
		end
		-- mark ressources as loaded
--		ressources.done = true
	else
		-- set to 1 to show a full loadbar
		loader.loadedCount=1
		loader.resourceCount=1
		print('Ressources already loaded or not specified!')
	end

	flux.to(self.loading_fadein, 0.5, { alpha = 1 }):ease('quadin'):oncomplete(
			function()
				loader.start(
					function()
						flux.to(self.loading_fadein, 0.5, { alpha = 0 }):ease('quadout'):oncomplete(
							function()
								-- if not already processed
								if ressources and not ressources.done and ressourceholder then
									-- process atlases into textures
									processTexture( ressources, ressourceholder )

									-- mark ressources as loaded
									ressources.done = true
								end
								self:gotoState( nextscene, filepath, levelname, gamemode )
							end
						)
					end
					, print)
			end
		)
end

function Loading:exitedState()
	print('Exiting Loading')
	love.graphics.setColor(255, 255, 255, 255)

	self.loading_fadein = nil
end

local backImageSize = { w=1280, h=720}
local screenposition_ = { x=0, y=0 }
local boxsize = { w = 300, h = 30 }
local seperator = 3
local percent = 0
local center = { x=0, y=0 }
function Loading:draw()
	screenposition_.x = (self:GetScreenwidth()-backImageSize.w)/2
	screenposition_.y = (self:GetScreenheight()-backImageSize.h)/2
	center = { x = backImageSize.w/2 + screenposition_.x, y = backImageSize.h/2 + screenposition_.y}
	
	love.graphics.setColor(255, 255, 255, self.loading_fadein.alpha * 115)
	if background and currentBackground and background[currentBackground] then
		backImageSize = { w = background[currentBackground]:getWidth(), h = background[currentBackground]:getHeight() }
		love.graphics.draw(background[currentBackground], screenposition_.x, screenposition_.y)
	end
	love.graphics.setColor(255, 255, 255, self.loading_fadein.alpha * 250)

	-- draw percentage string
	if loader.resourceCount ~= 0 then percent = loader.loadedCount / loader.resourceCount end
	local percentagestring = ("Loading .. %d%%"):format(percent*100)
	love.graphics.print(percentagestring, center.x-string.len(percentagestring)*2,center.y)
	
	-- draw loading box TLfres.ws, TLfres.hs
	love.graphics.setColor(128, 128, 128, self.loading_fadein.alpha * 200)
	love.graphics.rectangle("line", center.x-boxsize.w-seperator, center.y+20-seperator, boxsize.w*2+seperator*2, boxsize.h+seperator*2)
	love.graphics.setColor(255, 255, 255, self.loading_fadein.alpha * 200)
	local w = boxsize.w*2 * (loader.loadedCount / loader.resourceCount)
	love.graphics.rectangle("fill", center.x-boxsize.w, center.y+20, w, boxsize.h)
end

function Loading:update( dt )
	loader.update()
end

return Loading
