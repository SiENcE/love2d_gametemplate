local res = {}
res.images = {
	{'climber', 'media/images/left-hand-climber-hi.png' },
	{'climber2', 'media/images/left-hand-climber-hi2.png' },
	{'climber3', 'media/images/left-hand-climber-hi3.png' },
	{'textureatlas', 'media/images/textureatlas.png',
		quads = {
				['left-hand-climber-hi'] = { 2, 2, 402, 598, 406, 961 },
				['left-hand-climber-hi2'] = { 2, 602, 240, 357, 406, 961 },
				['left-hand-climber-hi3'] = { 244, 602, 120, 179, 406, 961 },
		}
	},
}
return res