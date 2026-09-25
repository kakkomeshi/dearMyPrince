[iscript]
(function(){
    // 1. スマホ・タブレット判定（UA または 画面幅768px以下）
    var isSmartphone = /iPhone|Android.+Mobile|iPad|Android/i.test(navigator.userAgent);
    var isMobileWidth = window.innerWidth <= 768;
    var isMobile = isSmartphone || isMobileWidth;

    // 2. #tyrano_base にCSS用クラスを付与
    if (isMobile) {
        $('#tyrano_base').addClass('is-sp').removeClass('is-pc');
    } else {
        $('#tyrano_base').addClass('is-pc').removeClass('is-sp');
    }

    // 3. TG.stat.sf または sf の初期化
    if (typeof TYRANO !== 'undefined' && TYRANO.kag && TYRANO.kag.stat) {
        TYRANO.kag.stat.sf = TYRANO.kag.stat.sf || {};
        TYRANO.kag.stat.sf.is_mobile = isMobile;
    } else if (typeof sf !== 'undefined') {
        sf.is_mobile = isMobile;
    }
})();
[endscript]

;初期化処理
[call storage="init.ks"]

;ゲームに必要なライブラリ読み込み
[call storage="system/tyrano.ks"]
[call storage="system/builder.ks"]
[call storage="system/chara_define.ks"]
[call storage="system/chara_layer_define.ks"]


;live2D対応


[layopt layer=2 visible=true]
[layopt layer="message0" visible=false]
[call storage="system/message_window.ks"]

;プラグインの設定
[call storage="system/plugin.ks"]
[call storage="system/plugin_third.ks"]
[loadjs storage="js/override.js" ]

;タイトルの設定
[title name="DearMyPrince"]

[tb_hide_message_window]
; 注意書き画面を呼出してタイトル画面へ
[iscript]
  window.showWarningModal();
[endscript]
