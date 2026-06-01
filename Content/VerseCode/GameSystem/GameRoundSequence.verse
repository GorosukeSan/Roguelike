using { /Verse.org/SceneGraph }
using { /Verse.org/Random }
using { /Fortnite.com/Playspaces }
using { /Verse.org/Simulation }

using { VerseLibrary.GameSystem }
using { WorldComponent }
using { VerseLibrary.WidgetSystem}
using { VerseLibrary.CommonSystem  }
using { InventorySystem}

roguelike_round_event<public> := class<abstract>(scene_event):

roguelike_round_end_event<public> := class<final>(roguelike_round_event):

roguelike_game_round_sequence_component<public> := class(game_sequence_component):

    RoundEndEvent<private>:event() = event(){}

    Sequence<override>()<suspends>:void=
        if:
            RandomTarget := Shuffle(FindStages())[0]
        then:
            for:
                PlayerElement : Entity.GetPlayspaceForEntity[].GetPlayers()
            do:
                Entity.SendDown(widget_show_event{Player := PlayerElement})

                RandomTarget.Spawn(PlayerElement)

        Entity.SendDown(game_sequence_play_event{SequenceType := game_round_sub_pre_sequence_component})
        
        RoundEndEvent.Await()

        for:
            PlayerElement : Entity.GetPlayspaceForEntity[].GetPlayers()
        do:
            Entity.SendDown(widget_hide_event{Player := PlayerElement})

    NextSequenceType<override>()<decides><reads>:castable_subtype(game_sequence_component)=
        roguelike_game_menu_sequence_component

    FindStages<public><final>()<transacts>:[]roguelike_world_stage_component=
        if:
            SimulationEntity := Entity.GetSimulationEntity[]
        then:
            for:
                Element : SimulationEntity.FindDescendantComponents(roguelike_world_stage_component)
            do:
                Element
        else:
            array{}

    OnReceive<override>(SceneEvent:scene_event):logic=
        (super:)OnReceive(SceneEvent)

        if:
            roguelike_round_end_event[SceneEvent]
        then:
            RoundEndEvent.Signal()

        false