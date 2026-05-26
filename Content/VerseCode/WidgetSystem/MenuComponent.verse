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

    CreateWidget<override>(Player:player):displayable_widget_base=
        menu_widget:
            Player := Player
            MenuWidget := WBP_Menu:
                PlayerIconTexture := Player.GetSafeIcon()
                PlayerNameMessage := GetName(Player)