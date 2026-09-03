; =========================
; デバッグ好感度表示
; =========================


[macro name="love"]

[eval exp="f.love = Number(f.love) + Number(mp.value)"]

[iscript]
$("#debug_love").text(
"好感度：" + TYRANO.kag.stat.f.love
);
[endscript]

[endmacro]


; =========================
; デバッグ好感度表示領域作成
; =========================


[macro name="debug_init"]

[iscript]
if (typeof TYRANO.kag.stat.f.love === "undefined") {
TYRANO.kag.stat.f.love = 0;
}
if ($("#debug_love").length === 0) {
$("#tyrano_base").append(
'<div id="debug_love" style="' +
'position:absolute;' +
'top:20px;' +
'left:820px;' +
'z-index:999999;' +
'background:rgba(0,0,0,0.7);' +
'color:white;' +
'padding:6px 10px;' +
'font-size:18px;' +
'pointer-events:none;' +
'">好感度：' + TYRANO.kag.stat.f.love + '</div>'
);
}
$("#debug_love").text(
"好感度：" + TYRANO.kag.stat.f.love
);
[endscript]

[endmacro]


; =========================
; デバッグ好感度表示を削除
; =========================


[macro name="debug_hide"]

[iscript]
$("#debug_love").remove();
[endscript]

[endmacro]


; =========================
; BGMミュート切替
; =========================


[macro name="bgm_mute"]

[iscript]
if (typeof TYRANO.kag.variable.sf.bgm_mute === "undefined") {
TYRANO.kag.variable.sf.bgm_mute = false;
}
if (TYRANO.kag.variable.sf.bgm_mute === false) {
TYRANO.kag.variable.sf.bgm_mute = true;
TYRANO.kag.stat.play_bgm = false;
$(".bgm_mute_button").attr(
"src",
"./data/image/bgm_off.png"
);
} else {
TYRANO.kag.variable.sf.bgm_mute = false;
TYRANO.kag.stat.play_bgm = true;
$(".bgm_mute_button").attr(
"src",
"./data/image/bgm_on.png"
);
}
[endscript]

[endmacro]

; =========================
; 周囲信頼度の計算
; =========================
[macro name="trust"]
[eval exp="f.trust = Number(f.trust) + Number(mp.value)"]
[endmacro]

; =========================
; リョーマ依存度の計算
; =========================
[macro name="ryoma_dep"]
[eval exp="f.ryoma_dep = Number(f.ryoma_dep) + Number(mp.value)"]
[endmacro]

; =========================
; マイナス選択肢のカウント
; =========================
[macro name="minus_count"]
[eval exp="f.minus_count += 1"]
[endmacro]