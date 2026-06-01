using { /Verse.org/Simulation }

using { VerseLibrary.ModeSystem }

roguelike_survival_mode_component<public> := class<final_super><final>(mode_element_component):
    @editable
    SurvivalTime<public>:float = 60.0

    Setup<override>():void=
        NewCondition := mode_condition_global_timer:
            TargetTime := SurvivalTime

    Play<override>(Participants:[]player):void=
        return