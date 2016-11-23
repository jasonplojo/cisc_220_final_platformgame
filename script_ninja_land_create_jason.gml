if (hspeed == 0)
    state = NSTATE_STAND;
else
    state = NSTATE_RUN;

if (attacking)
{
    attackCoolDown = ATTACK_COOLDOWN / 2 * room_speed;
    hspeed = hspeed / 2;
    attackAir = true;
    
}
else
{
    attackCoolDown = 0;
    attackAir = false;
}
    
attackDuration = 0;

// set physics properties
gravity = 0;
gravity_direction = 0;
friction = 0.55;

audio_play_sound(sound_ninja_step_jason, 0, false);
