#ifndef BIRTHDAYPARTY_H
#define BIRTHDAYPARTY_H

#include <QObject>
#include <QDate>
#include <QDebug>
//#include <QQmlListProperty>
#include <qqml.h>
#include "Person.h"

class BirthdayPartyAttached : public QObject
{
  Q_OBJECT
  Q_PROPERTY(QDate rsvp READ rsvp WRITE setRsvp)

public:
  BirthdayPartyAttached(QObject *object);

  QDate rsvp() const;
  void setRsvp(const QDate &date);

private:
  QDate m_rsvp;
};

class BirthdayParty : public QObject
{
  Q_OBJECT
  Q_PROPERTY(Person *host READ host WRITE setHost)
  Q_PROPERTY(QQmlListProperty<Person> guests READ guests)
  Q_PROPERTY(QString announcement READ announcement WRITE setAnnouncement)
  Q_CLASSINFO("DefaultProperty", "guests")

public:
  explicit BirthdayParty(QObject *parent = 0);

  Person *host() const;
  void setHost(Person *host);

  QQmlListProperty<Person> guests();
  int guestCount() const;
  Person *guest(int index) const;

  QString announcement() const;
  void setAnnouncement(const QString &str);

  Q_INVOKABLE void invite(const QString &name);

  static BirthdayPartyAttached *qmlAttachedProperties(QObject *);

  void startParty();

signals:
  void partyStarted(const QTime &time);

public slots:

private:
  Person *m_host;
  QList<Person *> m_guests;
};

QML_DECLARE_TYPEINFO(BirthdayParty, QML_HAS_ATTACHED_PROPERTIES)

#endif // BIRTHDAYPARTY_H
