// overview of stage
if (overviewStart)
{
    x = room_width / 2;
    vspeed = -5.5;
    
    view_wview[1] = view_wport[1];
    view_hview[1] = view_hport[1];
    
    view_hborder[1] = view_wview[1];
    view_vborder[1] = view_hview[1];
}

// overview of stage
if (y <= 360 && !global.keyAssigned)
{
    delayTimer -= 1;
    
    y = 360;
    
    // Assign key to random enemy
    if (delayTimer <= 0)
    {
        for (var i = 0; i < instance_number(object_enemy_jason); i++)
            enemyList[i] = instance_find(object_enemy_jason, i);
            
        enemySelect = global.enemyList[irandom_range(0, instance_number(object_enemy_jason) - 1)];
        
        with(enemySelect)
        {
            hasKey = true;
            damage = damage * 1.5;
            enemyHealth = enemyHealth * 1.5;
            enemyTotalHealth = enemyHealth;
        }
        
        global.keyAssigned = true;
        overviewStart = false;
        overviewFinished = true;
        
        delayTimer = 3 * room_speed;
    }
}

// show chest
if (overviewFinished)
{   
    if (view_wview[1] > 600)
        view_wview[1] -= 16;
    if (view_hview[1] > 338)
        view_hview[1] -= 9;
            
    if (view_wview[1] < 600)
        view_wview[1] = 600;
    if (view_hview[1] < 338)
        view_hview[1] = 338;
        
        view_hborder[1] = view_wview[1];
        view_vborder[1] = view_hview[1];
                      
    if (place_meeting(x, y, object_chest_jason))
    {
        delayTimer -= 1;
        speed = 0;
    }
    else
        move_towards_point(object_chest_jason.x, object_chest_jason.y, 5);
        
    if (delayTimer <= 0)
    {
        overviewFinished = false;
        chestFinished = true;
    
        delayTimer = 2 * room_speed;
    }
}
    
if (chestFinished)
{        
    view_hborder[1] = view_wview[1];
    view_vborder[1] = view_hview[1];
        
    if (place_meeting(x, y, enemySelect))
    {
        delayTimer -= 1;
        speed = 0;
        
        if (view_wview[1] > 600)
            view_wview[1] -= 8;
        if (view_hview[1] > 338)
            view_hview[1] -= 4.5;
            
        if (view_wview[1] < 600)
            view_wview[1] = 600;
        if (view_hview[1] < 338)
            view_hview[1] = 338;
    }
    else
    {
        move_towards_point(enemySelect.x, enemySelect.y, 12);
        if (view_wview[1] < 800)
            view_wview[1] += 8;
        if (view_hview[1] < 450)
            view_hview[1] += 4.5;
                
        if (view_wview[1] > 800)
            view_wview[1] = 800;
        if (view_hview[1] > 450)
            view_hview[1] = 450;
    }
        
    if (delayTimer <= 0)
    {
        chestFinished = false;
        ninjaView = true;
    }
}

if (ninjaView)
{
    if (view_wview[1] < 800)
        view_wview[1] += 16;
    if (view_hview[1] < 450)
        view_hview[1] += 9;
            
    if (view_wview[1] > 800)
        view_wview[1] = 800;
    if (view_hview[1] > 450)
        view_hview[1] = 450;
        
    view_hborder[1] = view_wview[1];
    view_vborder[1] = view_hview[1];
        
    if (place_meeting(x, y, object_ninja_jason))
    {
        speed = 0;
        ninjaView = false;
        activeCamera = true;
    }
    else
        move_towards_point(object_ninja_jason.x, object_ninja_jason.y, 12);
}

// update camera location to player
if (activeCamera)
{
    vspeed = 0;
    
    view_wview[1] = 800;
    view_hview[1] = 450;
    
    view_hborder[1] = 360;
    view_vborder[1] = 200;
    
    x = object_ninja_jason.x;
    y = object_ninja_jason.y;
}

/*
if (object_ninja_jason.enemyHit)
{
    view_wview[1] = 780 + (object_ninja_jason.speed * dxSpeedOffset);
    view_hview[1] = 430 + (object_ninja_jason.speed * dySpeedOffset);
}
else
{
    view_wview[1] = 800;
    view_hview[1] = 450;
}
*/
