///initialize_globals()

// Initializes all global variables needed for the game.

engine_options();

global.debugOverlay = 0;    // 0 - No overlay, 1 - Simple overlay, 2 - Advanced overlay (toggle with Backspace) 
global.debugNoDeath = false;    //Enables god mode (toggle with Home key)
global.debugInfJump = false;    //Enables infinite jump (toggle with End key)
global.debugShowHitbox = false; //Enables showing the player's hitbox (toggle with Del key)

global.roomCaptionLast = global.roomCaptionDef;
window_set_caption(global.roomCaptionDef);

global.persistentSaveData = ds_map_create();
global.saveData = ds_map_create();
if (!variable_global_exists("musicMap"))
    global.musicMap = ds_map_create();

global.savenum = 1;
global.grav = 1;
global.difficulty = 0;

global.trigger = ds_map_create();

global.gameStarted = false;     //Determines whether the game is in progress (enables saving, restarting, etc.)
global.noPause = false;         //Used to prevent pausing, for example in bossfights
global.autosave = false;        //Used to autosave the next time the player is created
global.noDeath = false;
global.infJump = false;

global.gamePaused = false;
global.pauseSurf = -1;          //Stores the screen surface when the game is paused
global.pauseDelay = 0;          //Sets pause delay so that the player can't quickly pause buffer

global.currentMusicID = -1;     //Current music
global.currentMusic = -1;       //Sound instance of the current music
global.deathSound = -1;         
global.gameOverMusic = -1;      
global.musicFading = false;     //Used for music fading out on death
global.currentGain = 0;         //Used for music fading out on death

global.menuSelectPrev[0] = 0;   //Keeps track of the previously selected option when navigating away from the difficulty menu
global.menuSelectPrev[1] = 0;   //Keeps track of the previously selected option when navigating away from the options menu

//Get the default window size
global.defaultWindowWidth = surface_get_width(application_surface);
global.defaultWindowHeight = surface_get_height(application_surface);
global.windowWidth = global.defaultWindowWidth;
global.windowHeight = global.defaultWindowHeight;

//Keeps track of previous window position/size when display_reset is used for setting vsync
global.windowXPrev = 0;
global.windowYPrev = 0;
global.windowWidthPrev = 0;
global.windowHeightPrev = 0;

display_set_gui_size(surface_get_width(application_surface), surface_get_height(application_surface));  //set the correct gui size for the Draw GUI event

global.controllerMode = false;  //Keeps track of whether to use keyboard or controller
global.controllerDelay = -1;    //Handles delay between switching between keyboard/controller so that the player can't use both at the same time

global.newestVersionNumber = "";
global.newestVersionLink = "";
global.isUpToDate = true;

global.options = ds_list_create();
options_list();

global.makingTrigger = false;
global.triggers = ds_list_create();
trigger_list();

randomize();    //Make sure the game starts with a random seed for RNG

