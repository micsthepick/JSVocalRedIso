# JSVocalRedIso
This is a JSFX (JesuSonic Effect) that Implements the main algorithm in Audacity's VocalRedIso.ny, in realtime.  
It can isolate or attenuate the vocals (center panned audio) in a mix, and as such this effect works on stereo tracks only.

## Loading the effect:

### Reaper
Reaper supports JSFX natively, just copy vocalrediso.jsfx to `%AppData%\REAPER\Effects` (In a subfolder if preferred)

### VST compatible DAW
JSFX can usually be run in a vst through [ReaPlugs by Cocos](https://www.reaper.fm/reaplugs/).  
Download and install ReaPlugs, and pay attention to where it installs.  
After it installs, copy vocalrediso.jsfx to somewhere in `...\ReaPlugs\JS` at the install location  
(My install is located at `C:\Program Files\VSTPlugins\ReaPlugs\JS`)


## Using the effect:

- Vocal Reduction (Karaoke)  
set dry mix to 100%, and centre mix to -100% (subtract the center from the mix), and adjust the Low Cut untill drums/bass
instruments are still audible enough, without hearing too much vocals,
and adjust the high cut so that it is high enough that the vocals don't bleed through

- Vocal Isolation (Acapella)  
Set dry mix to 0%, and Centre mix to -100% or 100%. Adjust low cut and high cut so that vocals sound good, but not to much other elements of the mix leak through 
(-100% can be used to make a seperate duplicate track that can be faded to blend between different modes).

### A word of caution
Some tracks are mixed in such a way that the results from this plugin will not be so sucessful.  
In that case it is best to go find a pre mixed version. You might get away with making an acapella version by aligning and subtracting an instrumental version with the original mix, or vice versa if you have the wrong version.

### Credits
Robert Haenggi for making the original vocalrediso.ny for Audacity, and Neil Bickford for making the Noise Reduction [effect](https://github.com/Nbickford/REAPERDenoiser) which I was able to base my code from to use the algorithm in realtime.
