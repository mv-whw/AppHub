#ifndef MYICONTYPE_H
#define MYICONTYPE_H

#include <QObject>
#include <QQmlEngine>
#include <QFile>
#include <QDir>
#include <QFileInfo>

class MyIconType : public QObject
{
    Q_OBJECT
    QML_SINGLETON
    QML_ELEMENT
public:
    explicit MyIconType(QObject *parent = nullptr);
    Q_INVOKABLE QString getIconPath(const QString iconName);
    Q_INVOKABLE QStringList getAllNames();
    Q_INVOKABLE QStringList getAllPath();
signals:
protected:
    bool loadIconData();
private:
    QMap<QString,QString> m_icons;
};

#endif // MYICONTYPE_H
