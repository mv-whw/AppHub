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
    Q_INVOKABLE bool loginUser(QString user_name,QString password);
signals:

private:
    QList<MyUser*> m_logUsers;
};

#endif // MYAPP_H
