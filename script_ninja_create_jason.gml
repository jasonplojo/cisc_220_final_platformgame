facing = FACE_RIGHT;
attacking = false;
throwing = false;

goalReached = false;
attackAir = false;
colId = noone;

// timers
attackCoolDown = 0;
throwCoolDown = 0;
attackDuration = 0;
hurtDuration = 0;
noHurtDuration = 0;
deathDuration = 0;
airDuration = 0;
dAirDuration = 0;

// initialize quantity
health = 100;

// initialize sound
soundJump[0] = sound_ninja_jump_1_jason;
soundJump[1] = sound_ninja_jump_2_jason;
soundJump[2] = sound_ninja_jump_3_jason;
soundJump[3] = sound_ninja_jump_4_jason;
soundJump[4] = sound_ninja_jump_5_jason;

// keyboard checks
isMoveLeft = false;
isMoveRight = false;
isJumping = false;
isFalling = false;
isAttacking = false;
isThrowing = false;
isRestarting = false;
isSlowDown = false;

// checkpoint location
xPosCheck = x;
yPosCheck = y;
xPosCheckPrev = x;
yPosCheckPrev = y;
instance_change(object_ninja_air_jason, true);
