

;メニューボタン非表示
; [hidemenubutton]

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

