local res = {}
res.image = {
}
res.imagedata = {
}
--Creates a new Source from a filepath, File, Decoder (steam/static) or SoundData.
res.source = {
	{'ANThology', 'media/music/001_SiENcE_-_ANThology.ogg', 'stream'},
}
--Contains raw audio samples. You can not play SoundData back directly. You must wrap a Source object around it.
res.sounddata = {
	{'click',       'media/sounds/click.ogg'},
	{'die',       'media/sounds/die.ogg'},
	{'explosion',       'media/sounds/explosion.ogg'},
	{'hit',       'media/sounds/hit.ogg'},
	{'jump',       'media/sounds/jump.ogg'},
	{'respawn',       'media/sounds/respawn.ogg'},
}

return res
