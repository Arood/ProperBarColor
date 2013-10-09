# ProperBarColor for Titanium Mobile

Inspired by this thread on Stack Overflow: http://stackoverflow.com/questions/18897485/achieving-bright-vivid-colors-for-an-ios-7-translucent-uinavigationbar

This module adds a layer to UINavigationBar, to make Ti.UI.Window.barColor look better with a translucent navbar in iOS7.

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

## API

### .layerOpacity = float

You can't get the 100% the same color as you specified in `Ti.UI.Window.barColor` without removing the transparency and blur beneath it. This property however, will let you play around with different opacities so you can fine-tune the result.

Default is 0.7

## Changelog

### 1.0

* First version

## Author

* Marcus Olovsson
* [marcusolovsson.com](http://marcusolovsson.com)
* [@Arood](http://twitter.com/Arood)