# Introduction #

Based on the early AAR work I was doing, I started playing with a system that could record and play back all activity during a mission.  This is the current prototype of that work.

Couple of Notes:
  * Only one player (or HC or server) needs to run this.
  * It's currently favoured towards West.
  * Only supports Altis out of the box, but you can probably see how to add in other maps, once you look at the code.
  * I wrote this as a prototype idea...

# Details #

**Current Downloads**

Latest files are available [here](https://drive.google.com/folderview?id=0B3w2Hwg2Q0mXSW91cFMzdk5XOVk&usp=sharing).

The Map Tiles are a separate download, as they will likely be updated at separate times to everything else.  Thanks to Marty and Sly for doing the tiling and location work.

## Instructions ##

### Addon ###

The addon should be installed as per any other addon.  Note that it shares the same userconfig file as the axy-aar addon.  This userconfig needs to be located under the base directory of your ArmA 3 install.  (i.e. same as other userconfigs for other addons)

The only parameter read from the userconfig is the AXY\_AAR\_Extension\_AAR\_Folder setting.  This will be where the Addon/Extension saves the raw file.  The directory needs to exist.

### Report Generator ###

The Report Generator is a Delphi Windows program that reads the saved raw aar file and generates a set of Javascript Object files (JSON) that are each a snapshot of your recorded mission.

Once you've generated a set of files (by default, these are written out to your working directory...which is probably where you're running the executable from), then copy all files to a subdirectory of the missions folder of the web server.

### Web Site ###

The WebView.zip file contains the basic structure of the web directories required.  There's no server side code (i.e. no PHP or .net) but you do need to run these files via a web server.  Just opening them in a browser direct from your computer **will not work**.

To get setup (and for your first report):
  1. Extract the zip to a subdirectory of your website called aar.
  1. Extract the AltisTiles archive to the ./maps/altis/tiles directory on the website.
  1. Create a new directory under the ./missions folder with the unique name of your mission.  For example _squadNight20140302_ .
  1. Copy all of the json files created by the Report Generator to that mission folder.
  1. The URL to view the mission needs to include the mission name, with the _mission_ parameter.  For example _http://www.mycoolwebsite/aar/index.html?mission=squadNight20140302_