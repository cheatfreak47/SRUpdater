## Sonic R Updater
![Image of SRUpdater](https://raw.githubusercontent.com/cheatfreak47/SRUpdater/master/repo.png)

Sonic R Updater is an in-development patch for the 1998 port of Sonic R.
This patch will update the game to the much more friendly 2004 port, with the [Sonic R Mod Loader](https://github.com/sonicretro/sonicr-mod-loader/releases) included, along with a couple of small fix mods; ADX Music and RemoveStrays.

## Usage

1. Install Sonic R (1998) from your retail disc or an ISO image on your PC wherever you'd like. (I reccommend `C:\Program Files (x86)\Sega\SonicR`, personally.)
2. Do not install DirectX 6 when prompted, and ignore any errors that apper after the installation completes from it trying to open the 1998 game.
3. Download the latest Sonic R Updater and run it.
4. It should auto-detect the installed location of Sonic R, simply click next or browse to the correct location in the event that it was unable to find the correct path.
5. Proceed with the installation. Leave the box checked if you'd like to get familiar with the Sonic R Mod Manager right away.
6. Shortcuts to Sonic R, Sonic R Mod Manager, Sonic R Uninstaller, and Sonic R Manual are all added to your Windows Start Menu, use the shortcuts there to play the game.

### Uninstallation

What's that? You don't like this patch? (I can't imagine why you wouldn't...)
Well, to remove it, just uninstall Sonic R normally with the provided shortcut, and then navigate to the installation folder and delete any remaining files, except for the `save` and `ghost` folders. Note that this will remove any mods that remain.

### Credits	
#### CheatFreak
 - Project Lead Planner, Designer, and Coder
 - ADX Music Mod
 - RemoveStrays Mod

#### Carlmundo
 - Help with misc. Pascal code
 - Lead Coder of BetterSADX and Tomb Raider AutoPatch, which some of the pascal code in this project is based on
 
#### MainMemory
 - Sonic R Mod Loader Programmer
 - Special Thanks, without them this project wouldn't exist

### F.A.Q.
**Q:** Is this speedrun legal?

**A:** Not officially... [yet...](https://www.speedrun.com/Sonic_R/thread/zc91h) ...but technically it _should be._ Neither ADX Music or RemoveStrays are code based mods, and thus have no effect on how the game performs or behaves in anyway outside of extremely minor cosmetic differences in UI and Audio Quality. The only changes to the game made by Sonic R Mod Loader are also purely cosmetic, save for fixing a bug that caused terrible framerates on any modern Windows OS, which I think should get a pass for making the game behave like it's supposed to, and the cause is the OS, not the game.


**Q:** 2004 port? Why haven't I heard of this before?

**A:** It's just really obscure and quite rare, only being released in limitied quantities in the UK and Australia (to our current knowledge, at least) and with the boxes not even labeled accordingly, that makes tracking copies down rather difficult.


**Q:** How 2 Compile?

**A:** Clone the repository, fill in any of the missing files with the ones from the 2004 port (not needed as of yet, but might be if someone complains) and install the two dependencies. Those being the latest Inno Setup and Inno Download Plugin. Inno Script Studio reccommended. Compile the Sonic R Updater ISS script and you're golden, probably.

### Legal Junk
Sonic R Updater, along with it's source are provided without a license of any kind, and are distributed as-is. All resources included are used without permission.

Many of the included resources will be removed from the repository- replaced with a list of the intended resources in this readme at a later date once the project is ready for public release.