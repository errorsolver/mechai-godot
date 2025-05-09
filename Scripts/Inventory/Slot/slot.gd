class_name InventorySlot
extends PanelContainer

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass

func clearTooltip():
	tooltip_text = ''

func updateTooltip(title: String, desc: String) -> void:
	var inner_text = '%s\n%s' % [title, desc]
	tooltip_text = inner_text
	print(tooltip_text)
