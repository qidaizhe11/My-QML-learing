#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"
#include <QQmlEngine>
#include <QQmlComponent>
#include <QDebug>
#include "BirthdayParty.h"
#include "HappyBirthdaySong.h"
#include "Person.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<BirthdayPartyAttached>();
    qmlRegisterType<BirthdayParty>("People", 1, 0, "BirthdayParty");
    qmlRegisterType<HappyBirthdaySong>("People", 1, 0, "HappyBirthdaySong");
//    qmlRegisterType<Person>("People", 1, 0, "Person");
    qmlRegisterType<ShoeDescription>();
    qmlRegisterType<Person>();

    qmlRegisterType<Boy>("People", 1, 0, "Boy");
    qmlRegisterType<Girl>("People", 1, 0, "Girl");

//    QtQuick2ApplicationViewer viewer;
//    viewer.setMainQmlFile(QStringLiteral("qml/Adding/main.qml"));
//    viewer.showExpanded();

    QQmlEngine engine;
    QQmlComponent component(&engine, QUrl("qrc:/qml/Adding/main.qml"));
    BirthdayParty *party = qobject_cast<BirthdayParty *>(component.create());

    if (party && party->host()) {
      qWarning() << party->host()->name() << "is having a birthday!";

      if (qobject_cast<Boy *>(party->host()))
        qWarning() << "He is invisting:";
      else
        qWarning() << "She is invisting:";

      Person *bestShoe = 0;
      for (int i = 0; i < party->guestCount(); ++i) {
        Person *guest = party->guest(i);

        if (!bestShoe || bestShoe->shoe()->price() < guest->shoe()->price())
          bestShoe = guest;

        QDate rsvpDate;
        QObject *attached = qmlAttachedPropertiesObject<BirthdayParty>(guest, false);

        if (attached)
          rsvpDate = attached->property("rsvp").toDate();
        if (rsvpDate.isNull())
          qWarning() << "   " << guest->name() << "RSVP date: Hasn't RSVP'd";
        else
          qWarning() << "   " << guest->name() << "RSVP date:" <<
                        qPrintable(rsvpDate.toString());
      }
      if (bestShoe)
        qWarning() << bestShoe->name() << "is wearing the best shoes!";

      party->startParty();
    }
    else {
      qWarning() << component.errors();
    }

    return app.exec();
}
