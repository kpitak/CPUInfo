#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <cpuinfo.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QScopedPointer<CPUInfo> CPUInfoPtr(new CPUInfo);
    engine.rootContext()->setContextProperty("cpuInfoData", CPUInfoPtr.data());
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}

