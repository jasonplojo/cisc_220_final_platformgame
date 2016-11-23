//////
// COLLISIONS
//////

// Against Solid Objects
if (place_meeting(x + hspeed, y + vspeed, object_solid_jason))
{
    var dx = cos(degtorad(direction));
    var dy = -sin(degtorad(direction));
    
    x = xprevious;
    y = yprevious;
    
    while(!place_meeting(x + dx, y + dy, object_solid_jason))
    {
        x += dx;
        y += dy;
    }
    
    instance_change(object_ninja_land_jason, true);
} // Against Solid Objects

// set states
if (vspeed > 0)
    state = NSTATE_FALL;
