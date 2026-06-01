using { /Verse.org/SceneGraph }
using { /Verse.org/Assets }
using { /Verse.org/Presentation }

(Component:roguelike_menu_item_component).GetIcon<public>()<decides><transacts>:texture=
    Component.Entity.GetComponent[icon_component].Icon
(Component:roguelike_menu_item_component).GetName<public>()<decides><transacts>:message=
    Component.Entity.GetComponent[description_component].Name

roguelike_menu_item_component<public> := class<final_super><abstract>(component):

roguelike_menu_item_slot1_component<public> := class<final_super><final>(roguelike_menu_item_component):
roguelike_menu_item_slot2_component<public> := class<final_super><final>(roguelike_menu_item_component):
roguelike_menu_item_slot3_component<public> := class<final_super><final>(roguelike_menu_item_component):