## Client Music

### Description

A client-side [Minetest](https://www.minetest.net/) mod for playing music/sound files.

***NOTE:** Unfortunately, until Minetest supports media with client-side mods, only music provided by the server can be played.*

Licensing: [MIT](LICENSE.txt)

### Usage

**WARNING:** Make sure to install in the "clientmods" directory. If installed as a server mod, chat commands should fail.

Chat commands:

```
- .cmus <command> [<sound_file>]
	- Manage music.
	- commands:
		- play: Play a music file.
		- stop: Stop playing music.
	- sound_file: file basename to be played
```

### Links

- [Changelog](changelog.txt)
- [TODO](TODO.txt)
