# Sonic R Updater
![Image of SRUpdater](https://raw.githubusercontent.com/cheatfreak47/SRUpdater/master/repo.png)
### Sonic R Updater is a patch for the PC ports of Sonic R.

This patch will update any version of the game to the much more friendly 2004 port, with the [Sonic R Mod Loader](https://github.com/sonicretro/sonicr-mod-loader/releases) included, along with a few helpful mods for it.

## Features

 - Can install on top of the extremely common (and cheap) 1998 port of Sonic R, providing wider accessibility to the PC version of the game.
 - Runs perfectly on modern Windows installations, with little to no configuration required, unlike the vanilla 1998 port.
 - Installs Sonic R Mod Loader into the game, allowing for robust modding support, as well as several additional features:
	- Removes the need for a disc to be inserted.
	- bass_vgmstream audio support with looping and pausing.
	- properly bordered windowed mode with custom window size options.
	- custom resolution with proper widescreen support.
	- better borderless windowed mode support.
	- improved game frame rate stability for modern hardware.
	- an array of interesting cheat codes.
	- maybe even more as the mod loader is in active development.
 - Downloads the latest version of the Sonic R Mod Loader if possible during installation to make sure you're up to date at the time of install.
 - Includes RemoveStrays, a mod to fix various stray pixels in the Menu and HUD throughout the game.
 - Includes ADX Music, a mod that changes out the 2004 port's default `.son` files for much more space efficient `.ADX` format audio that even loops in some cases when appropriate.
 - Includes Saturn Style Colors, a mod that improves the lighting of the game to further match the Sega Saturn original and makes Radiant Emerald semi-transparent again.
 - Includes EggRobo Texture Fix, a mod that fixes a minor bug involving the texture of EggRobo.

## Usage

1. Install Sonic R from your retail disc or an ISO image on your PC wherever you'd like. (I recommend `C:\Program Files (x86)\Sega\SonicR`, personally.) If you get an error saying "This app can't run on your PC", right click on the disc drive and choose `Open` or `Explore` and double click on `Setup.exe` instead.
2. Do not install DirectX 6 when prompted. You do not need to install the DirectPlay Windows Feature, and ignore any errors that appear after the installation completes from it trying to open the 1998 game. Ignore this step if you by some chance actually have the 2004 port, which also works.
3. Download the latest Sonic R Updater and run it.
4. It should auto-detect the installed location of Sonic R, simply click next or browse to the correct location in the event that it was unable to find the correct path.
5. Proceed with the installation. Leave the box checked if you'd like to get familiar with the Sonic R Mod Manager right away.
6. Shortcuts to `Sonic R`, `Sonic R Mod Manager`, and `Sonic R Help` are all added to your Windows Start Menu, use the shortcuts there to play the game.

As time goes on, Sonic R Mod Loader may be updated, and thus, the one you installed will become out of date. You can update Sonic R Mod Loader by running Sonic R Updater again, or you can [download it manually](http://mm.reimuhakurei.net/misc/SonicRModLoader.7z) and drop the archive contents into your Sonic R Installation folder.

## Troubleshooting &  Issues
**Problem:** When I go to install Sonic R I get a "This app can't run on your PC" error.

**Solution:** As stated above, the Sonic R (1998) _autorun_ program cannot run on 64-bit Windows due to being a 16-bit executable. To work around this, right click on the disc drive and choose "Open" or "Explore" and double click on `Setup.exe` instead. This should allow you to install Sonic R properly.

## Uninstall

What's that? You don't like this patch? I can't imagine why you wouldn't... unless you just don't like Sonic R. In which case, clearly you're delusional, because Sonic R is obviously the best Sonic game. 

Well, in any case, to remove it, just uninstall Sonic R normally by opening `Control Panel` → `Programs` → `Uninstall a Program` → `SonicR`, and then, after the Uninstall has finished, navigate to the installation folder and delete any remaining files. You may leave behind the `save` and `ghost` folders if you wish to avoid losing any save games, and you should keep the `mods` folder if you developed any mods and have their resources laying around in there.

Lastly, the Start Menu shortcuts can be removed by right clicking one of them in the Start Menu, and going to `More` → `Open file location`, followed by clicking the Up One Level button (↑) and deleting the `SonicR` folder in `Sega`. If you don't have any other Sega games installed, you may also want to delete the `Sega` folder to remove it from your Start Menu as well.

## F.A.Q.

**Q:** Is this speedrun legal?

**A:** [Not yet](https://www.speedrun.com/Sonic_R/thread/zc91h) but a speedrun category could be made, if there's enough community push for it. Technically, neither ADX Music or RemoveStrays are code based mods, and thus have no effect on how the game performs or behaves in any way, outside of extremely minor, nearly unnoticeable cosmetic differences in UI Textures and Audio Quality. The only changes to the game made by Sonic R Mod Loader are also purely cosmetic, save for fixing a bug that caused terrible frame rates on any modern Windows OS. (I think should get a pass because it's just making the game behave like it's supposed to on any machine, and the bug is caused by changes to Windows and changes to how hardware works, not the game itself, which normally performs as expected on a period computer with the appropriate Windows OS.)


**Q:** 2004 port? Why haven't I heard of this before?

**A:** It's just really obscure and quite rare, only being released in limited quantities in the UK and Australia. (to our current knowledge, at least...) On top of that, the boxes are not even labeled accordingly, and that makes tracking copies down rather difficult. It's as though they just treated the entire port as _just another reprint of the 1998 port._ Oh well, can't expect too much from Sonic R, right?


**Q:** How do I play in network multiplayer mode?

**A:** The short answer is you can't. The long answer is that the 2004 port of Sonic R this is based on removed all network play from the game for whatever reason. It's theroretically possible for it to be modded back or for someone to create an online multiplayer mod, similar to [SA2 Battle Network](
https://github.com/michael-fadely/sa2-battle-network), but that's probably not going to happen, since there seems to be little interest in modding Sonic R generally. Please do let me know if you make that mod though, I'd love to include it if it ever comes to exist.


**Q:** How 2 Compile?

**A:** Clone the repository and install the two dependencies; Inno Setup and Inno Download Plugin. You might also opt to install Inno Script Studio which was used heavily during development of this software. Anyway, just compile the Sonic R Updater ISS script and you're golden.

## Credits
	
#### CheatFreak
 - Sonic R Updater project leader
 - InnoSetup Script Writer
 - Pascal Code Writer 
 - ADX Music Mod
 - RemoveStrays Mod

#### Carlmundo
 - Pascal Code Writer
 - Lead Coder of BetterSADX and Tomb Raider AutoPatch, which some of the Pascal code in this project is based on
 - Special Thanks, for being a good friend
 
#### MainMemory
 - Sonic R Mod Loader Programmer
 - Special Thanks, without them this project couldn't exist
 
#### InvisibleUp
 - Saturn Style Colors Mod
 - EggRobo Texture Fix Mod
 - Widescreen support in the Sonic R Mod Loader
 - Special Thanks, for making some cool Sonic R mods

## Legal Junk
Sonic R Updater, along with it's source are provided without a license of any kind, and are distributed as-is. All resources included are used without permission.

The included game resources may be removed from the repository at a later date- replaced with a list of the intended resources in this readme instead. It's not decided if/when this will happen, but it may eventually.
