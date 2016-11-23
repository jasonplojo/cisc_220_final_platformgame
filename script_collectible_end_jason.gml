if (place_meeting(x, y, object_ninja_jason))
{
    score += 220;
    
    audio_play_sound(sound_orbs_jason, 0, false);
    instance_destroy();
}
