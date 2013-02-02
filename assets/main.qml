import bb.cascades 1.0

NavigationPane {
    id: root

    signal updateLabelText(string text)

    property variant settingsPage;
    property variant helpPage;

    Menu.definition: AppMenuDefinition {
        id: appMenu
    }

    MainPage { id: mainPage }

    attachedObjects: [
        ComponentDefinition {
            id: settingsDef;
            source: "asset:///SettingsPage.qml"
        },
        ComponentDefinition {
            id: helpDef;
            source: "asset:///HelpPage.qml"
        }
    ]

    onUpdateLabelText: {
        mainPage.updateLabelText(text);
    }

    onCreationCompleted: {
        appMenu.triggerSettingsPage.connect(handleTriggerSettingsPage);
        appMenu.triggerHelpPage.connect(handleTriggerHelpPage);
    }

    onPopTransitionEnded: {
        if (page == settingsPage) {
            settingsPage = undefined;
        } else if (page == helpPage) {
            helpPage = undefined;
        }
        page.destroy();
    }

    function handleTriggerSettingsPage() {
        if (settingsPage == undefined) {
            settingsPage = settingsDef.createObject();
            push(settingsPage);
        } else {
            if (indexOf(settingsPage) == -1) {
                settingsPage = undefined;
                handleTriggerSettingsPage();
            } else {
                navigateTo(settingsPage);
            }
        }
    }

    function handleTriggerHelpPage() {
        if (helpPage == undefined) {
            helpPage = helpDef.createObject();
            push(helpPage);
        } else {
            if (indexOf(helpPage) == -1) {
                helpPage = undefined;
                handleTriggerHelpPage();
            } else {
                navigateTo(helpPage);
            }
        }
    }

    function onMsgFromCPP(data) {
        updateLabelText(data);
    }
}
