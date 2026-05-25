// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

enum Size
{
  Small,
  Medium,
  Large    
}

function spawn_asteroid(sx, sy, size) 
{
  // create asteroid
  var instance = instance_create_layer(sx, sy, "Instances", Obj_asteroid);
  initialize_asteroid(instance, size)
}

// function to initialize an asteroid, used when creating instance at run-time
function initialize_asteroid(asteroid, size)
{
  // set asteroid size
  asteroid.size = size

  // define sizes and speeds of asteroid sizes
  image_sizes = [1.0, 1.5, 2.5]
  speeds = [4.0, 3.0, 2.0]
  rotation_rates = [10, 6, 3]

  // set sizes and speed based on asteroid size
  asteroid.image_xscale = image_sizes[size]
  asteroid.image_yscale = image_sizes[size]
  asteroid.speed = speeds[size]

  // set rotation rate of asteroid based on asteroid size
  asteroid.rotation_rate = random_range(-rotation_rates[size], rotation_rates[size])
}

function destroy_asteroid(asteroid)
{
  with (asteroid)
  {  
    // create explosion object
    instance_create_layer(x, y, "Instances", Obj_explosion)

    // spawn small asteroids
    if (size == Size.Large) 
    {
		global.game.player_score += 250
      audio_play_sound(snd_explosion_large, 10, false)
      // create two medium asteroids
      repeat(2) 
      {
        spawn_asteroid(x, y, Size.Medium)
      }
    }
    else if (size == Size.Medium) 
    {
		global.game.player_score += 150
      audio_play_sound(snd_explosion_medium, 10, false)
      // create two small asteroids
      repeat(2) 
      {
        spawn_asteroid(x, y, Size.Small)
      }
    }
    else
    {
		global.game.player_score += 100
      audio_play_sound(snd_explosion_small, 10, false)
    }

    // destroy the hit asteroid
    instance_destroy()
  }
}

 