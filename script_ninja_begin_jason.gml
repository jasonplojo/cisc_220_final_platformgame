///////
//KEYBOARD INPUT
//////

if (object_dynamic_camera_jason.activeCamera)
{
    isMoveLeft = keyboard_check(vk_left);
    isMoveRight = keyboard_check(vk_right);
    isJumping = keyboard_check_pressed(vk_space);
    isFalling = keyboard_check_released(vk_space);
    isAttacking = keyboard_check_pressed(vk_lcontrol);
    isThrowing = keyboard_check_pressed(vk_lshift);
    isRestarting = keyboard_check_pressed(ord('R'));
    isSlowDown = keyboard_check_pressed(ord('S'));
}
