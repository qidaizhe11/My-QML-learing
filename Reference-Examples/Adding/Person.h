#ifndef PERSON_H
#define PERSON_H

#include <QObject>

class Person : public QObject
{
  Q_OBJECT
  Q_PROPERTY(QString name READ name WRITE setName)
  Q_PROPERTY(int shoeSize READ shoeSize WRITE setShoeSize)

public:
  explicit Person(QObject *parent = 0);

  QString name() const { return m_name; }
  void setName(const QString& n) { m_name = n; }

  int shoeSize() const { return m_shoeSize; }
  void setShoeSize(int s) { m_shoeSize = s; }

signals:

public slots:

private:
  QString m_name;
  int m_shoeSize;
};

#endif // PERSON_H
