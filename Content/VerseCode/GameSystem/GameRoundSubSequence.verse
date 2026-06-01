using { /Verse.org/Simulation }

using { VerseLibrary.GameSystem }

game_round_sub_sequence_component<public> := class<final_super><abstract>(game_sequence_component):

game_round_sub_pre_sequence_component<public> := class<final_super><final>(game_round_sub_sequence_component):

    Sequence<override>()<suspends>:void=
        Sleep(1.0)

    NextSequenceType<override>()<decides><reads>:castable_subtype(game_sequence_component)=
        game_round_sub_main_sequence_component

game_round_sub_main_sequence_component<public> := class<final_super><final>(game_round_sub_sequence_component):

    Sequence<override>()<suspends>:void=
        for:
            Value := 1..5
        do:
            Print("Time: {Value}")
            Sleep(1.0)

    NextSequenceType<override>()<decides><reads>:castable_subtype(game_sequence_component)=
        game_round_sub_post_end_sequence_component

game_round_sub_post_sequence_component<public> := class<final_super><abstract>(game_round_sub_sequence_component):

game_round_sub_post_restart_sequence_component<public> := class<final_super><final>(game_round_sub_post_sequence_component):

    Sequence<override>()<suspends>:void=
        Print("Called Post Sequence")
        Sleep(Inf)

    NextSequenceType<override>()<decides><reads>:castable_subtype(game_sequence_component)=
        game_round_sub_pre_sequence_component

game_round_sub_post_end_sequence_component<public> := class<final_super><final>(game_round_sub_post_sequence_component):

    Sequence<override>()<suspends>:void=
        Print("Called End Sequence")
        Entity.SendUp(roguelike_round_end_event{})

    NextSequenceType<override>()<decides><reads>:castable_subtype(game_sequence_component)=
        {false?; game_round_sub_post_end_sequence_component}