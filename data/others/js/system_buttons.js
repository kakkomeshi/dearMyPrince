// システムボタンHTMLを読み込む
window.loadSystemButtons = function () {

    if ($("#system_buttons").length > 0 || window.systemButtonsLoading) {
        return;
    }

    window.systemButtonsLoading = true;

    $.get("./data/html/system_buttons.html", function (html_str) {

        if ($("#system_buttons").length === 0) {
            $("#tyrano_base").append(html_str);
        }

    }).always(function () {
        window.systemButtonsLoading = false;
    });
};


// システムボタンのクリック処理
$(document)
    .off("click.systemButtons", "#system_buttons .sys_log")
    .on("click.systemButtons", "#system_buttons .sys_log", function () {
        TYRANO.kag.ftag.startTag("showlog", {});
    });

$(document)
    .off("click.systemButtons", "#system_buttons .sys_skip")
    .on("click.systemButtons", "#system_buttons .sys_skip", function () {
        TYRANO.kag.ftag.startTag("skipstart", {});
    });

$(document)
    .off("click.systemButtons", "#system_buttons .sys_auto")
    .on("click.systemButtons", "#system_buttons .sys_auto", function () {
        TYRANO.kag.ftag.startTag("autostart", {});
    });