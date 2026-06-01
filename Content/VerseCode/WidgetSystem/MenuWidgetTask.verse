using { /Verse.org/Simulation }

using { VerseLibrary.WidgetSystem }

StartGameTask<public>(Player:player, Widget:displayable_widget_base)<suspends>:void=
    if:
        MenuWidget := roguelike_menu_widget[Widget]
        MenuComponent := roguelike_menu_component[Widget.Parent]
    then:
        MenuWidget.MenuWidget.StartGameEvent.Await()
        MenuComponent.HideUI(Player)

SelectItemSelectTask<public>(Player:player, Widget:displayable_widget_base)<suspends>:void=
    if:
        MenuWidget := roguelike_menu_widget[Widget]
    then:
        loop:
            MenuWidget.MenuWidget.SelectItemSelectEvent.Await()
            MenuWidget.SetItemSelect()

SelectBackTask<public>(Player:player, Widget:displayable_widget_base)<suspends>:void=
    if:
        MenuWidget := roguelike_menu_widget[Widget]
    then:
        loop:
            MenuWidget.ItemSelectWidget.BackEvent.Await()
            MenuWidget.SetMain()