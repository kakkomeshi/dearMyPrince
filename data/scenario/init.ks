; ゲーム起動時に1回first.ksから呼び出される初期化処理。マクロやcssなど全体で使うものなどを追加する

; 自作マクロの読み込み
[call storage="macro.ks"]


; cssファイルの読み込み
[loadcss file="./data/others/css/custom.css"]
[loadcss file="./data/others/css/menu.css"]
[loadcss file="./data/others/css/dialog.css"]
[loadcss file="./data/others/css/header.css"]
[loadcss file="./data/others/css/warning_modal.css"]
[loadcss file="./data/others/css/date_jump.css"]
[loadcss file="./data/others/css/config.css"]
[loadcss file="./data/others/css/ending_list.css"]

; jsファイルの読み込み
[loadjs storage="js/dialog.js" ]
[loadjs storage="js/header.js" ]
[loadjs storage="data/chapter_data.js"]
[loadjs storage="js/waring_modal.js"]
[loadjs storage="js/menu.js"]
[loadjs storage="js/system_buttons.js"]
[loadjs storage="data/ending_data.js"]
[loadjs storage="js/ending_list.js"]

[return]