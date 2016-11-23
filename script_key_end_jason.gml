if (place_meeting(x, y, object_ninja_jason) && collectTimer <= 0)
{
    global.playerHasKey = true;
    
    audio_play_sound(sound_knife_collect_jason, 0, false);
    instance_destroy();
}

//////
// COLLISION
//////
var dx = cos(degtorad(direction));
var dy = -sin(degtorad(direction));

if (place_meeting(x, y + vspeed, object_solid_jason))
{
    x = xprevious;
    y = yprevious;
    
    speed = 0;
    
    if (!place_meeting(x + dx, y + dy + 25, object_solid_jason))
    {
        x += dx;
        y += dy;
    }
}
