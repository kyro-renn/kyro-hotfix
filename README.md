# Texture Reload Fix  

## Description  
This resource temporarily fixes lost textures by forcing a texture reload.  
It teleports the player to a different location to clear existing textures and load new ones,  
then returns them to their original position to reload the environment properly.  
This helps mitigate texture streaming issues without requiring a full game restart.  

## Features  
✅ Saves and restores the player's original position  
✅ Teleports the player to a temporary location to unload textures  
✅ Waits for a configurable delay before teleporting back  
✅ Configurable teleport location, delay time, and trigger method  
✅ Triggered via command  

## Installation  
1. Download the resource and place it in your `resources` folder.  
2. Add `ensure TextureReloadFix` to your `server.cfg`.  


## Usage  
- Use the command `/fixgta` to force a texture reload.  

## Future Improvements  
- Customizable UI feedback  
