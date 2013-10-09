var ProperBarColor = require('com.mrcs.properbarcolor');
ProperBarColor.layerOpacity = 0.7;

var tabGroup = Titanium.UI.createTabGroup({
  barStyle: ProperBarColor.DARK
});

var win1 = Ti.UI.createWindow({
	barColor: "#62D1A7",
  tintColor: "#237757",
	backgroundColor: "#FFFFFF",
  title: "Hello World",
  extendEdges: [Ti.UI.EXTEND_EDGE_BOTTOM, Ti.UI.EXTEND_EDGE_TOP],
  autoAdjustScrollViewInsets: true,
  orientationModes: [Ti.UI.PORTRAIT, Ti.UI.LANDSCAPE_LEFT, Ti.UI.LANDSCAPE_RIGHT]
});

var tab1 = Titanium.UI.createTab({  
    icon:'KS_nav_views.png',
    title:'Tab 1',
    window:win1
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

win1.add(tableview);


var win2 = Ti.UI.createWindow({
  barColor: "#62D1A7",
  tintColor: "#237757",
  backgroundColor: "#FFFFFF",
  title: "Hello World",
  extendEdges: [Ti.UI.EXTEND_EDGE_BOTTOM, Ti.UI.EXTEND_EDGE_TOP],
  autoAdjustScrollViewInsets: true,
  orientationModes: [Ti.UI.PORTRAIT, Ti.UI.LANDSCAPE_LEFT, Ti.UI.LANDSCAPE_RIGHT]
});

var tab2 = Titanium.UI.createTab({  
    icon:'KS_nav_views.png',
    title:'Tab 2',
    window:win2
});


tabGroup.addTab(tab1);  
tabGroup.addTab(tab2);  

// open tab group
tabGroup.open();
