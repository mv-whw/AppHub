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

