using { /Fortnite.com/Playspaces }
using { /Verse.org/Simulation }
using { /Verse.org/SceneGraph }

using { VerseLibrary.GameSystem }
using { VerseLibrary.WidgetSystem }

roguelike_game_menu_sequence_component<public> := class(game_sequence_component):

    StartGameEvent<public>:event() = event(){}

    Sequence<override>()<suspends>:void=
        for:
            PlayerElement : Entity.GetPlayspaceForEntity[].GetPlayers()
        do:
            Entity.SendDown(widget_show_event{Player := PlayerElement})

        StartGameEvent.Await()

    NextSequenceType<override>()<decides><reads>:castable_subtype(game_sequence_component)=
        roguelike_game_round_sequence_component

    OnReceive<override>(SceneEvent:scene_event):logic=
        (super:)OnReceive(SceneEvent)

        if:
            widget_called_hide_event[SceneEvent]
        then:
            StartGameEvent.Signal()

        false