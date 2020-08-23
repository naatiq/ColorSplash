#Base Class for all characters, used to define export variable 

extends Node2D

#Keep adding enums as new characters are added
enum CHARACTER_TYPE { EMPTY = -1, PLAYER, ENEMY1 }

export (CHARACTER_TYPE) var type = CHARACTER_TYPE.PLAYER
