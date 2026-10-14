extends CanvasLayer

@onready var highscore: Label = $Died/highscore
@onready var start: Control = $Start
@onready var died: Control = $Died

func in_game():
	start.hide()
	died.hide()
	
func in_death_screen():
	died.show()	
