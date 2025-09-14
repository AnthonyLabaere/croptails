extends PanelContainer

@onready var logs_label: Label = $MarginContainer/VBoxContainer/Logs/LogsLabel
@onready var stones_label: Label = $MarginContainer/VBoxContainer/Stones/StonesLabel
@onready var corns_label: Label = $MarginContainer/VBoxContainer/Corns/CornsLabel
@onready var tomatoes_label: Label = $MarginContainer/VBoxContainer/Tomatoes/TomatoesLabel
@onready var eggs_label: Label = $MarginContainer/VBoxContainer/Eggs/EggsLabel
@onready var milk_label: Label = $MarginContainer/VBoxContainer/Milk/MilkLabel



func _ready() -> void:
	InventoryManager.inventory_changed.connect(on_inventory_changed)
	
	
func on_inventory_changed() -> void:
	var inventory: Dictionary = InventoryManager.inventory
	
	if inventory.has("log"):
		logs_label.text = str(inventory["log"])
	if inventory.has("stone"):
		stones_label.text = str(inventory["stone"])
	if inventory.has("corn"):
		corns_label.text = str(inventory["corn"])
	if inventory.has("tomato"):
		tomatoes_label.text = str(inventory["tomato"])
	if inventory.has("egg"):
		eggs_label.text = str(inventory["egg"])
	if inventory.has("milk"):
		milk_label.text = str(inventory["milk"])
