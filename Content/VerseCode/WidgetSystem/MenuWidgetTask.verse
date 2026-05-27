using { /Verse.org/Simulation }

using { VerseLibrary.WidgetSystem }

StartGameTask<public>(Player:player, Widget:displayable_widget_base)<suspends>:void=
    if:
        MenuWidget := menu_widget[Widget]
    then:
        MenuWidget.MenuWidget.StartGameEvent.Await()
        MenuWidget.Hide()