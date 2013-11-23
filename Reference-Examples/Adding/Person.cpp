#include "Person.h"

ShoeDescription::ShoeDescription(QObject *parent)
  : QObject(parent), m_size(0), m_price(0)
{
}

QColor ShoeDescription::color() const
{
  return m_color;
}

void ShoeDescription::setColor(const QColor &color)
{
  m_color = color;
}

QString ShoeDescription::brand() const
{
  return m_brand;
}

void ShoeDescription::setBrand(const QString &brand)
{
  m_brand = brand;
}


Person::Person(QObject *parent) :
  QObject(parent)
{
}

ShoeDescription *Person::shoe()
{
  return &m_shoe;
}
