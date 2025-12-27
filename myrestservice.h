#ifndef MYRESTSERVICE_H
#define MYRESTSERVICE_H

#include <QObject>
#include <QSharedPointer>
#include <QJsonObject>
#include <QJsonArray>
#include <QJsonDocument>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QUrl>

class MyRestService : public QObject
{
    Q_OBJECT
public:
    explicit MyRestService(QObject *parent = nullptr);

signals:

};

#endif // MYRESTSERVICE_H
