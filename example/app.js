// This is a test harness for your module
// You should do something interesting in this harness 
// to test out the module and to provide instructions 
// to users on how to use it by example.

//var ProperBarColor = require('com.mrcs.properbarcolor');

// open a single window
var ProperBarColor = require('com.mrcs.properbarcolor');
ProperBarColor.layerOpacity = 0.6;

var win = Ti.UI.createWindow({
	barColor: "#62D1A7",
	backgroundColor:'white',
  title: "Hello World",
  translucent: true,
  extendEdges: [Ti.UI.EXTEND_EDGE_BOTTOM, Ti.UI.EXTEND_EDGE_TOP],
  autoAdjustScrollViewInsets: true,
  orientationModes: [Ti.UI.PORTRAIT, Ti.UI.LANDSCAPE_LEFT, Ti.UI.LANDSCAPE_RIGHT]
});

var win1 = Titanium.UI.iOS.createNavigationWindow({
   window: win,
   tintColor: "#237757"
});

var tableview = Ti.UI.createTableView({
  data: [
    {title:"Lorem ipsum"},
    {title:"Lorem ipsum"},
    {title:"Lorem ipsum"},
    {title:"Lorem ipsum"},
    {title:"Lorem ipsum"},
    {title:"Lorem ipsum"},
    {title:"Lorem ipsum"},
    {title:"Lorem ipsum"},
    {title:"Lorem ipsum"},
    {title:"Lorem ipsum"},
    {title:"Lorem ipsum"},
    {title:"Lorem ipsum"},
    {title:"Lorem ipsum"},
    {title:"Lorem ipsum"},
    {title:"Lorem ipsum"},
    {title:"Lorem ipsum"},
    {title:"Lorem ipsum"},
    {title:"Lorem ipsum"}
  ]
});

tableview.addEventListener('click', function() {
  var newwin = Ti.UI.createWindow({
    barColor: "#62D1A7",
    title: "New window",
    extendEdges: [Ti.UI.EXTEND_EDGE_BOTTOM, Ti.UI.EXTEND_EDGE_TOP],
    backgroundColor:'white'
  });
  win1.openWindow(newwin);
})

win.add(tableview);
win1.open();

// TODO: write your module tests here

