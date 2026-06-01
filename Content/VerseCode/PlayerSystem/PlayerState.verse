using { /Verse.org/Simulation }

using { VerseLibrary.PlayerSystem }

roguelike_player_state<public> := class<castable><final>(player_state):
    EquippedSkills<public>:[]string = array{}

roguelike_player_session_state_component<public> := class<final_super><final>(player_session_state_component):

    MakePlayerState<override><final>()<transacts>:player_state=
        roguelike_player_state:

roguelike_player_persistant_state_component<public> := class<final_super><final>(player_persistent_state_component):

    HasID<override>(Player:player, ID:string)<decides><transacts>:void=
        SaveData[Player].IDs.Find[ID]

    AddID<override>(Player:player, ID:string):void=
        if:
            CurrentData := SaveData[Player]
            not CurrentData.IDs.Find[ID]
            set SaveData[Player] = save_data:
                IDs := CurrentData.IDs + array{ID}
                MakeSaveData<constructor>(CurrentData)

    RemoveID<override>(Player:player, ID:string):void=
        if:
            CurrentData := SaveData[Player]
            NewIDs := CurrentData.IDs.RemoveAllElements(ID)
            set SaveData[Player] = save_data:
                IDs := NewIDs
                MakeSaveData<constructor>(CurrentData)
