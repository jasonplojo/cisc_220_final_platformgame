//////
// MOVEMENT
//////

//update ninja state
if (vspeed > 0)
    state = NSTATE_FALL;
if (vspeed >= MAX_AIR_VSPEED && state == NSTATE_FALL)
    airDuration += 1;

if (isThrowing && global.knife > 0 && throwCoolDown <= 0 & !attacking)
{
    state = NSTATE_THROW;
    throwCoolDown = THROW_COOLDOWN * room_speed;
    throwing = true;
    
    global.knife -= 1;
    
    instance_create(x + 10 * facing, y - 8, object_knife_jason);
    audio_play_sound(sound_knife_throw_jason, 0, false);
}
    
if (isAttacking && attackCoolDown == 0 && attackDuration == 0)
{
    attacking = true;
    attackDuration = ATTACK_AIR_DURATION * room_speed;
    
    audio_play_sound(choose(sound_ninja_attack_1_jason, sound_ninja_attack_2_jason, sound_ninja_attack_3_jason, sound_ninja_attack_4_jason), 0, false);
}
    
// response to player input
if (attacking)
{
    state = NSTATE_AATTACK;    

    if (facing == FACE_LEFT)
        direction = 200;
    else if (facing == FACE_RIGHT)
        direction = 290;
        
    // set to attacking speed
    hspeed = ATTACK_HAIRSPEED * facing;
    vspeed = ATTACK_VAIRSPEED;
    
    if (attackDuration == 0)
    {
        attacking = false;
        attackCoolDown = ATTACK_AIR_COOLDOWN * room_speed;
    }
}
else if (throwing)
{
    if (throwCoolDown <= 0)
    {
        throwing = false;
        image_index = 0;
    }
}
else
{
    if (isMoveLeft)
    {
        facing = FACE_LEFT;
        
        if(!place_meeting(x + facing, y, object_solid_jason))
            hspeed -= AIR_SPEED;
    }
    
    if (isMoveRight)
    {
        facing = FACE_RIGHT;
        
        if(!place_meeting(x + facing, y, object_solid_jason))
            hspeed += AIR_SPEED;
    }
        
    if (isFalling)
    {
        gravity = 1;
        
        instance_change(object_ninja_air_jason, true);
    }
}// response to player input

//////
// COLLISIONS
//////

var dx = cos(degtorad(direction));
var dy = -sin(degtorad(direction));
    
// ** Against solid **

// moving towards solid
if (place_meeting(x + hspeed, y + vspeed, object_solid_jason))
{   
    x = xprevious;
    y = yprevious;

    if (state == NSTATE_AATTACK)
        state = NSTATE_FALL;
     
    if (place_meeting(x, y + vspeed, object_solid_jason))
        vspeed = 0;

    if (place_meeting(x + hspeed, y, object_solid_jason))
        hspeed = 0;
        
    while(!place_meeting(x + dx, y + dy, object_solid_jason))
    {
        x += dx;
        y += dy;
    }
}

// when on solid
if (place_meeting(x, y + 1, object_solid_jason))
{
    // fall damage logic
    if (airDuration >= AIR_DURATION * room_speed)
    {
        health -= airDuration / 2;
        
        vspeed = JUMP_DISTANCE / 2;
        hspeed = -MAX_AIR_HSPEED * facing / 2;
        
        if (health <= 0)
            instance_change(object_ninja_death_jason, true);
        else
            instance_change(object_ninja_hurt_jason, true);
    }
    else
        instance_change(object_ninja_land_jason, true);
}
// ** Against solid **

if (place_meeting(x + hspeed, y + vspeed, object_slope_jason))
{
    x = xprevious;
    y = yprevious;
    
    while(!place_meeting(x + dx, y + dy, object_slope_jason))
    {
        x += dx;
        y += dy;
    }
    
    instance_change(object_ninja_land_jason, true);
}
