#ifndef MYUSER_H
#define MYUSER_H

#include <QObject>
#include <QQmlEngine>

class MyUser : public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:
    explicit MyUser(QObject *parent = nullptr);
    MyUser(QString uname,QString upass,QObject *parent = nullptr);
signals:
private:
    QString m_name;
    QString m_token;
};

#endif // MYUSER_H
