// ① 注意書き画面を生成し、ローディングスピナーを消す関数
window.showWarningModal = function () {
    // 外部HTML（注意書き）を読み込んで注入
    $.get('./data/html/warning_modal.html', function (data) {
        $('#tyrano_base').append(data);

        // ★注意書きHTMLの準備が整ったので、ここでローディングスピナーを消去する！
        $('#loading_spinner').fadeOut(400, function () {
            $(this).remove();
        });
    });
};

window.initAudioAndStart = function () {
    // BGM,SEの音量を1000にする
    TYRANO.kag.variable.tf.current_bgm_vol = 100;
    TYRANO.kag.variable.tf.current_se_vol = 100;
    TYRANO.kag.variable.tf.config_bgm_muted = false;
    TYRANO.kag.variable.tf.config_se_muted = false;
    TYRANO.kag.ftag.startTag("bgmopt", { volume: TYRANO.kag.variable.tf.current_bgm_vol });
    TYRANO.kag.ftag.startTag("seopt", { volume: TYRANO.kag.variable.tf.current_se_vol });
    TYRANO.kag.saveSystemVariable();

    // Tyrano側の「音声再生準備完了」を先に成立させる
    if (TYRANO && TYRANO.kag) {
        TYRANO.kag.readyAudio();
    }

    $('#first_audio_modal').fadeOut(300, function () {
        $(this).remove();

        if (TYRANO && TYRANO.kag && TYRANO.kag.ftag) {
            TYRANO.kag.ftag.startTag("jump", {
                storage: "title_screen.ks",
                target: "*title"
            });
        }
    });
};


window.muteAudioAndStart = function () {

    // BGM,SEの音量を0にする
    TYRANO.kag.variable.tf.current_bgm_vol = 0;
    TYRANO.kag.variable.tf.current_se_vol = 0;
    TYRANO.kag.variable.tf.config_bgm_muted = true;
    TYRANO.kag.variable.tf.config_se_muted = true;
    TYRANO.kag.ftag.startTag("bgmopt", { volume: TYRANO.kag.variable.tf.current_bgm_vol });
    TYRANO.kag.ftag.startTag("seopt", { volume: TYRANO.kag.variable.tf.current_se_vol });
    TYRANO.kag.saveSystemVariable();

    // Tyrano側の「音声再生準備完了」を先に成立させる
    if (TYRANO && TYRANO.kag) {
        TYRANO.kag.readyAudio();
    }

    $('#first_audio_modal').fadeOut(300, function () {
        $(this).remove();

        if (TYRANO && TYRANO.kag && TYRANO.kag.ftag) {
            TYRANO.kag.ftag.startTag("jump", {
                storage: "title_screen.ks",
                target: "*title"
            });
        }
    });
};