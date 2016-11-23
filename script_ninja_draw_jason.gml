switch(state)
{
    case NSTATE_STAND:
        image_speed = 0;
        draw_sprite_ext(sprite_ninja_stand_jason, -1, x, y, image_xscale * facing, image_yscale, image_angle, c_white, image_alpha);
        break;
        
    case NSTATE_RUN:
        image_speed = hspeed * 0.020;
        draw_sprite_ext(sprite_ninja_run_jason, -1, x, y, image_xscale * facing, image_yscale, image_angle, c_white, image_alpha);
        break;
        
    case NSTATE_FALL:
        image_speed = 0;
        draw_sprite_ext(sprite_ninja_jump_jason, 1, x, y, image_xscale * facing, image_yscale, image_angle, c_white, image_alpha);
        break;
    
    case NSTATE_JUMP:
        image_speed = 0;
        draw_sprite_ext(sprite_ninja_jump_jason, 0, x, y, image_xscale * facing, image_yscale, image_angle, c_white, image_alpha);
        break;
        
    case NSTATE_GATTACK:
        image_speed = 0.70;
        if (facing == FACE_LEFT)
        {
            for (var i = 0; i < 3; i++)
                draw_sprite_ext(sprite_ninja_attack_jason, -1, xprevious + (i * -facing * 10), y, image_xscale * facing, image_yscale, direction - 180, c_white, 0.5);
            draw_sprite_ext(sprite_ninja_attack_jason, -1, x, y, image_xscale * facing, image_yscale, image_angle, c_white, image_alpha);
        }
        else if(facing == FACE_RIGHT)
        {
            for (var i = 0; i < 3; i++)
                draw_sprite_ext(sprite_ninja_attack_jason, -1, xprevious + (i * -facing * 10), y, image_xscale * facing, image_yscale, direction, c_white, 0.5);
            draw_sprite_ext(sprite_ninja_attack_jason, -1, x, y, image_xscale * facing, image_yscale, image_angle, c_white, image_alpha);
        }
        break;
        
    case NSTATE_AATTACK:
        image_speed = 0;
        if (facing == FACE_LEFT)
        {
            for (var i = 0; i < 3; i++)
                draw_sprite_ext(sprite_ninja_jump_attack_jason, -1, xprevious + (i * -facing * 5), yprevious + (-i * 5), image_xscale * facing, image_yscale, direction - 180, c_white, 0.5);
            draw_sprite_ext(sprite_ninja_jump_attack_jason, -1, x, y, image_xscale * facing, image_yscale, direction - 180, c_white, image_alpha);
        }
        else if (facing == FACE_RIGHT)
        {
            for (var i = 0; i < 3; i++)
                draw_sprite_ext(sprite_ninja_jump_attack_jason, -1, xprevious + (i * -facing * 5), yprevious + (-i * 5), image_xscale * facing, image_yscale, direction, c_white, 0.5);
            draw_sprite_ext(sprite_ninja_jump_attack_jason, -1, x, y, image_xscale * facing, image_yscale, direction, c_white, image_alpha);
        }
        break;
        
    case NSTATE_THROW:
        image_speed = 0;
        draw_sprite_ext(sprite_ninja_attack_jason, 3, x, y, image_xscale * facing, image_yscale, image_angle, c_white, image_alpha);
        break;
        
    case NSTATE_HURT:
        image_speed = 0;
        draw_sprite_ext(sprite_ninja_hurt_jason, -1, x, y, image_xscale * facing, image_yscale, image_angle, c_white, image_alpha);
        break;
        
    case NSTATE_DEATH:
        image_speed = 0;
        draw_sprite_ext(sprite_ninja_death_jason, -1, x, y, image_xscale * facing, image_yscale, image_angle, c_white, image_alpha);
        break;
}
