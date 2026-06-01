using { /Verse.org/Simulation }
using { /Fortnite.com/Characters }
using { /Verse.org/SpatialMath }
using { /Verse.org/SceneGraph }

using { VerseLibrary.WidgetSystem }

ChangeMinorOpacityTask<public>(Player:player, Widget:displayable_widget_base)<suspends>:void=
    if:
        GameplayWidget := roguelike_gameplay_widget[Widget]
        FortCharacter := Player.GetFortCharacter[]
        CharacterEntity := FortCharacter.GetEntity[]
    then:
        var LastLocation:vector3 = vector3{}
        loop:
            set LastLocation = CharacterEntity.GetGlobalTransform().Translation
            Sleep(0.1)
            set GameplayWidget.Widget.VisibleMinor = logic:
                Distance(LastLocation, CharacterEntity.GetGlobalTransform().Translation) = 0.0