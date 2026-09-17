
(function () {
    console.log("【チェック1】override_dialog.js が読み込まれました");

    // ティラノの初期化が完全に終わるのを待つ
    $(window).on("load", function () {
        initConfirmHook();
    });

    // 念のため即時・少し遅延でもフックを仕込んでおく
    setTimeout(initConfirmHook, 1000);

    function initConfirmHook() {
        if (window.isConfirmHooked) return; // 二重実行防止
        window.isConfirmHooked = true;

        console.log("【チェック2】$.confirm の上書きを実行します");

        // $.confirm を自作ダイアログ（openConfirm）で上書き
        $.confirm = function (message, ready, cancel) {
            console.log("【チェック3】$.confirm が呼び出されました！メッセージ:", message);

            let yesText = "は い";
            let noText = "いいえ";

            try {
                const masterDialog = TYRANO.kag.ftag.master_tag.dialog_config;
                if (masterDialog && masterDialog.j_ok && masterDialog.j_ok.text()) {
                    yesText = masterDialog.j_ok.text();
                }
                if (masterDialog && masterDialog.j_cancel && masterDialog.j_cancel.text()) {
                    noText = masterDialog.j_cancel.text();
                }
            } catch (e) {}

            // 自作ダイアログの呼び出し
            openConfirm(
                message,
                function () {
                    if (typeof ready === "function") ready();
                },
                yesText,
                noText,
                "SAVE OVERWRITE"
            );
        };

        console.log("【チェック4】$.confirm の上書きが完了しました");
    }
})();