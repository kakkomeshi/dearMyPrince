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
    if (typeof TYRANO === "undefined" || !TYRANO.kag || !TYRANO.kag.stat) return;

    var f = TYRANO.kag.stat.f || {};

    // 1. 日付
    var dateText = f.headerDay || "DAY 0";
    $("#header_date_text").text(dateText);

    // 2. 状況
    var statusText = f.headerSubTitle || "プロローグ";
    $("#header_status_text").text(statusText);

    // 3. 章に応じたデザイン
    if (f.currentChapterId &&
        typeof window.updateHeaderStyle === "function") {

        window.updateHeaderStyle(f.currentChapterId);
    }

    // 4. 好感度メーター
    headerUiTimer();
};

//ヘッダーを隠す
window.hideTopHeader = function () {
    $("#top_header_bar").remove();
}

// --- MENUボタン押下時のイベント ---
$(document).off('click.headerMenu touchstart.headerMenu', '#header_menu_btn')
    .on('click.headerMenu touchstart.headerMenu', '#header_menu_btn', function (e) {

        // ⚡ スマホの「0.3秒遅延」と「擬似ホバー」を完全に無効化する
        e.preventDefault();

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

//　ヘッダーのデザインを部ごとに変更する
window.updateHeaderStyle = function (chapterId) {
    var header = $("#top_header_bar");
    if (header.length === 0) {
        return;
    }
    if (chapterId.indexOf("part2") === 0) {
        // --- 第二部デザイン（デフォルト） ---
        $('#top_header_bar').removeClass('part1_header part3_header').addClass('part2_header');
        // メーターのアイコンやラベル表記を「依存度」などに差し替え
        $('#header_meter_label').html('🌟').css('color', '#D39097');

    } else if (chapterId.indexOf("part3") === 0) {
        // --- 第三部デザイン（デフォルト） ---
        $('#top_header_bar').removeClass('part1_header part2_header').addClass('part3_header');
        // メーターのアイコンやラベル表記を「執着・逃走」などに差し替え
        $('#header_meter_label').html('⛓️').css('color', '#FF4D4D');
    }
    else {
        // --- 第一部デザイン（デフォルト） ---
        $('#top_header_bar').removeClass('part2_header part3_header').addClass('part1_header');
        $('#header_meter_label').html('🎾').css('color', '#D4C291');
    }
};
