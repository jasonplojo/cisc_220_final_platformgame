// Enemy Healthbar
if (deathDuration <= 0)
{
    draw_healthbar(x - EHEALTHBAR_WIDTH - EHEALTHBAR_OFFSET_X, y - EHEALTHBAR_HEIGHT - EHEALTHBAR_OFFSET_Y, x + EHEALTHBAR_WIDTH + EHEALTHBAR_OFFSET_X, y - EHEALTHBAR_OFFSET_Y, enemyHealth / enemyTotalHealth * 100, c_red, c_olive, c_olive, 0, true, true);
    
    if (hasKey)
    {   
        draw_set_halign(fa_center);
        script_tool_text_outline_trans_jason(x, y - 55, 1, c_white, "Has Key!");
    }
}
