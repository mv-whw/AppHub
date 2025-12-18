#include "myuser.h"

MyUser::MyUser(QObject *parent)
    : QObject{parent}
{}

MyUser::MyUser(QString uname, QString upass, QObject *parent)
    :QObject{parent}
{

}
