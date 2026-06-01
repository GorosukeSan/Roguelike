using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/UI }
using { /Fortnite.com/Playspaces }

using { VerseLibrary.WidgetSystem }
using { UI.Gameplay }

roguelike_gameplay_widget_component<public> := class(common_widget_component):
    
    CreateWidget<override>(Player:player):result(displayable_widget_base, void)=
        NewWidget := 
            roguelike_gameplay_widget:
                Parent := Self
                Player := Player
                Widget := WBP_Gameplay{}
        MakeSuccess(NewWidget)

    InitialTasks<override>():[]common_task_function=
        array:
            common_task_runnable_function:
                Task := ChangeMinorOpacityTask