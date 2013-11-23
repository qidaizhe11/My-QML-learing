#include "BirthdayParty.h"

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
