#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"
//#include <QQmlEngine>
#include <QQmlComponent>
#include "Person.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<Person>("People", 1, 0, "Person");

    QtQuick2ApplicationViewer viewer;
    viewer.setMainQmlFile(QStringLiteral("qml/Adding/main.qml"));
    viewer.showExpanded();

    return app.exec();
}
