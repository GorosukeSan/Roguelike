using { /UnrealEngine.com/Temporary/UI }

using { VerseLibrary.WidgetSystem }
using { UI.Menu }

roguelike_menu_widget<public> := class<final>(displayable_interactable_widget_base):
    
    MenuWidget<public>:WBP_Menu
    ItemSelectWidget<public>:WBP_ItemSelect

    GetLayeredWidgets<private>()<reads>:[]widget=
        array:
            MenuWidget
            ItemSelectWidget

    InitializeWidget<override>():void=
        SetMain()

    SetMain<public>():void=
        SetWidget(WBP_Menu)

    SetItemSelect<public>():void=
        SetWidget(WBP_ItemSelect)

    SetWidget<public>(widget_type:subtype(widget)):void=
        for:
            WidgetElement : GetLayeredWidgets()
        do:
            if(widget_type[WidgetElement]):
                WidgetElement.SetVisibility(widget_visibility.Visible)
                SetFocus(WidgetElement)
            else:
                WidgetElement.SetVisibility(widget_visibility.Collapsed)

    CreateWidget<override>():widget=
        overlay:
            Slots := array:
                overlay_slot:
                    HorizontalAlignment := horizontal_alignment.Fill
                    VerticalAlignment := vertical_alignment.Fill
                    Widget := MenuWidget
                overlay_slot:
                    HorizontalAlignment := horizontal_alignment.Fill
                    VerticalAlignment := vertical_alignment.Fill
                    Widget := ItemSelectWidget
