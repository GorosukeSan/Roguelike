using { /Verse.org/Simulation }

using { VerseLibrary.GameSystem }

rogueline_game_component<public> := class<final><final_super>(game_component):

    OnRoundStarted<override>()<suspends>:void=
        Sleep(1.0)
        Entity.SendDown(
            game_sequence_play_event:
                SequenceType := roguelike_game_menu_sequence_component
        )