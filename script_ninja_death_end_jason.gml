noHurtDuration = NO_HURT_DURATION;

if (deathDuration <= 0 && lives > 0)
{
    x = xPosCheck;
    y = yPosCheck - 30;
    speed = 0;

    instance_change(object_ninja_jason, true);
}
else if (deathDuration <= 0 && lives <= 0)
    instance_destroy();
    
//////
// COLLISIONS
//////

var dx = cos(degtorad(direction));
var dy = -sin(degtorad(direction));

// Against solids
if (place_meeting(x + hspeed, y + vspeed, object_solid_jason))
{   
    x = xprevious;
    y = yprevious;
    
    if (place_meeting(x, y + vspeed, object_solid_jason))
        vspeed = 0;

    if (place_meeting(x + hspeed, y, object_solid_jason))
        hspeed = 0;
    
    while(!place_meeting(x + dx, y + dy, object_solid_jason))
    {
        x += dx;
        y += dy;
    }
} // Against solids
