//////
// UPPER LEFT HUD
//////

if (object_dynamic_camera_jason.activeCamera)
{
    // Health bar
    draw_rectangle_color(view_xview[1] + 18, view_yview[1] + 18, view_xview[1] + 122, view_yview[1] + 42, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
    draw_healthbar(view_xview[1] + 20, view_yview[1] + 20, view_xview[1] + 120, view_yview[1] + 40, health, c_red, c_olive, c_olive, 0, true, false);
    
    // lives
    for (var i = 0; i < lives; i++)
        draw_sprite_ext(sprite_ninja_stand_jason, 0, view_xview[1] + 30 + (i * 25), view_yview[1] + 60, 0.50, 0.50, 0, c_white, 1);
    
    for (var i = 2; i >= lives; i--)
        draw_sprite_ext(sprite_ninja_death_jason, 0, view_xview[1] + 30 + (i * 25), view_yview[1] + 65, 0.50, 0.50, 0, c_white, 1);
    
    // score
    var formatScore = string_format(score, 6, 0);
    var drawScore = string_replace_all(formatScore, " ", "0");
    
    draw_set_halign(fa_left);
    script_execute(script_tool_text_outline_jason, view_xview[1] + 18, view_yview[1] + 75, 1, c_white, drawScore);
    
    //////
    // LOWER LEFT HUD
    //////
    
    // knife
    for (var i = 0; i < global.knife; i++)
        draw_sprite_ext(sprite_knife_jason, 0, view_xview[1] + 30 + (i * 30), view_yview[1] + 430, 1, 1, 0, c_white, 1);
        
    
    //////
    // UPPER RIGHT HUD
    //////
    
    // timer
    var minutes = (timeClock / room_speed) / 60;
    var seconds = round((timeClock / room_speed) % 60);
    // var milliseconds = ((timeClock / room_speed) / 1000) % 1000;
    
    if (seconds >= 60)
        seconds = 59;
    
    if (minutes <= 0)
        minutes = 0;
    
    var formatMinutes = string_format(minutes - 0.5, 2, 0);
    var formatSeconds = string_format(seconds, 2, 0);
    // var formatMilliseconds = string_format(milliseconds - 0.5, 2, 0);
    
    var formatTime = formatMinutes + ":" + formatSeconds;
    var drawTime = string_replace_all(formatTime, " ", "0");
    
    draw_set_halign(fa_right);
    script_execute(script_tool_text_outline_jason, view_xview[1] + 780, view_yview[1] + 20, 1, c_white, drawTime);
}

    //////
    // LOWER RIGHT HUD
    //////
    
    if (global.playerHasKey)
        draw_sprite_ext(sprite_key_jason, -1, view_xview[1] + 780, view_yview[1] + 430, 1, 1, 0, c_white, 1);

//////
// GAME LOGIC
//////

if (state == GSTATE_WIN && textDelay > 0)
{
    draw_set_halign(fa_center);
    script_execute(script_tool_text_outline_jason, view_xview[1] + 400, view_yview[1] + 225, 1, c_white, "Stage Clear!");
}
if (state == GSTATE_LOSE && textDelay > 0)
{
    draw_set_halign(fa_center);
    script_execute(script_tool_text_outline_jason, view_xview[1] + 400, view_yview[1] + 225, 1, c_white, "Game Over");
}

if (state == GSTATE_HIGHSCORE)
{
    // Display heading
    draw_set_halign(fa_center);
    script_execute(script_tool_text_outline_jason, view_xview[1] + 400, view_yview[1] + 20, 1, c_white, "Highscore");
    
    // Display high score
    for (i = 1; i <= 10; i++)
    {
        draw_set_halign(fa_left);
        script_execute(script_tool_text_outline_jason, view_xview[1] + 150, view_yview[1] + 60 + (25 * (i - 1)), 1, c_white, highscore_name(i));
        
        draw_set_halign(fa_right);
        script_execute(script_tool_text_outline_jason, view_xview[1] + 650, view_yview[1] + 60 + (25 * (i - 1)), 2, c_white, highscore_value(i));
    }
}
