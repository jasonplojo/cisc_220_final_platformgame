if (place_meeting(x, y, object_ninja_jason) && global.playerHasKey && state == CSTATE_CLOSED)
{
    state = CSTATE_OPEN;
    
    score += 1000;
    score += lives * 500;
    object_control_jason.state = GSTATE_WIN;
}
