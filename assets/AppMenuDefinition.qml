import bb.cascades 1.0

MenuDefinition {
    signal triggerSettingsPage
    signal triggerHelpPage

    settingsAction: SettingsActionItem {
        onTriggered: {
            triggerSettingsPage();
        }
    }
    helpAction: HelpActionItem {
        onTriggered: {
            triggerHelpPage();
        }
    }
}
