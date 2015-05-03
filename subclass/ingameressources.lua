local res = {}
res.image = {
--	{'left-hand-climber-hi', 'media/images/left-hand-climber-hi.png' },
--	{'left-hand-climber-hi2', 'media/images/left-hand-climber-hi2.png' },
--	{'left-hand-climber-hi3', 'media/images/left-hand-climber-hi3.png' },

	-- or put everything into an texture atlas, the code stays the same
	{'textureatlas', 'media/images/textureatlas.png',
		quad = {
			['left-hand-climber-hi']={ 0, 0, 402, 598, 512, 1024, 0, 0, 402, 598 },
			['left-hand-climber-hi2']={ 0, 600, 240, 357, 512, 1024, 0, 0, 240, 357 },
			['left-hand-climber-hi3']={ 242, 600, 120, 179, 512, 1024, 0, 0, 120, 179 }
		},
	},
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
