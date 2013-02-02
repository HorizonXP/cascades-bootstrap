#include "CascadesBootstrapApp.hpp"

#include <bb/cascades/AbstractPane>
#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>

using namespace bb::cascades;

CascadesBootstrapApp::CascadesBootstrapApp()
{
    // Load the UI description from main.qml
    QmlDocument *qml = QmlDocument::create("asset:///main.qml");

    // If the QML document is valid, we process it.
    if (!qml->hasErrors()) {

        // Create the application scene
        AbstractPane *appPage = qml->createRootObject<AbstractPane>();

        if (appPage) {
            // Set the main scene for the application to the Page.
            Application::instance()->setScene(appPage);

            QVariant retVal;
            QVariant msg = "Hello World from C++!";
            QMetaObject::invokeMethod(appPage, "onMsgFromCPP",
                    Q_RETURN_ARG(QVariant, retVal),
                    Q_ARG(QVariant, msg));
            qDebug() << "Sent msg, " << msg;
        }
    }
}
