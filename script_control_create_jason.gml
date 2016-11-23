// set globals
lives = 3;

globalvar knife;
global.knife = 3;

globalvar keyAssigned;
global.keyAssigned = false;

globalvar playerHasKey;
global.playerHasKey = false;

globalvar enemyList;
global.enemyList[] = 0;

backgroundAlpha = 1 / room_speed;
background_hspeed[0] = 0.25;

//timeClock = 5 * room_speed * 60;
timeClock = room_speed * 60 * 3;
textDelay = 3 * room_speed;

// set draw
draw_set_font(font_verdana_jason);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// create dynamic control
instance_create(room_width / 2, room_height, object_dynamic_camera_jason);

state = GSTATE_RUN;
results = false;
