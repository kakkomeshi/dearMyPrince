/**
 * 1. 【確認ダイアログ】（はい/いいえ等の2択）
 * @param {string} msgText - メッセージ本文
 * @param {Function} [onYes] - 決定ボタンを押した時の処理
 * @param {string} [yesLabel="は い"] - 決定ボタンの文字
 * @param {string} [noLabel="いいえ"] - キャンセルボタンの文字
 * @param {string} [headerText="CONFIRMATION"] - ヘッダー文字
 */
function openConfirm(msgText, onYes, yesLabel, noLabel, headerText) {
    openBaseDialog({
        text: msgText,
        header: headerText || "CONFIRMATION",
        showNoBtn: true,
        yesLabel: yesLabel || "は い",
        noLabel: noLabel || "いいえ",
        onYes: onYes
    });
}

/**
 * 2. 【アラートダイアログ】（ボタン1つのみ）
 * @param {string} msgText - メッセージ本文
 * @param {Function} [onOK] - 確定ボタンを押した時の処理
 * @param {string} [okLabel="確 認"] - ボタンの文字
 * @param {string} [headerText="NOTIFICATION"] - ヘッダー文字
 */
function openAlert(msgText, onOK, okLabel, headerText) {
    openBaseDialog({
        text: msgText,
        header: headerText || "NOTIFICATION",
        showNoBtn: false,
        yesLabel: okLabel || "確 認",
        onYes: onOK
    });
}

/**
 * 3. 内部共通処理（本体）
 */
function openBaseDialog(config) {
    $("#custom_dialog_wrapper").remove();

    $.get("./data/html/dialog.html", function (html_str) {
        $("body").append(html_str);

        // テキスト・ヘッダー・ボタン文字の反映
        $("#dialog_text_area").text(config.text);
        if (config.header) $(".dialog_header_title").text(config.header);

        // ボタンテキストの差し替え（引数がなければデフォルト値）
        $("#dialog_btn_yes").text(config.yesLabel);
        $("#dialog_btn_no").text(config.noLabel);

        // アラートモード（「いいえ」非表示）の判定
        if (!config.showNoBtn) {
            $("#dialog_btn_no").hide();
        }

        // イベント貫通防止
        $("#custom_dialog_wrapper").on("click keydown mousedown", function (e) {
            e.stopPropagation();
        });

        // 決定ボタンを押した時
        $("#dialog_btn_yes").on("click", function (e) {
            e.stopPropagation();
            $("#custom_dialog_wrapper").remove();
            if (typeof config.onYes === "function") config.onYes();
        });

        // キャンセルボタンを押した時
        $("#dialog_btn_no").on("click", function (e) {
            e.stopPropagation();
            $("#custom_dialog_wrapper").remove();
        });
    });
}