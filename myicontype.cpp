#include "myicontype.h"

MyIconType::MyIconType(QObject *parent)
    : QObject{parent}
{
    loadIconData();
}

QString MyIconType::getIconPath(const QString iconName)
{
    return m_icons.value(iconName,"");
}

QStringList MyIconType::getAllNames()
{
    return m_icons.keys();
}

QStringList MyIconType::getAllPath()
{
    return m_icons.values();
}

bool MyIconType::loadIconData()
{
    QStringList list;
    m_icons.clear();
    list<<"account_balance"<<"account_box"<<"account_circle"<<"account_circle_off"<<"account_tree"<<"ad_group"<<"add"<<"add_alert"<<"add_box"<<"add_circle"<<"add_task"<<"admin_panel_setings"<<"alarm"<<"anchor"<<"api"<<"app_registration"<<"apps"<<"arrow_back"<<"arrow_forward"<<"auto_delete"<<"autorenew"<<"bar_chart"<<"barcode"<<"barcode_scanner"<<"block"<<"bookmark"<<"bookmarks"<<"bottom_navigation"<<"bottom_panel_close"<<"bottom_panel_open"<<"build"<<"cached"<<"calendar_check"<<"calendar_month"<<"calendar_today"<<"call"<<"cancel" <<"category"<<"category_search"<<"chat"<<"check_box"<<"close"<<"close_fullscreen"<<"code"<<"content_copy"<<"dangerous"<<"dark_mode"<<"dashboard"<<"dataset"<<"date_range"<<"delete"<<"delete_forever"<<"deployed_code"<<"deployed_code_account"<<"deployed_code_history"<<"deployed_code_update"<<"description"<<"desktop"<<"devices"<<"download"<<"download_2"<<"drag_indicator"<<"drag_pan"<<"edit_48dp"<<"edit_calendar"<<"edit_note"<<"edit_notifications"<<"empty_dashboard"<<"error"<<"event"<<"event_available"<<"event_list"<<"exit_to_app"<<"expand_circle_down"<<"file_json"<<"file_open"<<"filter"<<"filter_list"<<"folder"<<"fullscreen"<<"grid_view"<<"group"<<"group_add"<<"groups"<<"heart_plus"<<"help"<<"history"<<"home"<<"html"<<"http"<<"image"<<"info"<<"info_i"<<"javascript"<<"keep_off"<<"key"<<"language"<<"left_panel_close"<<"left_panel_open"<<"license"<<"light_mode"<<"lightbulb"<<"link"<<"linked_services"<<"list"<<"lock"<<"lock_open"<<"lock_open_circle"<<"lock_open_right"<<"lock_person"<<"login"<<"logout"<<"mail"<<"manage_accounts"<<"menu"<<"menu_open"<<"more_horiz"<<"more_vert"<<"mouse"<<"new_window"<<"no_accounts"<<"note_add"<<"notification_add"<<"notifications"<<"open_in_full"<<"open_in_new"<<"paid"<<"palette"<<"pause"<<"pending"<<"person"<<"person_add"<<"person_add_disabled"<<"person_cancel"<<"person_edit"<<"person_remove"<<"photo_camera"<<"php"<<"pinboard"<<"play_arrow"<<"preview"<<"priority_high"<<"problem"<<"public"<<"publish"<<"qr_code"<<"qr_code_scanner"<<"question_mark"<<"refresh"<<"release_alert"<<"reply"<<"restart"<<"right_panel_close"<<"save"<<"save_as"<<"saved_search"<<"schedule"<<"search"<<"search_activity"<<"search_gear"<<"send"<<"settings"<<"settings_account"<<"settings_application"<<"share"<<"side_navigation"<<"splitscreen_landscape"<<"stacked_bar_chart"<<"star"<<"star_rate"<<"stop"<<"swap_horiz"<<"swap_vert"<<"sync"<<"sync_alt"<<"sync_problem"<<"tab"<<"tab_group"<<"tablet"<<"task"<<"test"<<"thumb_down"<<"thumb_up"<<"timer_pause"<<"timer_play"<<"today"<<"translate"<<"tune"<<"undo"<<"unfold_more"<<"update"<<"upgrade"<<"upload"<<"upload_2"<<"upload_file"<<"view_apps"<<"visibility"<<"visibility_lock"<<"visibility_off"<<"warning"<<"web_asset"<<"webhook"<<"work";
    for(const QString &child: list)
    {
        m_icons.insert(child,"qrc:/qt/qml/AppHub/Icons/"+child+".svg");
    }
    return true;
}


