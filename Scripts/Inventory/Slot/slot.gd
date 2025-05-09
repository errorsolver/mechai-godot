class_name InventorySlot
extends PanelContainer

func clear_tooltip():
	tooltip_text = ''

func update_tooltip(title: String, desc: String) -> void:
	var inner_text = '%s\n%s' % [title, desc]
	tooltip_text = inner_text
	print(tooltip_text)
