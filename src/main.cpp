#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "../include/imgprovider.h"
#include "../include/cache.h"


QCache<int,ImageData> cache;
QReadWriteLock cache_lock;
bool g_is_page_current_changed;
bool g_is_path_changed;
bool g_is_preload_run;
std::mutex g_preload_mutex;
std::condition_variable g_preload_cv;
int g_page_num_total;
std::string g_archive_path;
PreloadParams g_preload_params;
bool g_is_exit; //program finished
int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    qRegisterMetaType<PreloadParams>("PreloadParams");

    ImgProvider* img_provider_ptr = new ImgProvider;
    engine.addImageProvider(QString("ImageProvider"), img_provider_ptr);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));


    if (engine.rootObjects().isEmpty())
        return -1;
    img_provider_ptr->setRootObject(engine.rootObjects().first());
    QObject* fileDiag_ptr = engine.rootObjects().first()->findChild<QObject*>("FileDialog");
    QObject::connect(fileDiag_ptr, SIGNAL(setFilePathSignal(QString)),
		img_provider_ptr, SLOT(filePathSlot(QString)));
    return app.exec();
}
