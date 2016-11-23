//////
// COLLISION
//////

var dx = cos(degtorad(direction));
var dy = -sin(degtorad(direction));

if (place_meeting(x, y + sprite_height, object_solid_jason))
{    
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

if (!place_meeting(x + sprite_width + 10 * facing, y + sprite_height, object_solid_jason))
{    
    state = ESTATE_STAND;
    attacking = false;
    
    x = xprevious;
    y = yprevious;
    
    hspeed = 0;
    friction = 0;
    image_index = 0;
}
else if (waitDuration > 0)
{
    state = ESTATE_STAND;
    x = xprevious;
    hspeed = 0;
}
else if (preping)
{
    state = ESTATE_PREP;
    hspeed = 0;
    
    x = xprevious;
    
    if (!audio_is_playing(soundPrep))
        audio_play_sound(soundPrep, 0, false);
    
    if (prepDuration <= 0)
    {
        preping = false;
        attacking = true;
        state = choose(ESTATE_PUNCH, ESTATE_KICK);
        image_index = 0;
    }
}
else if (attacking)
{
    hspeed = ATTACK_GSPEED * facing;
    x += hspeed;
    
    if (!audio_is_playing(soundAttack))
        audio_play_sound(soundAttack, 0, false);
    
    //if ((facing == FACE_LEFT && image_index <= 2) ^^ (facing == FACE_RIGHT && image_index >= image_number - 1))
    if (image_index >= image_number - 1)
    {  
        attacking = false;
        state = ESTATE_STAND;
        waitDuration = 2 * room_speed;
        image_index = 0;
    }
}
    
else if (object_ninja_jason.y < y + sprite_height && object_ninja_jason.y > y - sprite_height && (hurtDuration <= 0 && deathDuration <= 0))
{
    // update facing
    if (object_ninja_jason.x < x)
        facing = FACE_LEFT;
    else if (object_ninja_jason.x > x)
        facing = FACE_RIGHT;
      
    if (distance_to_point(object_ninja_jason.x, y) <= ATTACK_RANGE)
        preping = true;
        
    else if (distance_to_point(object_ninja_jason.x, y) < AGGRO_DISTANCE)
    {
        state = ESTATE_WALK;
        
        move_towards_point(object_ninja_jason.x, y, WOLF_SPEED / 2);
    }
}
else
{
    state = ESTATE_STAND;
    attacking = false;
    
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
    attacking = false;
    waitDuration = 0.55 * room_speed;
} 
else if (deathDuration > 0)
{
    gravity = 0.75;
    friction = 0.75;
    state = ESTATE_DEATH;
    attacking = false;
    
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
