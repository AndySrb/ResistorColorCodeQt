#include <QGuiApplication>
#include <QQmlApplicationEngine>
//#include <QtWebEngine/qtwebengineglobal.h>
#include <QtWebView/QtWebView>
#include <QtSvg>


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);


    //QtWebEngine::initialize();

    QtWebView::initialize();

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
