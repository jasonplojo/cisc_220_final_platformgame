//////
// TIMER
//////

waitDuration -= 1;
deathDuration -= 1;
hurtDuration -= 1;
if (preping)
    prepDuration -= 1;
else
    prepDuration = 0.25 * room_speed; 

if (waitDuration <= 0)
    waitDuration = 0;

if (deathDuration <= 0)
    deathDuration = 0;
    
if (hurtDuration <= 0)
    hurtDuration = 0;

if (prepDuration <= 0)
    prepDuration = 0;
