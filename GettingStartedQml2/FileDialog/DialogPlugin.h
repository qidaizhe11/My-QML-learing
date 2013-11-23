#ifndef DIALOGPLUGIN_H
#define DIALOGPLUGIN_H

#include <QtQml/QQmlExtensionPlugin>

class DialogPlugin : public QQmlExtensionPlugin
{
  Q_OBJECT
  Q_PLUGIN_METADATA(IDD "org.qt-project.QmlExtensionPlugin.FileDialog")

public:
  DialogPlugin();
};

#endif // DIALOGPLUGIN_H
