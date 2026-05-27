using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/UI }
using { /Fortnite.com/Playspaces }

using { VerseLibrary.WidgetSystem }
using { UI.Menu }
using { VerseLibrary.CommonSystem } 

menu_component<public> := class<final_super><final>(common_widget_component, has_fort_round_manager, has_playspace_event):

    OnBeginSimulation<override>():void=
        Entity.SubscribeRoundStarted(Self)

    OnRoundStarted<override>()<suspends>:void=
        Entity.SubscribePlayspace(Self)

    OnPlay<override>(Player:player):void=
        ShowUI(Player)

    CreateWidget<override>(Player:player):result(displayable_widget_base, void)=
        if:
            PlayerIcon := Player.GetIcon[]
        then:
            NewWidget := 
                menu_widget:
                    Player := Player
                    MenuWidget := WBP_Menu:
                        PlayerIconTexture := PlayerIcon
                        PlayerNameMessage := GetName(Player)
            MakeSuccess(NewWidget)
        else:
            MakeError()

    InitialTasks<override>():[]common_task_function=
        array:
            common_task_runnable_function:
                Task := StartGameTask