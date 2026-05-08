********************************************************************************
* Boll Deluxe 2.1.5 Old Engine *
********************************************************************************

Thank you for downloading our game. This file details some important information
about the software and explains your options and settings.


********************************************************************************
* Disclaimer *
********************************************************************************

We are not associated with SEGA or Nintendo.

Source code is included with every official release and can be opened with
Game Maker 8.2 (recommended, ask in the discord) or the newest version of 8.1.

The game is open source and you can do whatever you want with it, just don't be
a fucking dick. Check the license at the bottom for further details.


********************************************************************************
* Controls *
********************************************************************************

[Keyboard]

[F1] - Help tips
[Alt]+[Enter] or [F4] - Toggle fullscreen
[F9] - Screenshot (shots\<timestamp>.png)
[F10, while an error is displayed] - Go to level editor (mainly for levels with code blocks)
[F11] - Cycle between x1, x2, auto fit or fullscreen
[Escape] - Back

Configurable keyboard defaults:

Keyboard 1
[Enter] - Start
[Arrows] - movement
[X] - Jump / Confirm
[Z] - Action / Return
[C] - Alt Action
[A] - Charm Action 1
[S] - Charm Action 2
[D] - Charm Action 3
[V] - Reset (Lemon / Time Attack)

Keyboard 2
[Backspace] - Start
[ijkl] - movement
[W] - Jump / Confirm
[Q] - Action / Return
[E] - Alt Action
[1] - Charm Action 1
[2] - Charm Action 2
[3] - Charm Action 3
[R] - Reset (Lemon / Time Attack)

You can connect a second keyboard to your computer (or just pile up on each
other) and use the second keyboard layout with the gray cursor.


[Gamepads]

A few default layouts are provided for common controller brands. You can change
the buttons on the controller config screen in the settings.


[Cursors]

Each input device gets its own cursor, and all devices can control the white
cursor in screens that have just one. Keyboard and mouse get a white cursor
while up to eight gamepads are given color-coded pointers (Only 4 players can
play at a time!). The alternate keyboard gets a gray cursor. You can connect a
second keyboard to your computer and use the alternate keyboard layout to play
2-player with a friend.


********************************************************************************
* Game Modes *
********************************************************************************

[Classic]

The original Boll Deluxe experience! Play through the game normally and rescue
the princess. This is automatically selected when playing with one character.

[Time Attack]

Race to the end of any level in the game as fast as possible! Try and beat the times of Boll Team themselves while the timer counts up!

[Multiplayer Battle]

Fight your friends for the best scores! This is a mode similar to Sonic 2
multiplayer. Up to four players can join. At the end of stages you can see a
score tally, and in the end you get totals.

[Multiplayer Co-Op]

Play with up to 4 players in a normal game of Boll Deluxe, no score, no lives!

********************************************************************************
* Game Options *
********************************************************************************

[Language] lets you pick between the translations currently available. You can
    create your own translations by copying the English example.

[Balance] controls the relative volume between music and sound effects. If you
    require to mute the game, please make use of the system mixer.

[Keyboard Settings] here you can change the buttons used by both keyboards.

[Gamepad Settings] you can change the button settings for each gamepad you have
    connected.

[Video Zoom] choose between three zoom sizes or fullscreen. You can also change
    this with F11 and F4.

[Video Filter] toggles bilinear filtering if you prefer that over the game's
    automatic pixel correction filter. You can also pick a CRT effect.

[Disable Jokes] if you don't like seeing random easter eggs, you can turn them
    off permanently with this option.

[30 FPS Background Mode] Reduces the background update speed to 30 FPS for
	better performance.

[Discord Rich Presence] Enables Discord Rich Presence on your profile, which
	lets other users on discord see more detailed info about the game.
	
[Optimize Assets] This option disables
	all assets, providing smoother FPS.


********************************************************************************
* Troubleshooting *
********************************************************************************

The game depends on some files to work correctly:

