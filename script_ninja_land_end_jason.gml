//////
// MOVEMENT
//////

// update ninja state
if (NSTATE_RUN && hspeed == 0 && !attacking & !throwing)
{
    state = NSTATE_STAND;
    image_index = 0;
}

if (isThrowing && global.knife > 0 && throwCoolDown <= 0 && !attacking)
{
    state = NSTATE_THROW;
    throwCoolDown = THROW_COOLDOWN * room_speed;
    throwing = true;
    
    global.knife -= 1;
    
    instance_create(x + 10 * facing, y - 8, object_knife_jason);
    audio_play_sound(sound_knife_throw_jason, 0, false);
}

if (isAttacking && attackCoolDown == 0)
{   
    state = NSTATE_GATTACK;
    
    attacking = true;
    attackCoolDown = ATTACK_COOLDOWN * room_speed;
    
    image_index = 1;
    
    audio_play_sound(choose(sound_ninja_attack_1_jason, sound_ninja_attack_2_jason, sound_ninja_attack_3_jason, sound_ninja_attack_4_jason), 0, false);
}

// response to player input
if (attacking)
{
    
    if (attackAir)
    {
        attackAir = false;
        attacking = false;
        noHurtDuration = 0.15 * room_speed;
    }
        
    // maintain speed when attacking
    hspeed = ATTACK_GSPEED * facing;
    
    if ((facing == FACE_LEFT && image_index < 1) ^^ (facing == FACE_RIGHT && image_index >= image_number - 1))
    {  
        attacking = false;
        noHurtDuration = 0.15 * room_speed;
        state = NSTATE_RUN;
        image_index = 0;
    }
    
    if (isJumping)
    {
        attacking = false;
        attackCoolDown = 0;
        
        hspeed = MAX_AIR_HSPEED * facing;
        vspeed = JUMP_DISTANCE;
        
        audio_play_sound(soundJump[irandom_range(0, 4)], 0, false);
        instance_change(object_ninja_air_jason, true);
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
        {
            state = NSTATE_RUN;
            hspeed -= RUN_SPEED;
        }
    }
    
    if (isMoveRight)
    {
        facing = FACE_RIGHT;
        
        if(!place_meeting(x + facing, y, object_solid_jason))
        {
            state = NSTATE_RUN;
            hspeed += RUN_SPEED;
        }
    }
    
    if (isJumping)
    {
        vspeed = JUMP_DISTANCE;
        audio_play_sound(choose(sound_ninja_jump_1_jason, sound_ninja_jump_2_jason, sound_ninja_jump_3_jason, sound_ninja_jump_4_jason, sound_ninja_jump_5_jason), 0, false);
        instance_change(object_ninja_air_jason, true);
    }
}// response to player input

//////
// COLLISIONS
//////

var dx = cos(degtorad(direction));
var dy = -sin(degtorad(direction));

// Against solid
if (!place_meeting(x, y + 1, object_solid_jason))
{
    attacking = false;
    x += hspeed;
    
    instance_change(object_ninja_air_jason, true);
}

if (place_meeting(x + hspeed, y + vspeed, object_platform_jason))
{   
    x = xprevious;
    y = yprevious;
    
    if (place_meeting(x, y + vspeed, object_platform_jason))
        vspeed = 0;

    if (place_meeting(x + hspeed, y, object_platform_jason))
        hspeed = 0;
    
    while(!place_meeting(x + dx, y + dy, object_platform_jason))
    {
        x += dx;
        y += dy;
    }
} // Against solid

var i = 0;

// Against slope
if (place_meeting(x, y + 1, object_slope_jason))
{
    y += -speed;
    
    while (i < 100)
    {
        if (!place_meeting(x + dx, y + dy, object_slope_jason))
        {
            x += dx;
            y += dy;
        }
    }
}
