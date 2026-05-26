using { /UnrealEngine.com/Temporary/UI }

using { VerseLibrary.WidgetSystem }
using { UI.Menu }

menu_widget<public> := class(displayable_interactable_widget_base):
    
    MenuWidget<public>:WBP_Menu

    CreateWidget<override>():widget=
        MenuWidget