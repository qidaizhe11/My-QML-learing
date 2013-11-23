#ifndef BIRTHDAYPARTY_H
#define BIRTHDAYPARTY_H

#include <QObject>
#include <QQmlListProperty>
#include "Person.h"

class BirthdayParty : public QObject
{
  Q_OBJECT
  Q_PROPERTY(Person *host READ host WRITE setHost)
  Q_PROPERTY(QQmlListProperty<Person> guests READ guests)

public:
  explicit BirthdayParty(QObject *parent = 0);

  Person *host() const;
  void setHost(Person *host);

  QQmlListProperty<Person> guests();
  int guestCount() const;
  Person *guest(int index) const;

signals:

public slots:

private:
  Person *m_host;
  QList<Person *> m_guests;
};

#endif // BIRTHDAYPARTY_H
