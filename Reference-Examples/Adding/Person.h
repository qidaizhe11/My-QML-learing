#ifndef PERSON_H
#define PERSON_H

#include <QObject>
#include <QColor>

class ShoeDescription : public QObject
{
  Q_OBJECT
  Q_PROPERTY(int size READ size WRITE setSize NOTIFY shoeChanged)
  Q_PROPERTY(QColor color READ color WRITE setColor NOTIFY shoeChanged)
  Q_PROPERTY(QString brand READ brand WRITE setBrand NOTIFY shoeChanged)
  Q_PROPERTY(qreal price READ price WRITE setPrice NOTIFY shoeChanged)

public:
  ShoeDescription (QObject *parent = 0);

  int size() const { return m_size; }
  void setSize(int size);

  QColor color() const;
  void setColor(const QColor &color);

  QString brand() const;
  void setBrand(const QString &brand);

  qreal price() const { return m_price; }
  void setPrice(qreal price);

signals:
  void shoeChanged();

private:
  int m_size;
  QColor m_color;
  QString m_brand;
  qreal m_price;
};

class Person : public QObject
{
  Q_OBJECT
  Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
//  Q_PROPERTY(int shoeSize READ shoeSize WRITE setShoeSize)
  Q_PROPERTY(ShoeDescription *shoe READ shoe CONSTANT)

public:
  explicit Person(QObject *parent = 0);

  QString name() const { return m_name; }
  void setName(const QString& n);

//  int shoeSize() const { return m_shoeSize; }
//  void setShoeSize(int s) { m_shoeSize = s; }

  ShoeDescription *shoe();

signals:
  void nameChanged();

public slots:

private:
  QString m_name;
//  int m_shoeSize;
  ShoeDescription m_shoe;
};

class Boy : public Person
{
  Q_OBJECT

public:
  Boy(QObject *parent = 0);
};

class Girl : public Person
{
  Q_OBJECT
public:
  Girl(QObject *parent = 0);
};

#endif // PERSON_H
