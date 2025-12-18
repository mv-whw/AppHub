#ifndef MYRESTSERVICE_H
#define MYRESTSERVICE_H

#include <QObject>

class MyRestService : public QObject
{
    Q_OBJECT
public:
    explicit MyRestService(QObject *parent = nullptr);

signals:

};

#endif // MYRESTSERVICE_H
