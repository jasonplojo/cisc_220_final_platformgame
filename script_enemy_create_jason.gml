facing = FACE_RIGHT;
state = ESTATE_AIR;
attacking = false;
preping = false;
hasKey = false;

enemyHealth = 0;
enemyTotalHealth = enemyHealth;
death = false;

gravity = 0.45;
gravity_direction = 270;
friction = 0;

waitDuration = 0;
deathDuration = 0;
hurtDuration = 0;
prepDuration = 0.25 * room_speed;
alphaOffset = 1 / (DEATH_DURATION * room_speed / 2);
