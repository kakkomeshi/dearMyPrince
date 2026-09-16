; マクロを読み込む
[call storage="macro.ks"]

;cssファイルの読み込み
[loadcss file="./data/others/css/custom.css"]


; 画面の初期化処理が終わったらスピナーを消す
[iscript]
$('#loading_spinner').fadeOut(500, function(){
    $(this).remove();
});
[endscript]

[return]