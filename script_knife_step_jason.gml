var colId = instance_place(x, y, object_enemy_jason);

if (colId != noone && colId.deathDuration <= 0)
{
    with (colId)
    {
        if (object_index == object_wolf_jason && hurtDuration <=0)
        {
            hostile = false;
            enemyHealth -= KATTACK_DAMAGE;
            
            vspeed = JUMP_DISTANCE / 2;
            hspeed = MAX_AIR_HSPEED * other.facing;
            
            audio_play_sound(sound_knife_hit_jason, 0 , false);
            
            if (enemyHealth <= 0)
            {
                score += 350;
                deathDuration = DEATH_DURATION * room_speed;
                
                // knife drop at 25%
                if (irandom_range(1, 4) % 4 == 0)
                    instance_create(x, y, object_collectible_knife_jason);
                
                // potion drop at 10%
                if (irandom_range(1, 10) % 10 == 0)
                    instance_create(x, y, object_collectible_potion_jason);
                    
                if (hasKey)
                    instance_create(x, y, object_key_jason);
            }
            else
                hurtDuration = HURT_DURATION * room_speed;
        
            audio_play_sound(sound_wolf_death_1_jason, 0, false);
        }
        
        if (object_index == object_panda_jason && hurtDuration <=0)
        {
            hostile = false;
            enemyHealth -= KATTACK_DAMAGE;
            
            vspeed = JUMP_DISTANCE / 2;
            hspeed = MAX_AIR_HSPEED * other.facing;
            
            audio_play_sound(sound_knife_hit_jason, 0 , false);
            
            if (enemyHealth <= 0)
            {
                score += 350;
                deathDuration = DEATH_DURATION * room_speed;
                
                // knife drop at 35%
                if (irandom_range(7, 20) % 20 == 0)
                    instance_create(x, y, object_collectible_knife_jason);
                
                // potion drop at 12.5%
                if (irandom_range(1, 8) % 8 == 0)
                    instance_create(x, y, object_collectible_potion_jason);
                    
                if (hasKey)
                    instance_create(x, y, object_key_jason);
            }
            else
                hurtDuration = HURT_DURATION * room_speed;
                
            audio_play_sound(sound_panda_death_jason, 0, false);
        }
    }
    
    instance_destroy();
}

if (x < sprite_width || x > room_width)
    instance_destroy();
    
if (place_meeting(x, y, object_solid_jason))
{
    audio_play_sound(sound_knife_hit_jason, 0, false);
    instance_destroy();
}
