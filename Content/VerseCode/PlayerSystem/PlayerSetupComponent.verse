using { /Verse.org/Simulation }
using { /Verse.org/SceneGraph }

using { VerseLibrary.PlayerSystem }
using { VerseLibrary.CommonSystem }
using { VerseCode.InventorySystem }

roguelike_player_setup_component<public> := class<final_super><final>(player_setup_component):

    Setup<override><final>(Player:player):void=
        Print("Setup Player")
        if:
            RootInventory := Player.GetRootInventory[]
        then:
            NewRoguelikeInventory := entity{}
            NewRoguelikeInventory.AddComponents(array{roguelike_inventory_component{Entity := NewRoguelikeInventory}})
            RootInventory.Entity.AddEntities(array{NewRoguelikeInventory})

            Print("Setup Finished")