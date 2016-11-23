/*if (state == ESTATE_STAND)
{
    hspeed = 0;
    image_index = 0;
    
    if (waitDuration <= 0)
    {
        facing = -facing;
        state = ESTATE_WALK;
    }
}

if (state == ESTATE_WALK)
    hspeed = wolfSpeed;
*/

//////
// COLLISION
//////

var dx = cos(degtorad(direction));
var dy = -sin(degtorad(direction));

if (place_meeting(x, y + sprite_height, object_solid_jason))
{
    show_debug_message(string(id) + " - Moving to ground.");    

    x = xprevious;
    y = yprevious;
    
    gravity = 0;
    friction = 0;
        
    if (!place_meeting(x + dx, y + dy, object_solid_jason))
    {
        x += dx;
        y += dy;
    }
}

if (!place_meeting(x + sprite_width * facing, y + sprite_height, object_solid_jason))
{    
    state = ESTATE_STAND;
    
    x = xprevious;
    y = yprevious;
    
    hspeed = 0;
    image_index = 0;
}
else if (object_ninja_jason.y < y && (hurtDuration <= 0 && deathDuration <= 0))
{
    // update facing
    if (object_ninja_jason.x < x)
        facing = FACE_LEFT;
    else if (object_ninja_jason.x > x)
        facing = FACE_RIGHT;
        
    if (distance_to_point(object_ninja_jason.x, y) < AGGRO_DISTANCE)
    {
        state = ESTATE_WALK;
        
        move_towards_point(object_ninja_jason.x, y, WOLF_SPEED);
    }
}
else
{
    state = ESTATE_STAND;
    
    x = xprevious;
    
    hspeed = 0;
    image_index = 0;
}

//////
// DESTROY
//////

if (hurtDuration > 0)
{
    gravity = 0.55;
    friction = 0.55;
    state = ESTATE_HURT;
    
    show_debug_message(string(id) + " - HURT VSPEED: " + string(vspeed));
    show_debug_message(string(id) + " - HURT HSPEED: " + string(hspeed));
} 
else if (deathDuration > 0)
{
    gravity = 0.75;
    friction = 0.75;
    state = ESTATE_DEATH;
    
    image_alpha -= alphaOffset;
    
    if (deathDuration <= 1)
    death = true;
}
else
{
    gravity = 0;
    friction = 0;
    hostile = true;
}

if (death)
    instance_destroy();
