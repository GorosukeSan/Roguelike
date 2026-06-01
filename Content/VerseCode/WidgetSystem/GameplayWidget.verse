using { /UnrealEngine.com/Temporary/UI }

using { VerseLibrary.WidgetSystem }
using { UI.Gameplay }

roguelike_gameplay_widget<public> := class(displayable_gameplay_widget_base):
    
    Widget<public>:WBP_Gameplay

    CreateWidget<override>():widget=
        Widget