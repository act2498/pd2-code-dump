--run as keybind or plug in your function
--https://payday-2-blt-docs.readthedocs.io/en/latest/lua/quick_menu/
local menu_options = {}
menu_options[1] = {text = "quit", is_cancel_button = true}
local menu = QuickMenu:new("title", "message", menu_options)
menu:Show()
