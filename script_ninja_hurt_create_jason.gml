state = NSTATE_HURT;

attacking = false;
attackDuration = 0;
attackCoolDown = 0;
hurtDuration = HURT_DURATION * room_speed;
noHurtDuration = NO_HURT_DURATION * room_speed;
airDuration = 0;

// set physics properties
gravity = 0.45;
gravity_direction = 270;
friction = 0;

vspeed = JUMP_DISTANCE / 2;
hspeed = -MAX_AIR_HSPEED * facing / 2;

audio_play_sound(choose(sound_ninja_hurt_1_jason, sound_ninja_hurt_2_jason, sound_ninja_hurt_3_jason, sound_ninja_hurt_4_jason), 0, false);
