#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"
//#include <QQmlEngine>
#include <QQmlComponent>
#include "BirthdayParty.h"
#include "Person.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<BirthdayParty>("People", 1, 0, "BirthdayParty");
//    qmlRegisterType<Person>("People", 1, 0, "Person");
    qmlRegisterType<Person>();

    qmlRegisterType<Boy>("People", 1, 0, "Boy");
    qmlRegisterType<Girl>("People", 1, 0, "Girl");

    QtQuick2ApplicationViewer viewer;
    viewer.setMainQmlFile(QStringLiteral("qml/Adding/main.qml"));
    viewer.showExpanded();

    return app.exec();
}
