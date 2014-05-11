-- Generated with TexturePacker (http://www.codeandweb.com/texturepacker)
-- with a custom export by Stewart Bracken (http://stewart.bracken.bz)
-- modified by FLorian Fischer
local res = {}
res.images = {
	{'{{texture.trimmedName}}', '{{texture.fullName}}',
		quads = {
				{% for sprite in allSprites %}['{{sprite.trimmedName}}'] = { {{sprite.frameRect.x}}, {{sprite.frameRect.y}}, {{sprite.frameRect.width}}, {{sprite.frameRect.height}}, {{texture.size.width}}, {{texture.size.height}} },
				{% endfor %}
		}
	},
}
return res

