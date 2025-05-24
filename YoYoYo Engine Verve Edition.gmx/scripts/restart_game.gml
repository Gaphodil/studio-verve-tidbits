///restart_game()

if (surface_exists(global.pauseSurf))
{
    surface_free(global.pauseSurf);
}

ds_map_destroy(global.persistentSaveData);
ds_map_destroy(global.saveData);
ds_map_destroy(global.trigger);
ds_list_destroy(global.options);
ds_list_destroy(global.triggers);

game_restart();
