//ヘッダーを表示する
window.showTopHeader = function () {
    if ($("#top_header_bar").length > 0) {
        return;
    }
    $.get("./data/html/header.html", function (html_str) {
        $("#tyrano_base").append(html_str);
        // ヘッダー生成後の初期処理
        updateTopHeader();
    });
};

//ヘッダーを更新する
window.updateTopHeader = function () {
    //TODO：ここ今の表示地じゃないやつに更新されてしまうので、要修正

    // 日付
    $("#header_date_text").text("9月15日 (火)");

    // 状況
    $("#header_status_icon").text("☀️");
    $("#header_status_text").text("放課後 ・ テニスコート");

    // 好感度
    headerUiTimer();
};

//ヘッダーを隠す
window.hideTopHeader = function () {
    $("#top_header_bar").remove();
}

// --- MENUボタン押下時のイベント ---
$(document).off('click.headerMenu', '#header_menu_btn')
    .on('click.headerMenu', '#header_menu_btn', function (e) {

        // ティラノスクリプトのメニューを開く
        if (TYRANO && TYRANO.kag && TYRANO.kag.ftag) {
            TYRANO.kag.menu.showMenu({
                currentTarget: $(e.currentTarget)
            });

        }
    });

// --- リアルタイムメーター更新 ---
window.headerUiTimer = function () {
    var fill = $("#header_meter_fill");

    if (fill.length === 0) {
        return;
    }

    var f = TYRANO.kag.stat.f;
    var maxLove = f.max_love || 53;
    var currentLove = f.love || 0;

    var percent = Math.min(
        100,
        Math.max(0, (currentLove / maxLove) * 100)
    );

    fill.css("width", percent + "%");
}

var originalNextOrderWithLabel =
    TYRANO.kag.ftag.nextOrderWithLabel;

TYRANO.kag.ftag.nextOrderWithLabel = function (label_name, scenario_file) {

    if (scenario_file &&
        scenario_file !== TYRANO.kag.stat.current_scenario) {

        updateHeaderStyle(scenario_file);
    }

    return originalNextOrderWithLabel.apply(this, arguments);
};

//　ヘッダーのデザインを部ごとに変更する
window.updateHeaderStyle = function (scenario_file) {
    var header = $("#top_header_bar");

    if (header.length === 0) {
        return;
    }
    if (scenario_file.indexOf("part2") === 0) {
        // --- 第二部デザイン（デフォルト） ---
        $('#top_header_bar').removeClass('part1_header part3_header').addClass('part2_header');
        // メーターのアイコンやラベル表記を「依存度」などに差し替え
        $('#header_meter_icon').html('🚗');
        $('#header_meter_label').html('依存度').css('color', '#D39097');

    } else if (scenario_file.indexOf("part3") === 0) {
        // --- 第三部デザイン（デフォルト） ---
        $('#top_header_bar').removeClass('part1_header part2_header').addClass('part3_header');
        // メーターのアイコンやラベル表記を「執着・逃走」などに差し替え
        $('#header_meter_icon').html('🔗');
        $('#header_meter_label').html('執着度').css('color', '#FF4D4D');
    }
    else {
        // --- 第一部デザイン（デフォルト） ---
        $('#top_header_bar').removeClass('part2_header part3_header').addClass('part1_header');
        $('#header_meter_icon').html('🎾');
        $('#header_meter_label').html('好感度').css('color', '#D4C291');
    }
};