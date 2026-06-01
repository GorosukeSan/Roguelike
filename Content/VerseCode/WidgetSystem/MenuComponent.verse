using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/UI }
using { /Fortnite.com/Playspaces }
using { /Verse.org/SceneGraph }

using { VerseLibrary.WidgetSystem }
using { UI.Menu }
using { VerseLibrary.CommonSystem }
using { ItemSystem }
using { VerseLibrary.ItemSystem }
using { VerseLibrary.ManagerSystem }

select_item_slots<public> := struct:
    Slot1:roguelike_menu_item_slot1_component
    Slot2:roguelike_menu_item_slot2_component
    Slot3:roguelike_menu_item_slot3_component

roguelike_menu_component<public> := class<final_super><final>(common_widget_component):

    AssignItemSlots<public>(Player:player, Slots:select_item_slots):void=
        if:
            MenuWidget := GetWidgetAs[Player, roguelike_menu_widget]
        then:
            AssignItemSlots(MenuWidget, Player, Slots)

    AssignItemSlots<public>(MenuWidget:roguelike_menu_widget, Player:player, Slots:select_item_slots):void=
        if:
            Slot1Texture := Slots.Slot1.GetIcon[]
            Slot1Name := Slots.Slot1.GetName[]
        then:
            set MenuWidget.ItemSelectWidget.ItemSlot1Icon = Slot1Texture
            set MenuWidget.ItemSelectWidget.ItemSlot1Name = Slot1Name

        if:
            Slot2Texture := Slots.Slot2.GetIcon[]
            Slot2Name := Slots.Slot2.GetName[]
        then:
            set MenuWidget.ItemSelectWidget.ItemSlot2Icon = Slot2Texture
            set MenuWidget.ItemSelectWidget.ItemSlot2Name = Slot2Name

        if:
            Slot3Texture := Slots.Slot3.GetIcon[]
            Slot3Name := Slots.Slot3.GetName[]
        then:
            set MenuWidget.ItemSelectWidget.ItemSlot3Icon = Slot3Texture
            set MenuWidget.ItemSelectWidget.ItemSlot3Name = Slot3Name

    CreateWidget<override>(Player:player):result(displayable_widget_base, void)=
        if:
            PlayerIcon := Player.GetIcon[]
            Slots := GetSelectItemSlots[]
        then:
            Print("Create Widget")
            NewWidget := 
                roguelike_menu_widget:
                    Parent := Self
                    Player := Player
                    MenuWidget := WBP_Menu:
                        PlayerIconTexture := PlayerIcon
                        PlayerNameMessage := GetName(Player)
                    ItemSelectWidget := WBP_ItemSelect:

            AssignItemSlots(NewWidget, Player, Slots)
            MakeSuccess(NewWidget)
        else:
            MakeError()

    InitialTasks<override>():[]common_task_function=
        array:
            common_task_runnable_function:
                Task := StartGameTask
            common_task_runnable_function:
                Task := SelectItemSelectTask
            common_task_runnable_function:
                Task := SelectBackTask

    GetSelectItemSlots<private>()<decides><transacts>:select_item_slots=
        SimulationEntity := Entity.GetSimulationEntity[]
        ItemContainer := Entity.GetManager[item_container_component]
        
        Slot1 := 
            (
                for:
                    Element : ItemContainer.Entity.FindDescendantComponents(roguelike_menu_item_slot1_component)
                do:
                    Element
            )[0]

        Slot2 := 
            (
                for:
                    Element : ItemContainer.Entity.FindDescendantComponents(roguelike_menu_item_slot2_component)
                do:
                    Element
            )[0]

        Slot3 := 
            (
                for:
                    Element : ItemContainer.Entity.FindDescendantComponents(roguelike_menu_item_slot3_component)
                do:
                    Element
            )[0]

        select_item_slots:
            Slot1 := Slot1
            Slot2 := Slot2
            Slot3 := Slot3