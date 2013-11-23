
#include "HappyBirthdaySong.h"
#include <QTimer>

HappyBirthdaySong::HappyBirthdaySong(QObject *parent) :
  QObject(parent), m_line(-1)
{
  setName(QString());
  QTimer *timer = new QTimer(this);
  QObject::connect(timer, SIGNAL(timeout()), this, SLOT(advance()));
  timer->start(1000);
}

void HappyBirthdaySong::setTarget(const QQmlProperty &p)
{
  m_target = p;
}

void HappyBirthdaySong::setName(const QString &name)
{
  m_name = name;

  m_lyrics.clear();
  m_lyrics << "Happy birthday to you,";
  m_lyrics << "Happy birthday to you,";
  m_lyrics << "Happy birthday dear " + m_name + ",";
  m_lyrics << "Happy birthday to you!";
  m_lyrics << "";

  emit nameChanged();
}

void HappyBirthdaySong::advance()
{
  m_line = (m_line + 1) % m_lyrics.count();

  m_target.write(m_lyrics.at(m_line));
}
