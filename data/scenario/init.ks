; ゲーム起動時に1回first.ksから呼び出される初期化処理。マクロやcssなど全体で使うものなどを追加する

; 自作マクロの読み込み
[call storage="macro.ks"]

; cssファイルの読み込み
[loadcss file="./data/others/css/custom.css"]


; 画面の初期化処理が終わったらローディングスピナーを消す処理
[iscript]
$('#loading_spinner').fadeOut(500, function(){
    $(this).remove();
});
[endscript]

[return]