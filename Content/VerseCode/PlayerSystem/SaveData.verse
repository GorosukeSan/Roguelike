using { /Verse.org/Simulation }

var SaveData<public>:weak_map(player, save_data) = map{}

MakeSaveData<public><constructor>(CurrentData:save_data)<transacts> := save_data:
    IDs := CurrentData.IDs
    Level := CurrentData.Level
    XP := CurrentData.XP

save_data<public> := class<final><persistable>:
    IDs<public>:[]string = array{}
    Level<public>:int = 1
    XP<public>:int = 0