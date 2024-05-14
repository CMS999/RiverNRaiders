extends Control

@onready var HotKeyBut = preload("res://UI/HotkeyButton.tscn")
@onready var HotKeyLista = $Painel/Margin/Scroll/VBox

func _ready():
	Inicializar_Lista()
	pass

func Inicializar_Lista():
	InputMap.load_from_project_settings()
	for acao in InputMap.get_actions():
		var newButton = HotKeyBut.instantiate()
		HotKeyLista.add_child(newButton)
	pass


