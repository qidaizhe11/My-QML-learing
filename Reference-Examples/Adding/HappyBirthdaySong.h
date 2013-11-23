#ifndef HAPPYBIRTHDAYSONG_H
#define HAPPYBIRTHDAYSONG_H

#include <QQmlPropertyValueSource>
#include <QQmlProperty>
#include <qqml.h>

#include <QStringList>

class HappyBirthdaySong : public QObject, public QQmlPropertyValueSource
{
  Q_OBJECT
  Q_INTERFACES(QQmlPropertyValueSource)
  Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
public:
  explicit HappyBirthdaySong(QObject *parent = 0);

  virtual void setTarget(const QQmlProperty &);

  QString name() const { return m_name; }
  void setName(const QString &name);

signals:
  void nameChanged();

public slots:

private slots:
  void advance();

private:
  int m_line;
  QStringList m_lyrics;
  QQmlProperty m_target;
  QString m_name;
};

#endif // HAPPYBIRTHDAYSONG_H
