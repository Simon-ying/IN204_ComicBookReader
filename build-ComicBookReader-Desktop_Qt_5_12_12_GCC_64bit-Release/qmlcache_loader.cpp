#include <QtQml/qqmlprivate.h>
#include <QtCore/qdir.h>
#include <QtCore/qurl.h>

static const unsigned char qt_resource_tree[] = {
0,
0,0,0,0,2,0,0,0,6,0,0,0,1,0,0,0,
84,0,0,0,0,0,1,0,0,0,0,0,0,0,148,0,
0,0,0,0,1,0,0,0,0,0,0,0,192,0,0,0,
0,0,1,0,0,0,0,0,0,0,214,0,0,0,0,0,
1,0,0,0,0,0,0,0,8,0,0,0,0,0,1,0,
0,0,0,0,0,0,46,0,0,0,0,0,1,0,0,0,
0};
static const unsigned char qt_resource_names[] = {
0,
1,0,0,0,47,0,47,0,16,12,18,163,124,0,67,0,
117,0,115,0,116,0,111,0,109,0,83,0,108,0,105,0,
100,0,101,0,114,0,46,0,113,0,109,0,108,0,16,13,
176,223,252,0,67,0,117,0,115,0,116,0,111,0,109,0,
66,0,117,0,116,0,116,0,111,0,110,0,46,0,113,0,
109,0,108,0,29,0,146,104,124,0,67,0,117,0,115,0,
116,0,111,0,109,0,83,0,101,0,112,0,97,0,114,0,
97,0,116,0,111,0,114,0,72,0,111,0,114,0,105,0,
122,0,111,0,110,0,116,0,97,0,108,0,46,0,113,0,
109,0,108,0,19,3,194,159,220,0,67,0,117,0,115,0,
116,0,111,0,109,0,83,0,101,0,112,0,97,0,114,0,
97,0,116,0,111,0,114,0,46,0,113,0,109,0,108,0,
8,8,1,90,92,0,109,0,97,0,105,0,110,0,46,0,
113,0,109,0,108,0,24,9,8,213,156,0,67,0,117,0,
115,0,116,0,111,0,109,0,83,0,108,0,105,0,100,0,
101,0,114,0,86,0,101,0,114,0,116,0,105,0,99,0,
97,0,108,0,46,0,113,0,109,0,108};
static const unsigned char qt_resource_empty_payout[] = { 0, 0, 0, 0, 0 };
QT_BEGIN_NAMESPACE
extern Q_CORE_EXPORT bool qRegisterResourceData(int, const unsigned char *, const unsigned char *, const unsigned char *);
QT_END_NAMESPACE
namespace QmlCacheGeneratedCode {
namespace _0x5f__CustomSliderVertical_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f__main_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f__CustomSeparator_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f__CustomSeparatorHorizontal_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f__CustomButton_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f__CustomSlider_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}

}
namespace {
struct Registry {
    Registry();
    ~Registry();
    QHash<QString, const QQmlPrivate::CachedQmlUnit*> resourcePathToCachedUnit;
    static const QQmlPrivate::CachedQmlUnit *lookupCachedUnit(const QUrl &url);
};

Q_GLOBAL_STATIC(Registry, unitRegistry)


Registry::Registry() {
        resourcePathToCachedUnit.insert(QStringLiteral("/CustomSliderVertical.qml"), &QmlCacheGeneratedCode::_0x5f__CustomSliderVertical_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/main.qml"), &QmlCacheGeneratedCode::_0x5f__main_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/CustomSeparator.qml"), &QmlCacheGeneratedCode::_0x5f__CustomSeparator_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/CustomSeparatorHorizontal.qml"), &QmlCacheGeneratedCode::_0x5f__CustomSeparatorHorizontal_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/CustomButton.qml"), &QmlCacheGeneratedCode::_0x5f__CustomButton_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/CustomSlider.qml"), &QmlCacheGeneratedCode::_0x5f__CustomSlider_qml::unit);
    QQmlPrivate::RegisterQmlUnitCacheHook registration;
    registration.version = 0;
    registration.lookupCachedQmlUnit = &lookupCachedUnit;
    QQmlPrivate::qmlregister(QQmlPrivate::QmlUnitCacheHookRegistration, &registration);
QT_PREPEND_NAMESPACE(qRegisterResourceData)(/*version*/0x01, qt_resource_tree, qt_resource_names, qt_resource_empty_payout);
}

Registry::~Registry() {
    QQmlPrivate::qmlunregister(QQmlPrivate::QmlUnitCacheHookRegistration, quintptr(&lookupCachedUnit));
}

const QQmlPrivate::CachedQmlUnit *Registry::lookupCachedUnit(const QUrl &url) {
    if (url.scheme() != QLatin1String("qrc"))
        return nullptr;
    QString resourcePath = QDir::cleanPath(url.path());
    if (resourcePath.isEmpty())
        return nullptr;
    if (!resourcePath.startsWith(QLatin1Char('/')))
        resourcePath.prepend(QLatin1Char('/'));
    return unitRegistry()->resourcePathToCachedUnit.value(resourcePath, nullptr);
}
}
int QT_MANGLE_NAMESPACE(qInitResources_qml)() {
    ::unitRegistry();
    return 1;
}
Q_CONSTRUCTOR_FUNCTION(QT_MANGLE_NAMESPACE(qInitResources_qml))
int QT_MANGLE_NAMESPACE(qCleanupResources_qml)() {
    return 1;
}
