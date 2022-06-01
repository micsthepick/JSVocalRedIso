# JSVocalRedIso
This is a JSFX (JesuSonic Effect) that Implements the main algorithm in Audacity's VocalRedIso.ny, in realtime.  
It can isolate or attenuate the vocals (center panned audio) in a mix, and as such this effect works on stereo tracks only.

## Loading the effect:

### Reaper
Reaper supports JSFX natively, just copy vocalrediso.jsfx to `%AppData%\REAPER\Effects` (In a subfolder if preferred)

### VST compatible DAW (Instructions for windows)
JSFX can usually be run in a vst through [ReaPlugs by Cocos](https://www.reaper.fm/reaplugs/).  
Download and install ReaPlugs, and pay attention to where it installs.  
If you have Reaper installed, ReaPlugs should detect that `%AppData%\REAPER` exists and use that to load JSFX from %AppData%\REAPER\Effects instead of the local copy.
Otherwise, ReaPlugs will load effects from `...\ReaPlugs\JS` at the install location  
(My install is located at `C:\Program Files\VSTPlugins\ReaPlugs\JS`). If you want override the location to store JSFX, you should include a file called reajs.ini in the install folder for ReaPlugs, with the following contents:

    [ReaJS]
    rootpath=\path\to\custom\folder\JS

where \path\to\custom\folder\JS is the path to the JS folder that contains the ColorThemes, Data, Effects and presets folders that you would like ReaJs to use. (For example I run Equalizer APO and when reaper is installed, the audio service tries to load plugins from %AppData%\REAPER\Effects but is denied because of permissions)


## Using the effect:

- Vocal Reduction (Karaoke)  
set dry mix to 100%, and centre mix to -100% (subtract the center from the mix), and adjust the Low Cut untill drums/bass
instruments are still audible enough, without hearing too much vocals,
and adjust the high cut so that it is high enough that the vocals don't bleed through. This is better than the usual subtract one channel from the other approach, as the result is still a stereo signal.

- Vocal Isolation (Acapella)  
Set dry mix to 0%, and Center mix to -100% or 100%. Adjust low cut and high cut so that vocals sound good, but not to much other elements of the mix leak through 
(-100% can be used to make a seperate duplicate track that can be faded to blend between different modes).

- Fine tuning  
Adjust stregth and phase width (how close are the two signals to the same phase) at low cut and high cut to change how much each part of the center signal goes through over the spectrum.
"Attenuate if different volume" can sometimes help to reduce artifacts, expect there to be less in the center signal when this is set to 1. I have not done much fine tuning myself, so it helps to experiment to see what helps. Generally each individual track should have it's own fine tuning

- Messing with phase  
"Phase (degrees)" controls what pan in the stereo track the centre signal will be constructed from. 0 Means exaclty the centre, 45 means panned hard left, -45 means panned hard right.
sometimes setting the phase to 90 or -90 (and setting dry mix to 0) can isolate things that are not centre panned and can give a better seperation (e.g. for karaoke wen centre subtraction does not give good results), however it will also only give a mono signal in that case.  
If you set the phase to anything but 0, if dry mix is 0, to have a balanced output it is recommended to enable "undo rotation due to phase", unless you plan to combine the output of the plugin with the original input (compensating for the introduced delay)
Phase2 controls the phase offset between both channels, controlled by rotating the left phase by that many degrees. It usually doesn't lead to much good results, but it is left there in case it might be wanted.

### A word of caution
Some tracks are mixed in such a way that the results from this plugin will not be so sucessful.  
In that case it is best to go find a pre mixed version. You might get away with making an acapella version by aligning and subtracting an instrumental version with the original mix, or vice versa if you have the wrong version. There is a plugin that I've made to get better results with this, but with more artifacts: https://github.com/micsthepick/JSFFTDenoise

### Credits
Robert Haenggi for making the original vocalrediso.ny for Audacity, and Neil Bickford for making the Noise Reduction [effect](https://github.com/Nbickford/REAPERDenoiser) which helped me first make the effect, and finally Geraint Luff for the STFT template that I currently use: https://forum.cockos.com/showthread.php?t=225955
