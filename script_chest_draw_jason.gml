switch(state)
{   
    case CSTATE_CLOSED:
        draw_set_halign(fa_center);
        draw_sprite(sprite_chest_jason, 0, x, y);
        if (!global.playerHasKey)
            script_tool_text_outline_trans_jason(x + (sprite_width / 2), y - 50, 1, c_white, "Needs Key!");
        else
            script_tool_text_outline_trans_jason(x + (sprite_width / 2), y - 50, 1, c_white, "Use Key!");
        break;
        
    case CSTATE_OPEN:
        draw_sprite(sprite_chest_jason, 1, x, y);
        break; 
}
