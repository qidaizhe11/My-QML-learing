#include "Person.h"

ShoeDescription::ShoeDescription(QObject *parent)
  : QObject(parent), m_size(0), m_price(0)
{
}

void ShoeDescription::setSize(int size)
{
  if (m_size == size)
    return;

  m_size = size;
  emit shoeChanged();
}

QColor ShoeDescription::color() const
{
  return m_color;
}

void ShoeDescription::setColor(const QColor &color)
{
  if (m_color == color)
    return;

  m_color = color;
  emit shoeChanged();
}

QString ShoeDescription::brand() const
{
  return m_brand;
}

void ShoeDescription::setBrand(const QString &brand)
{
  if (m_brand == brand)
    return;

  m_brand = brand;
  emit shoeChanged();
}

void ShoeDescription::setPrice(qreal price)
{
  if (m_price == price)
    return;

  m_price = price;
  emit shoeChanged();
}


Person::Person(QObject *parent) :
  QObject(parent)
{
}

void Person::setName(const QString &n)
{
  if (m_name == n)
    return;

  m_name = n;
  emit nameChanged();
}

ShoeDescription *Person::shoe()
{
  return &m_shoe;
}

Boy::Boy(QObject *parent)
  : Person(parent)
{
}

Girl::Girl(QObject *parent)
  : Person(parent)
{
}
