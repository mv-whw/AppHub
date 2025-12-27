#include "myapp.h"

MyApp::MyApp(QObject *parent)
    : QObject{parent}
{}

QString MyApp::returnAppName()
{
    return "dpAppHub";
}

QString MyApp::returnAppVersion()
{
    return "0.0.1alpha";
}

bool MyApp::loginUser(QString user_name, QString password)
{
    m_logUsers.append(new MyUser(user_name,password));
    return true;
}

