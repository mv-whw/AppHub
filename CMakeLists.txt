cmake_minimum_required(VERSION 3.30)

project(AppHub VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick Svg)

qt_standard_project_setup(REQUIRES 6.10)

set_source_files_properties(MyTheme.qml PROPERTIES QT_QML_SINGLETON_TYPE ON)

qt_add_executable(appAppHub
    main.cpp
)

qt_add_qml_module(appAppHub
    URI AppHub
    VERSION 1.0
    QML_FILES
        Main.qml
        RESOURCES Icons/account_circle.svg Icons/add.svg Icons/bar_chart.svg Icons/barcode.svg Icons/barcode_reader.svg Icons/barcode_scanner.svg Icons/calendar_month.svg Icons/calendar_today.svg Icons/calendar_view_week.svg Icons/chat.svg Icons/contact_page.svg Icons/dark_mode.svg Icons/date_range.svg Icons/delete.svg Icons/edit.svg Icons/error.svg Icons/event.svg Icons/favorite.svg Icons/frame_person.svg Icons/group.svg Icons/help.svg Icons/home.svg Icons/image.svg Icons/info.svg Icons/key.svg Icons/language.svg Icons/light_mode.svg Icons/link.svg Icons/logout.svg Icons/manage_accounts.svg Icons/menu.svg Icons/notifications.svg Icons/notifications_active.svg Icons/palette.svg Icons/person.svg Icons/person_add.svg Icons/person_cancel.svg Icons/public.svg Icons/publish.svg Icons/qr_code.svg Icons/qr_code_scanner.svg Icons/save.svg Icons/schedule.svg Icons/search.svg Icons/send.svg Icons/settings.svg Icons/table_view.svg Icons/test.svg Icons/today.svg Icons/upload.svg Icons/visibility.svg Icons/visibility_lock.svg Icons/visibility_off.svg Icons/wallpaper.svg Icons/warning.svg Icons/webhook.svg
        QML_FILES BasicComponents/MyLabel.qml
        QML_FILES MyTheme.qml
        QML_FILES BasicComponents/MyRectangle.qml
        QML_FILES BasicComponents/MyImage.qml
        QML_FILES BasicComponents/MyMouseArea.qml
        QML_FILES BasicComponents/MyIcon.qml
        QML_FILES Controls/MyButton.qml
        QML_FILES ComponentsSettings/MyButtonTheme.qml
        QML_FILES ComponentsSettings/MyControlsCommonTheme.qml
        QML_FILES ComponentsSettings/MyTextFieldAreaTheme.qml
        QML_FILES Controls/MyTextField.qml
        QML_FILES Controls/MyTextArea.qml
        QML_FILES Controls/MyFrame.qml
        QML_FILES ComponentsSettings/MyFrameGroupBoxTheme.qml
        QML_FILES
        QML_FILES DialogComponents/DialogHeaderIcon.qml
        QML_FILES DialogComponents/ResponceButtons.qml
        QML_FILES
        QML_FILES Controls/MyGroupBox.qml
        QML_FILES Controls/MyProgressBar.qml
        QML_FILES Controls/MySwitch.qml
        QML_FILES Controls/MySlider.qml
        QML_FILES Controls/MyRangeSlider.qml
        QML_FILES DialogComponents/MyDialog.qml
        QML_FILES Controls/MyMessageDialog.qml
        QML_FILES KoledarComponents/KolChangeButton.qml
        QML_FILES KoledarComponents/KolDataPanel.qml
        QML_FILES KoledarComponents/KolDataBar.qml
        QML_FILES KoledarComponents/KolDay.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appAppHub PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appAppHub
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appAppHub
    PRIVATE Qt6::Quick Qt6::Svg
)

include(GNUInstallDirs)
install(TARGETS appAppHub
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
