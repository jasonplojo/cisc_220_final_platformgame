switch(state)
{
    case ESTATE_AIR:
    case ESTATE_STAND:
        image_speed = 0;
        draw_sprite_ext(sprite_panda_stand_jason, -1, x, y, image_xscale * facing, image_yscale, image_angle, c_white, image_alpha);
        break;
        
    case ESTATE_WALK:
        image_speed = 0.15;
        draw_sprite_ext(sprite_panda_run_jason, -1, x, y, image_xscale * facing, image_yscale, image_angle, c_white, image_alpha);
        break;
        
    case ESTATE_PREP:
        image_speed = 0;
        draw_sprite_ext(sprite_panda_prep_jason, -1, x, y, image_xscale * facing, image_yscale, image_angle, c_white, image_alpha);
        break;
        
    case ESTATE_PUNCH:
        image_speed = 0.25;
        if (facing == FACE_LEFT)
        {
            for (var i = 0; i < 3; i++)
                draw_sprite_ext(sprite_panda_punch_jason, -1, xprevious + (i * - facing * 10), y, image_xscale * facing, image_yscale, direction - 180, c_white, 0.5);
            draw_sprite_ext(sprite_panda_punch_jason, -1, x, y, image_xscale * facing, image_yscale, image_angle, c_white, 0.5);
        }
        else if (facing == FACE_RIGHT)
        {
            for (var i = 0; i < 3; i++)
                draw_sprite_ext(sprite_panda_punch_jason, -1, xprevious + (i * -facing * 10), y, image_xscale * facing, image_yscale, direction, c_white, 0.5);
            draw_sprite_ext(sprite_panda_punch_jason, -1, x, y, image_xscale * facing, image_yscale, image_angle, c_white, image_alpha);
        }
        break;
        
    case ESTATE_KICK:
        image_speed = 0.25;
        if (facing == FACE_LEFT)
        {
            for (var i = 0; i < 3; i++)
                draw_sprite_ext(sprite_panda_kick_jason, -1, xprevious + (i * - facing * 10), y, image_xscale * facing, image_yscale, direction - 180, c_white, 0.5);
            draw_sprite_ext(sprite_panda_kick_jason, -1, x, y, image_xscale * facing, image_yscale, image_angle, c_white, 0.5);
        }
        else if (facing == FACE_RIGHT)
        {
            for (var i = 0; i < 3; i++)
                draw_sprite_ext(sprite_panda_kick_jason, -1, xprevious + (i * -facing * 10), y, image_xscale * facing, image_yscale, direction, c_white, 0.5);
            draw_sprite_ext(sprite_panda_kick_jason, -1, x, y, image_xscale * facing, image_yscale, image_angle, c_white, image_alpha);
        }
        break;
    
    case ESTATE_HURT:
    case ESTATE_DEATH:
        image_speed = 0;
        draw_sprite_ext(sprite_panda_death_jason, -1, x, y, image_xscale * facing, image_yscale, image_angle, c_white, image_alpha);
        break;      
}
