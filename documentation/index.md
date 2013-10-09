# ProperBarColor for Titanium Mobile

Inspired by this thread on Stack Overflow: http://stackoverflow.com/questions/18897485/achieving-bright-vivid-colors-for-an-ios-7-translucent-uinavigationbar

This module adds a layer to UINavigationBar, to make `Ti.UI.Window.barColor` look better with a translucent navbar in iOS7. It also adds an option to `Ti.UI.TabGroup` to change its style to better fit dark backgrounds.

## Download

You can download a pre-compiled package here:

* [com.mrcs.properbarcolor-iphone-1.0.zip](http://marcusolovsson.com/com.mrcs.properbarcolor-iphone-1.0.zip)

## Usage

Simply include the module to your project and it will automatically inject itself into Titanium windows:

### tiapp.xml

    <modules>
      <module platform="iphone">com.mrcs.properbarcolor</module> 
    </modules>

### app.js

    if (Ti.Platform.osname == "iphone") {
      var ProperBarColor = require("com.mrcs.properbarcolor");
    }

### Changing TabGroup-background

    var tabGroup = Ti.UI.createTabGroup({
      barStyle: ProperBarColor.DARK
    });

## API

### .layerOpacity = float

You can't get the 100% the same color as you specified in `Ti.UI.Window.barColor` without removing the transparency and blur beneath it. This property however, will let you play around with different opacities so you can fine-tune the result.

Note that you have to set this before creating your window.

Default is 0.7

Example:

    var ProperBarColor = require('com.mrcs.properbarcolor');
    ProperBarColor.layerOpacity = 0.5;

    var win = Ti.UI.createWindow({
      barColor: "#62D1A7",
      backgroundColor: "#FFFFFF",
      title: "Hello World"
    });

### .DARK

Used for `Ti.UI.TabGroup.barStyle`

### .DEFAULT

Used for `Ti.UI.TabGroup.barStyle`

## Changelog

### 1.0

* First version

## Author

* Marcus Olovsson
* [marcusolovsson.com](http://marcusolovsson.com)
* [@Arood](http://twitter.com/Arood)