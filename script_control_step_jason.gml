// timer update
if (state == GSTATE_RUN && object_dynamic_camera_jason.activeCamera)
    timeClock -= 1;

if (state == GSTATE_WIN || state == GSTATE_LOSE)
    textDelay -= 1;

// limit timer
if (timeClock <= 0)
    timeClock = 0;
    
if (textDelay <= 0)
    textDelay = 0;

// limit health
if (health > 100)
    health = 100;
else if (health < 0)
    health = 0;  
    
// limit score
if (score <= 0)
    score = 0;
    
// limit knives
if (global.knife >= 5)
    global.knife = 5;

if (instance_exists(object_ninja_jason))
{
    if (health <= 0 && object_ninja_jason.deathDuration <= 1)
    {
        lives -= 1;
        score -= 500;
    }
    
    if (object_dynamic_camera_jason.y < 2000)
    {
        background_visible[0] = true;
        background_alpha[0] += backgroundAlpha;
        
        /*
        if (instance_exists(object_wolf_jason))
            with(object_wolf_jason)
                wolfSpeed = WOLF_SPEED * 3 * facing;
        */
        
        /*
        if (!audio_is_playing(music_stage_2_jason) && object_ninja_jason.y < 2000 && state == GSTATE_RUN)
        {
            audio_stop_sound(music_stage_1_jason);
            audio_play_sound(music_stage_2_jason, 0, true);
            audio_sound_gain(music_stage_2_jason, 0.3, 0);
        }
        */
    }
    else
    {
        background_alpha[0] -= backgroundAlpha;
        
        /*
        if (instance_exists(object_wolf_jason))
            with(object_wolf_jason)
                wolfSpeed = WOLF_SPEED * facing;
        */
    }
}

if (global.playerHasKey && !audio_is_playing(music_stage_2_jason) && state == GSTATE_RUN)
{
    audio_stop_sound(music_stage_1_jason);
    audio_play_sound(music_stage_2_jason, 0, true);
    audio_sound_gain(music_stage_2_jason, 0.3, 0);
}

if (background_alpha[0] <= 0)
    background_alpha[0] = 0;
else if (background_alpha[0] >= 0.5)
    background_alpha[0] = 0.5;

if (textDelay <= 0)
{
    state = GSTATE_HIGHSCORE;
    textDelay = 100;
    timeClock = 1;
    
    // check to see if score made it to leaderboards
    var lowestScore = highscore_value(1);
    
    for (i = 1; i <= 10; i++)
    {
        if (lowestScore > highscore_value(i))
            lowestScore = highscore_value(i);
    }
    
    if (lowestScore < score)
    {
        var highScoreName = get_string("Congratulations! You made it to the leaderboards!", "Enter your name.");
        highscore_add(highScoreName, score);
    }
    
    instance_create(x, y, object_menu_game_jason);
}

// win logic
if (state == GSTATE_WIN)
{
    if (!audio_is_playing(music_stage_win_jason))
    {
        audio_stop_all();
        audio_play_sound(music_stage_win_jason, 0, true);
        audio_sound_gain(music_stage_win_jason, 0.3, true);
    }
}

// lose logic
if ((lives <= 0 && !results) || timeClock <= 0)
{
    state = GSTATE_LOSE;
    results = true;
    
    if (!audio_is_playing(music_stage_lose_jason))
    {
        audio_stop_all();
        audio_play_sound(music_stage_lose_jason, 0, true);
        audio_sound_gain(music_stage_lose_jason, 0.3, 0);
    }
}