sbres.dll - core game data
sbdat.dll - core game data
sb39d.dll - file operations
sbsnd.dll - sound wrapper
sbfmd.dll - fmodex sound system
sbjoy.dll - joystick wrapper
sbsdl.dll - simple directmedia layer
sbhrt.dll - high resolution timer
sbpow.dll - screensaver preventer
sbfoc.dll - focus detection for joystick input

If these files are not found in the game directory, the game will malfunction in
strange, fantastic ways. You can find them on the original release zip file.


********************************************************************************
* Skinning Function *
********************************************************************************

When the game starts, it will look inside the \Skins\ folder for available
packages. A few examples are bundled with the release. To get more skins, check
the gamebanana page (there's a link in the main menu).

There are three types of skins - Player skins, World skins and Music packs. 
The bundled skins are examples of how to build them. You can only
select one World skin at a time, and one Player skin for each player. Make sure
you don't change the pink outline, as it is necessary for transparency.

To install a skin, simply unzip it to a new directory inside \Skins\World\,
\Skins\Player\, \Skins\Music\, or \Skins\Level\, depending on type.


********************************************************************************
* Mods *
********************************************************************************

Much like skins, mods encompass more technical packs you can make for the game,
like level packs, language packs and the all-new character packs, called charms.


********************************************************************************
* Links *
********************************************************************************

> https://twitter.com/boll_deluxe
Our social media page where you can contact us.

> https://discord.gg/DfZYkFTa6T
You can find us here.

> https://boll-team.itch.io/
Our page where we post our new releases.

> https://gamebanana.com/games/6027
You can find lots of community-maintained skins here.


********************************************************************************
* Tools for speedruns *
********************************************************************************

The game includes a very basic set of tools for speedrunning.

When at the stage selection screen, press the red button to toggle TAS mode.
While this is activated, you'll see the current fps and frame count on the
in-game HUD and additional controls will be available.

You can also rerecord a replay by hitting Ctrl-T while watching it. This will
enable TAS mode and pause. Be aware of controllers, since it will reuse the
configuration used when recording it.

A gamepad is recommended for TASing since loading a state will reset keyboard
input, but won't reset gamepad input, allowing for easier recording.

[Mouse wheel] - control fps
[Left click] - load a game state
[Right click] - save a game state

If you are in Time Attack, hold [V] or whatever button you have binded to the Reset key to restart from the very beginning, without having the reload the entire level again!
 

********************************************************************************
* Lemon Manual *
********************************************************************************

[Text Block]
All text can be colored or scaled, as well as given a specific size, within the actual text itself.
using the following tags 

${c=R,G,B} R being the amount of red from 0 to 255, G being the amount of green from 0 to 255 and B being the amount of blue from 0 to 255.

${a=X} X is a number from 0 to 1 (use decimals!). It will determine the text's transparency, 1 is opaque, and 0 is invisible.

${s=X} X being the number you multiply the scale of the original with. (you can use decimals!)
[Output/Input ID System]

Multiple objects in the Technical tab support IDs, they are a number-based signal system where any ID can be either 'On' or 'Off', 
these can trigger different things in specific objects. Try them all out and see what you can make!

[Signal Communicator]

You can use these to make simple circuits. They have multiple types, and those can
be used as switches and logic gates. Try it out! They output an ID

[Button]

These are probably the simplest technical object to understand, They're buttons!
They can be filtered to detect if players, stones or corks, or enemies are currently overlapping them.
If so, they output a signal through an ID!
These also have a 'Perma-Active' mode that, once it's toggled, will stay toggled forever.

[Detector]

These are very similar to buttons, but instead of being half a tile tall, these can be limitlessly stretched horizontally!
They have the same detection mode like buttons, but by default, these have 'Perma-Active' set to ON. But this can be changed in the drop-down.

[Gate]

These are also very simple to understand, once their Input ID is triggered they will raise up, and lower if its deactivated.
They will pass through other blocks above it, so be careful! You can adjust the gate's height and speed in which it opens/closes.
The 'Invert' option will make the gate, by default, be raised up, and triggering the Input ID will make it lower.

[On/Off Screen]

This variation of an On/Off Switch has 3 modes:

-- TIMER --

This will simply countdown from 9 seconds, and when it hits 0 it will flip like a regular On/Off Switch, and reset the timer. 
If you hit it, you can reset the timer.

-- COUNTER --

This will simply count up whenever it's hit, meant to be used with an I-Reader but those are broken sadly.
If it surpasses 9 it will reset back to 0.

-- LANTERN --

Will probably be the most commonly used mode, these have a simple active/deactivated state and dont do anything to on/off blocks.
Instead, they act like visual screens that can be toggled by hitting it, or with an ID signal. These will also emit light when turned on in dark areas.

[Spawner]

Very technical object, not intended for casual use.
This will simply spawn an object selected from the selected list, and you have the option to make the object execute code for itself when its spawned.

[Mark]

Mark is used to add objects that don't have lemon tags. This is an advanced
object, so use with care.

[Tyler]

Use texture tiles to add any texture from different world sheets to the level. You can
also pick whether they have collision. This can be used to create more intricate
level decoration.

[Code Block]

These can be used to inject code into your level.
They can only be seen when in lemon play test and are completely invisible during normal play

Trigger Mode:
	Auto: Does once at level load
	Trigger: Can be triggered through a Turing Block
	Loop: Upon being triggered through Turing Block, repeat the code forever
	Always: Always run the code

Due to the flexibility and difficulty of using Code Blocks it's reccommended to save your level before testing any codeblocks, save often.
	- A few Basic Effects (Tested with Always type Code Blocks)
		-SIZE CHANGE
			-player.size=X //[Doesn't work on Auto] Replace X with a number to change the player's size. 0 is small, 1 is big, 2 is fire, 3 is feather, 4 is extra (if the character has it), and 5 is mini. (The Kid and Giana are incompatible with this)
		-MUSIC MUTE
			-mus_play("") //[Doesn't work on Auto]Will last for the entire level after being triggered if Auto or Always, if Trigger then msuic will return upon encountering bowser or warping

A few basic tools to use for Always type codeblocks:
	-If you want to only have an effect happen while the player is a distance away from the codeblock use:
		if abs(player.x-x)+abs(player.y-y)<=[Range in pixels] { [Effect] }
	-If you want to only have an effect once but Auto doesn't work use this instead:
		with player with other {{ [Effect] } instance_destroy()}
	-If you only want the effect to trigger when the player is in the same subworld as you use this:
		getregion(x) if player.region = region {[Effect]}

You can also set an Input ID to be triggered when that specific ID is triggered.

ADVANCED TECH [For use only with Auto codeblocks] 
this one will require some tutorials
First place this one in the topleft corner of your level in the first subworld,

Edit the global.code_custommus value to whatever music you want,

global.code_custommus="alt-snow" ds_map_add(mushandles,global.code_custommus,0)  ds_map_add(mushandles,global.code_custommus+"_filename",0)   replacemusic(global.code_custommus) instance_destroy()


After this you must now place another codeblock on every subworld you want the music to change in with this code:

getregion(x) region.typemus = global.code_custommus instance_destroy() 


********************************************************************************
* Licensing *
********************************************************************************

Uses 39dll by 39ster
SDL 1.2 is licensed under the Lesser GNU Public License version 2.1
JoyDll is licensed under the zlib license; Copyright (C) 2010 Evan Balster
FMOD Sound System, copyright (c) Firelight Technologies Pty, Ltd., 1994-2019
GMFMOD Sound Engine by: icuurd12b42


I Don't Give A Shit License 1.1

This game is open source and we don't care what you do with it, but we ask you
to play fair and not do anything malicious because we put a lot of time and
effort making something nice and if you ruin that for us it just means that
we're gonna stop doing that and you won't get any more updates. If you intend
to make your own fork and/or modded version of Boll Deluxe, you must make the 
source code (referring to the .gm81) available to the public as well.


----------
Boll Team 2025