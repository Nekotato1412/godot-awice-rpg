# Awice RPG Plugin
Godot plugin originally intended for internal use. May not work with all projects. Feel free to fork.

## What this adds
### Singletons
- Globals
  > This contains an Enum for use across scenes.
### Classes
- Event
  > Inspired by RPG Maker, Events are nodes with Area2Ds that can be placed around the map. Extend them and override the run() function.
- Player
  > Basic movement and interaction with Events
- Item
  > Base Data Handler for Items.
- Weapon
  > Base Data Handler for Weapons. Extends Item.
- Consumables
  > Extends Weapon but is one-use.
### Scenes
- Player
- Event
