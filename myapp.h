#ifndef MYAPP_H
#define MYAPP_H

#include <QObject>
#include <QQmlEngine>
#include "myuser.h"

class MyApp : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON
public:
    explicit MyApp(QObject *parent = nullptr);
    Q_INVOKABLE QString returnAppName();
    Q_INVOKABLE QString returnAppVersion();
    Q_INVOKABLE bool loginUser();
    Q_INVOKABLE bool registerAndLoginUser();
signals:

};

#endif // MYAPP_H
