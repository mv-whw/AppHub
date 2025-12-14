#include "myicontype.h"
#include <QDir>
#include <QFile>
#include <QCoreApplication>

MyIconType::MyIconType(QObject *parent)
    : QObject{parent}
{
    loadIconData();
}

QString MyIconType::getIconPath(const QString iconName)
{
    return m_icons.value(iconName,"");
}

QStringList MyIconType::getAllNames()
{
    return m_icons.keys();
}

QStringList MyIconType::getAllPath()
{
    return m_icons.values();
}

bool MyIconType::loadIconData()
{
    QStringList list;
    m_icons.clear();

    QDir res(":/qt/qml/AppHub/Icons");
    QStringList entry= res.entryList(QDir::Filter::Files);
    QString name="";
    for(const QString &child: entry)
    {
        name=child;
        name.remove(name.lastIndexOf('.'),name.length()-name.lastIndexOf('.'));
        m_icons.insert(name,"qrc:/qt/qml/AppHub/Icons/"+child);
    }

    return true;
}




