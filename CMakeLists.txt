cmake_minimum_required(VERSION 3.16)

project(QMLCom VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 6.2 REQUIRED COMPONENTS Quick QuickControls2)


qt_add_executable(appQMLCom
    main.cpp
    res.qrc
)

set_source_files_properties(FlatUI.qml
        PROPERTIES
                QT_QML_SINGLETON_TYPE true
)

qt_add_qml_module(appQMLCom
    URI QMLCom
    VERSION 1.0
    QML_FILES Main.qml
    QML_FILES ButtonStyle.qml FlatUI.qml Style.qml
    QML_FILES Button.qml
    QML_FILES ImageButton.qml
    RESOURCES res.qrc
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appQMLCom PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appQMLCom
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appQMLCom
    PRIVATE Qt6::Quick Qt6::QuickControls2
)

include(GNUInstallDirs)
install(TARGETS appQMLCom
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
