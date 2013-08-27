//Chris Beacham Slate Config

// Configs
S.cfga({
  "defaultToCurrentScreen" : true,
  "secondsBetweenRepeat" : 0.1,
  "checkDefaultsOnLoad" : true,
  "focusCheckWidthMax" : 3000
});

// Displays
var cinemaDisplay = "1";
var lapDisplay = "2880x1880";
var auxDisplay = "2";
var dellDisplay = "3";
// Common Placements
halfX = {"x": "screenOriginX + screenSizeX/2"};

// Laptop Config
var lapLeft = slate.operation("move", {
  "screen": lapDisplay,
  "x": "screenOriginX",
  "y": "screenOriginY",
  "width": "screenSizeX/2",
  "height": "screenSizeY"
});

var lapRight = lapLeft.dup(halfX);

var lapBottomLeft = slate.operation("corner", {
  "screen": lapDisplay,
  "direction": "bottom-left",
  "width": "screenSizeX/2",
  "height": "screenSizeY/2"
});

// Two Monitor Config
var auxLeft = slate.operation("move", {
  "screen": auxDisplay,
  "x": "screenOriginX",
  "y": "screenOriginY",
  "width": "screenSizeX/2",
  "height": "screenSizeY"
});

var cinemaLeft = auxLeft.dup({"screen": cinemaDisplay});
var cinemaRight = slate.operation("move", {
  "screen": cinemaDisplay,
  "x": "screenSizeX/2",
  "y": "screenOriginY",
  "width": "screenSizeX/2",
  "height": "screenSizeY"
});

var dellTop = slate.operation("move", {
  "screen": dellDisplay,
  "x": "screenOriginX",
  "y": "screenOriginY",
  "width": "screenSizeX",
  "height": "screenSizeY/2"
});
var cinemaFull = slate.operation("move", {
  "screen": cinemaDisplay,
  "x": "screenOriginX",
  "y": "screenOriginY",
  "width": "screenSizeX",
  "height": "screenSizeY"
});

var cinema310 = slate.operation("move", {
  "screen": cinemaDisplay,
  "x": "screenSizeX*(3.0/10)",
  "y": "screenOriginY",
  "width": "screenSizeX * (7.0/10)",
  "height": "screenSizeY"
});


var auxTopRight = slate.operation("corner", {
  "screen": auxDisplay,
  "direction": "top-right",
  "width": "screenSizeX/2",
  "height": "screenSizeY/2"
});

var auxRight = auxLeft.dup(halfX);

var auxBottomRight = auxTopRight.dup({"direction": "bottom-right"});
var auxBottomLeft = auxTopRight.dup({"direction": "bottom-left"});

var dellBottomRight = auxBottomRight.dup({"screen": dellDisplay});
var dellBottomLeft = auxBottomLeft.dup({"screen": dellDisplay});

var cinemaTopLeft = slate.operation("corner", {
  "screen": cinemaDisplay,
  "direction": "top-left",
  "width": "screenSizeX/2",
  "height": "screenSizeY/2"
});

var cinemaBottomLeft = cinemaTopLeft.dup({"direction": "bottom-left"});

var twoMonitorLayout = slate.layout("twoMonitors", {
  //Hipchat
  //Safari
  //Terminal
  //sublime Text

  "Sublime Text": {
    "operations": [cinemaRight],
    "ignore-fail": true,
    "repeat-last": true
  },  //mail
  "Safari": {
    "operations": [cinemaTopLeft],
    "ignore-fail": true,
    "repeat-last": true
  },
  "Chrome": {
    "operations": [cinemaTopLeft],
    "ignore-fail": true,
    "repeat-last": true
  },
  "HipChat": {
    "operations": [auxLeft],
    "ignore-fail": true,
    "repeat-last": true
  },
  "Mail": {
    "operations": [auxRight],
    "ignore-fail": true,
    "repeat-last": true
  },
  "iTerm": {
    "operations": [cinemaBottomLeft],
    "ignore-fail": true,
    "repeat-last": true
  }
});


var threeMonitorLayout = slate.layout("threeMonitors", {

"Sublime Text": {
    "operations": [cinemaFull],
    "ignore-fail": true,
    "repeat-last": true
  },  //mail
  "Safari": {
    "operations": [dellTop],
    "ignore-fail": true,
    "repeat-last": true
  },
  "Chrome": {
    "operations": [dellTop],
    "ignore-fail": true,
    "repeat-last": true
  },
  "HipChat": {
    "operations": [auxLeft],
    "ignore-fail": true,
    "repeat-last": true
  },
  "Mail": {
    "operations": [auxRight],
    "ignore-fail": true,
    "repeat-last": true
  },
  "iTerm": {
    "operations": [dellBottomLeft],
    "ignore-fail": true,
    "repeat-last": true
  },
  "Terminal": {
    "operations": [dellBottomRight],
    "ignore-fail": true,
    "repeat-last": true
  }








});
var fullscreen = slate.operation("move", {

  "x": "screenOriginX",
  "y": "screenOriginY",
  "width": "screenSizeX",
  "height": "screenSizeY"
});

// Detect monitor setup
slate.default(2, twoMonitorLayout);


var twoMonitor = slate.operation('layout', {"name": twoMonitorLayout});
var threeMonitor = slate.operation('layout', {"name": threeMonitorLayout});
var universalLayout = function() {

  threeMonitor.run();

};

config_created_snap_name = "config_snap"

var takesnap = slate.operation("snapshot", {
  "name" : config_created_snap_name,
  "save" : true,
  "stack" : false
});

var activatesnap = slate.operation("activate-snapshot", {
  "name" : config_created_snap_name,
  "delete" : false
});

S.bnda({
  "1:ctrl": universalLayout,
  "2:ctrl": fullscreen,
  "3:ctrl": activatesnap,
  "3:ctrl;shift": takesnap,
  "`:ctrl": S.op("hint")
});