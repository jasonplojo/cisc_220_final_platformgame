if (health <= 0)
    instance_change(object_ninja_death_jason, true);

if (hurtDuration == 0)
    instance_change(object_ninja_air_jason, true);
    
//////
// COLLISIONS
//////

var dx = cos(degtorad(direction));
var dy = -sin(degtorad(direction));

// Against solid
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
} // Against solid
