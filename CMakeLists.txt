cmake_minimum_required(VERSION 3.30)

project(AppHub VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick Svg)

qt_standard_project_setup(REQUIRES 6.10)

set_source_files_properties(MyTheme.qml SystemAppInfo.qml PROPERTIES QT_QML_SINGLETON_TYPE ON)

qt_add_executable(appAppHub
    main.cpp
)

qt_add_qml_module(appAppHub
    URI AppHub
    VERSION 1.0
    QML_FILES
        Main.qml
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
        QML_FILES KoledarComponents/KolMonth.qml
        QML_FILES SystemAppInfo.qml
        QML_FILES BasicComponents/MyDropArea.qml
        QML_FILES
        QML_FILES KoledarComponents/KolMonthView.qml
        QML_FILES KoledarComponents/KolWeekView.qml
        QML_FILES Controls/MyDayPicker.qml
        QML_FILES KoledarComponents/KolTime.qml
        QML_FILES Controls/MyUpDown.qml
        QML_FILES Controls/MyTimePicker.qml
        QML_FILES Controls/MyAppWindow.qml
        QML_FILES TabComponents/MyTab.qml
        QML_FILES TabComponents/MyClasicTab.qml
        QML_FILES TabComponents/CloseButton.qml
        QML_FILES ComponentsSettings/MyTabTheme.qml
        QML_FILES TabComponents/MyNavTab.qml
        QML_FILES TabComponents/MyRotatedTab.qml
        RESOURCES Icons/account_balance.svg Icons/account_box.svg Icons/account_circle.svg Icons/account_circle_off.svg Icons/account_tree.svg Icons/ad_group.svg Icons/add.svg Icons/add_alert.svg Icons/add_box.svg Icons/add_circle.svg Icons/add_task.svg Icons/admin_panel_setings.svg Icons/alarm.svg Icons/anchor.svg Icons/api.svg Icons/app_registration.svg Icons/apps.svg Icons/arrow_back.svg Icons/arrow_forward.svg Icons/auto_delete.svg Icons/autorenew.svg Icons/bar_chart.svg Icons/barcode.svg Icons/barcode_scanner.svg Icons/block.svg Icons/bookmark.svg Icons/bookmarks.svg Icons/bottom_navigation.svg Icons/bottom_panel_close.svg Icons/bottom_panel_open.svg Icons/build.svg Icons/cached.svg Icons/calendar_check.svg Icons/calendar_month.svg Icons/calendar_today.svg Icons/call.svg Icons/cancel.svg Icons/category.svg Icons/category_search.svg Icons/chat.svg Icons/check_box.svg Icons/close.svg Icons/close_fullscreen.svg Icons/code.svg Icons/content_copy.svg Icons/dangerous.svg Icons/dark_mode.svg Icons/dashboard.svg Icons/dataset.svg Icons/date_range.svg Icons/delete.svg Icons/delete_forever.svg Icons/deployed_code.svg Icons/deployed_code_account.svg Icons/deployed_code_history.svg Icons/deployed_code_update.svg Icons/description.svg Icons/desktop.svg Icons/devices.svg Icons/download.svg Icons/download_2.svg Icons/drag_indicator.svg Icons/drag_pan.svg Icons/edit_48dp.svg Icons/edit_calendar.svg Icons/edit_note.svg Icons/edit_notifications.svg Icons/empty_dashboard.svg Icons/error.svg Icons/event.svg Icons/event_available.svg Icons/event_list.svg Icons/exit_to_app.svg Icons/expand_circle_down.svg Icons/file_json.svg Icons/file_open.svg Icons/filter.svg Icons/filter_list.svg Icons/folder.svg Icons/fullscreen.svg Icons/grid_view.svg Icons/group.svg Icons/group_add.svg Icons/groups.svg Icons/heart_plus.svg Icons/help.svg Icons/history.svg Icons/home.svg Icons/html.svg Icons/http.svg Icons/image.svg Icons/info.svg Icons/info_i.svg Icons/javascript.svg Icons/keep_off.svg Icons/key.svg Icons/language.svg Icons/left_panel_close.svg Icons/left_panel_open.svg Icons/license.svg Icons/light_mode.svg Icons/lightbulb.svg Icons/link.svg Icons/linked_services.svg Icons/list.svg Icons/lock.svg Icons/lock_open.svg Icons/lock_open_circle.svg Icons/lock_open_right.svg Icons/lock_person.svg Icons/login.svg Icons/logout.svg Icons/mail.svg Icons/manage_accounts.svg Icons/menu.svg Icons/menu_open.svg Icons/more_horiz.svg Icons/more_vert.svg Icons/mouse.svg Icons/new_window.svg Icons/no_accounts.svg Icons/note_add.svg Icons/notification_add.svg Icons/notifications.svg Icons/open_in_full.svg Icons/open_in_new.svg Icons/paid.svg Icons/palette.svg Icons/pause.svg Icons/pending.svg Icons/person.svg Icons/person_add.svg Icons/person_add_disabled.svg Icons/person_cancel.svg Icons/person_edit.svg Icons/person_remove.svg Icons/photo_camera.svg Icons/php.svg Icons/pinboard.svg Icons/play_arrow.svg Icons/preview.svg Icons/priority_high.svg Icons/problem.svg Icons/public.svg Icons/publish.svg Icons/qr_code.svg Icons/qr_code_scanner.svg Icons/question_mark.svg Icons/refresh.svg Icons/release_alert.svg Icons/reply.svg Icons/restart.svg Icons/right_panel_close.svg Icons/save.svg Icons/save_as.svg Icons/saved_search.svg Icons/schedule.svg Icons/search.svg Icons/search_activity.svg Icons/search_gear.svg Icons/send.svg Icons/settings.svg Icons/settings_account.svg Icons/settings_application.svg Icons/share.svg Icons/side_navigation.svg Icons/splitscreen_landscape.svg Icons/stacked_bar_chart.svg Icons/star.svg Icons/star_rate.svg Icons/stop.svg Icons/swap_horiz.svg Icons/swap_vert.svg Icons/sync.svg Icons/sync_alt.svg Icons/sync_problem.svg Icons/tab.svg Icons/tab_group.svg Icons/tablet.svg Icons/task.svg Icons/test.svg Icons/thumb_down.svg Icons/thumb_up.svg Icons/timer_pause.svg Icons/timer_play.svg Icons/today.svg Icons/translate.svg Icons/tune.svg Icons/undo.svg Icons/unfold_more.svg Icons/update.svg Icons/upgrade.svg Icons/upload.svg Icons/upload_2.svg Icons/upload_file.svg Icons/view_apps.svg Icons/visibility.svg Icons/visibility_lock.svg Icons/visibility_off.svg Icons/warning.svg Icons/web_asset.svg Icons/webhook.svg Icons/work.svg
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
