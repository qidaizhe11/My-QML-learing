#include "BirthdayParty.h"

BirthdayPartyAttached::BirthdayPartyAttached(QObject *object)
  : QObject(object)
{
}

QDate BirthdayPartyAttached::rsvp() const
{
  return m_rsvp;
}

void BirthdayPartyAttached::setRsvp(const QDate &date)
{
  m_rsvp = date;
}


BirthdayParty::BirthdayParty(QObject *parent) :
  QObject(parent), m_host(0)
{
}

Person *BirthdayParty::host() const
{
  return m_host;
}

void BirthdayParty::setHost(Person *host)
{
  m_host = host;
}

QQmlListProperty<Person> BirthdayParty::guests()
{
  return QQmlListProperty<Person>(this, m_guests);
}

int BirthdayParty::guestCount() const
{
  return m_guests.count();
}

Person *BirthdayParty::guest(int index) const
{
  return m_guests.at(index);
}

QString BirthdayParty::announcement() const
{
  return QString();
}

void BirthdayParty::setAnnouncement(const QString &str)
{
  qWarning() << qPrintable(str);
}

void BirthdayParty::invite(const QString &name)
{
  Person *person = new Person(this);
  person->setName(name);
  m_guests.append(person);
}

void BirthdayParty::startParty()
{
  QTime time = QTime::currentTime();
  emit partyStarted(time);
}

BirthdayPartyAttached *BirthdayParty::qmlAttachedProperties(QObject *object)
{
  return new BirthdayPartyAttached(object);
}
