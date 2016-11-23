if (isRestarting)
    room_restart();
if (isSlowDown)
    room_speed = 10;

//////
// TIMERS
//////

// update timer
attackCoolDown -= 1;
throwCoolDown -= 1;
attackDuration -= 1;
hurtDuration -= 1;
noHurtDuration -= 1;
deathDuration -= 1;

//limit timers
if (attackCoolDown <= 0)
    attackCoolDown = 0;
    
if (throwCoolDown <= 0)
    throwCoolDown = 0;
    
if (attackDuration <= 0)
    attackDuration = 0;

if (hurtDuration <= 0)
    hurtDuration = 0;

if (noHurtDuration <= 0)
    noHurtDuration = 0;
    
if (deathDuration <= 0)
    deathDuration = 0;

// blink after being hurt    
if (noHurtDuration > 0 && state != NSTATE_DEATH)
{
    if (noHurtDuration % 2.5 == 0)
        image_alpha = 0.5;
    else
        image_alpha = 0.85;
}
else
    image_alpha = 1;
    
//////
// SPEED LIMIT
//////

// vertical air speed when not attacking
if (!attacking)
{
    if (vspeed <= -MAX_AIR_VSPEED)
        vspeed = -MAX_AIR_VSPEED;
    else if (vspeed >= MAX_AIR_VSPEED)
        vspeed = MAX_AIR_VSPEED;
}

// horizontal air speed
if (state == NSTATE_FALL || state == NSTATE_JUMP || state == NSTATE_AATTACK)
{
    if (hspeed <= -MAX_AIR_HSPEED)
        hspeed = -MAX_AIR_HSPEED;
    else if (hspeed >= MAX_AIR_HSPEED)
        hspeed = MAX_AIR_HSPEED;
}

// horizontal ground speed
if (state == NSTATE_RUN || state == NSTATE_GATTACK)
{
    if (hspeed <= -MAX_RUNSPEED)
        hspeed = -MAX_RUNSPEED;
    else if (hspeed >= MAX_RUNSPEED)
        hspeed = MAX_RUNSPEED;
}

//////
// COLLISIONS
//////

// screen collision
if (x < sprite_width)
    x = sprite_width;
else if (x > room_width - sprite_width)
    x = room_width - sprite_width;
    
// hazard collision
colId = instance_place(x, y, object_hazard_jason);

// enemy collision
if (colId != noone && attacking && object_get_parent(colId.object_index) == object_enemy_jason && colId.hostile)
{
    with (colId)
    {
        // Wolf collision
        if (object_index == object_wolf_jason && hurtDuration <= 0)
        {
            hostile = false;
            
            if (other.state == NSTATE_AATTACK)
            {
                if (other.attacking)
                    enemyHealth -= NAATTACK_DAMAGE;
            }
            else if (other.state == NSTATE_GATTACK)
                enemyHealth -= NGATTACK_DAMAGE;
            
            vspeed = JUMP_DISTANCE / 2;
            hspeed = MAX_AIR_HSPEED * other.facing;
            
            show_debug_message(string(id) + " - VSPEED: " + string(vspeed));
            show_debug_message(string(id) + " - HSPEED: " + string(hspeed));
    
            audio_play_sound(sound_ninja_hit_1_jason, 0, false);
                
            if (enemyHealth <= 0)
            {
                score += 250;
                deathDuration = DEATH_DURATION * room_speed;
                
                // knife drop at 25%
                if (irandom_range(1, 4) % 4 == 0)
                    instance_create(x, y, object_collectible_knife_jason);
                
                // potion drop at 10%
                if (irandom_range(1, 10) % 10 == 0)
                    instance_create(x, y, object_collectible_potion_jason);
                    
                if (hasKey)
                    instance_create(x, y, object_key_jason);
            }
            else
            {
                hurtDuration = HURT_DURATION * room_speed;
                audio_play_sound(sound_wolf_death_1_jason, 0, false);
            }
        }
        
        // Panda collision
        if (object_index == object_panda_jason && hurtDuration <= 0)
        {
            hostile = false;
            
            if (other.state == NSTATE_AATTACK)
            {
                if (other.attacking)
                    enemyHealth -= NAATTACK_DAMAGE;
            }
            else if (other.state == NSTATE_GATTACK)
                enemyHealth -= NGATTACK_DAMAGE;
            
            vspeed = JUMP_DISTANCE / 2;
            hspeed = MAX_AIR_HSPEED * other.facing;
            
            show_debug_message(string(id) + " - VSPEED: " + string(vspeed));
            show_debug_message(string(id) + " - HSPEED: " + string(hspeed));
    
            audio_play_sound(sound_ninja_hit_1_jason, 0, false);
                
            if (enemyHealth <= 0)
            {
                score += 500;
                deathDuration = DEATH_DURATION * room_speed;
                
                // knife drop at 35%
                if (irandom_range(7, 20) % 20 == 0)
                    instance_create(x, y, object_collectible_knife_jason);
                
                // potion drop at 12.5%
                if (irandom_range(1, 8) % 8 == 0)
                    instance_create(x, y, object_collectible_potion_jason);
                
                if (hasKey)
                    instance_create(x, y, object_key_jason);
            }
            else
            {
                hurtDuration = HURT_DURATION * room_speed;
                audio_play_sound(soundDeath, 0, false);
            }
        }
        
        
    }
}

// spike collision
if (noHurtDuration == 0)
{
    if (place_meeting(x, y, object_hazard_jason) && colId.hostile)
    {
        health -= colId.damage;    
        instance_change(object_ninja_hurt_jason, true);
    }
}

// checkpoint collision
colId = instance_place(x, y, object_checkpoint_jason);

if (colId != noone && xPosCheckPrev != colId.x && yPosCheckPrev != colId.y)
{
    xPosCheckPrev = xPosCheck;
    yPosCheckPrev = yPosCheck;    

    xPosCheck = colId.x;
    yPosCheck = colId.y;
    
    audio_play_sound(sound_checkpoint_jason, 0, false);
}
