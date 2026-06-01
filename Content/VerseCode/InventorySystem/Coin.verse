using { /UnrealEngine.com/Itemization }

RoguelikeItemCategory<public>:item_category = item_category{}

roguelike_coin_item_component<public> := class<final_super><final>(item_component):
    Categories<override><final>:[]item_category = array{RoguelikeItemCategory}