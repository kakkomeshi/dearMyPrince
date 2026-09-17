; ゲーム起動時に1回first.ksから呼び出される初期化処理。マクロやcssなど全体で使うものなどを追加する

; 自作マクロの読み込み
[call storage="macro.ks"]

; cssファイルの読み込み
[loadcss file="./data/others/css/custom.css"]
[loadcss file="./data/others/css/menu.css"]
[loadcss file="./data/others/css/dialog.css"]

; jsファイルの読み込み
[loadjs storage="js/dialog.js" ]

[return]