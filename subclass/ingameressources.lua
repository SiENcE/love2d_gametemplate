local res = {}
res.image = {
	{'left-hand-climber-hi', 'media/images/left-hand-climber-hi.png' },
	{'left-hand-climber-hi2', 'media/images/left-hand-climber-hi2.png' },
	{'left-hand-climber-hi3', 'media/images/left-hand-climber-hi3.png' },
	{'textureatlas', 'media/images/textureatlas.png',
		quad = {
				['A_left-hand-climber-hi'] = { 2, 2, 402, 598, 406, 961 },
				['A_left-hand-climber-hi2'] = { 2, 602, 240, 357, 406, 961 },
				['A_left-hand-climber-hi3'] = { 244, 602, 120, 179, 406, 961 },
		}
	},
	{'left-hand-climber-hi4', 'media/images/left-hand-climber-hi.png' },
	{'left-hand-climber-hi5', 'media/images/left-hand-climber-hi2.png' },
	{'left-hand-climber-hi6', 'media/images/left-hand-climber-hi3.png' },
	{'left-hand-climber-hi7', 'media/images/left-hand-climber-hi.png' },
	{'left-hand-climber-hi8', 'media/images/left-hand-climber-hi2.png' },
	{'left-hand-climber-hi9', 'media/images/left-hand-climber-hi3.png' },
	{'left-hand-climber-hi10', 'media/images/left-hand-climber-hi.png' },
	{'left-hand-climber-hi11', 'media/images/left-hand-climber-hi2.png' },
	{'left-hand-climber-hi12', 'media/images/left-hand-climber-hi3.png' },
}
res.imagedata = {
}
--Creates a new Source from a filepath, File, Decoder (steam/static) or SoundData.
res.source = {
}
--Contains raw audio samples. You can not play SoundData back directly. You must wrap a 'Source' object around it.
-- Sounddata -> Source -> play() -- soundata is automatically converted into source by TESound (mod. by me)
res.sounddata = {
}

return res
