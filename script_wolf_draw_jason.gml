switch(state)
{
    case ESTATE_AIR:
    case ESTATE_STAND:
        image_speed = 0;
        draw_sprite_ext(sprite_wolf_stand_jason, -1, x, y, image_xscale * facing, image_yscale, image_angle, c_white, image_alpha);
        break;
        
    case ESTATE_WALK:
        image_speed = 0.225;
        draw_sprite_ext(sprite_wolf_run_jason, -1, x, y, image_xscale * facing, image_yscale, image_angle, c_white, image_alpha);
        break;
    
    case ESTATE_HURT:
    case ESTATE_DEATH:
        image_speed = 0;
        draw_sprite_ext(sprite_wolf_death_jason, -1, x, y, image_xscale * facing, image_yscale, image_angle, c_white, image_alpha);
        break;      
}
