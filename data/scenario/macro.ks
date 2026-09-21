; ============================================================
; 画面上部ヘッダーバー（日付・メーター・MENUボタン統合版）
; ============================================================
[macro name="show_top_header"]
  [iscript]
    // すでにヘッダー要素が画面に存在する場合は二重生成をスキップ
    if ($("#top_header_bar").length > 0) {
      // 必要に応じて再表示（非表示状態からの復元用）
      $("#top_header_bar").show();
    } else {
      // 存在しない時のみ関数を実行してヘッダーを生成
      showTopHeader();
    }
  [endscript]
[endmacro]

; =========================
; 章・日付設定用マクロ定義
; =========================
[macro name="set_chapter"]
[iscript]
// マクロの引数 id (例: id="part1_day0") からデータを取得
var id = mp.id;
var data = window.CHAPTER_DATA ? window.CHAPTER_DATA[id] : null;

if (data) {
    // 1. セーブデータ用変数に格納
    f.chapterTitle = data.saveTitle;
    
    // 2. ヘッダー表示用変数に格納
    f.headerDay = data.headerDay;
    f.headerSubTitle = data.subTitle;
}
// ヘッダーの表示を更新
updateTopHeader();
[endscript]
[endmacro]


; =========================
; デバッグ好感度表示
; =========================
; [macro name="love"]

; [eval exp="f.love = Number(f.love) + Number(mp.value)"]

; [iscript]
; $("#debug_love").text(
; "好感度：" + TYRANO.kag.stat.f.love
; );
; // ヘッダーのメーターを更新
; updateTopHeader();
; [endscript]


; [endmacro]


; =========================
; デバッグ好感度表示領域作成
; =========================


; [macro name="debug_init"]

; [iscript]
; if (typeof TYRANO.kag.stat.f.love === "undefined") {
; TYRANO.kag.stat.f.love = 0;
; }
; if ($("#debug_love").length === 0) {
; $("#tyrano_base").append(
; '<div id="debug_love" style="' +
; 'position:absolute;' +
; 'top:20px;' +
; 'left:820px;' +
; 'z-index:999999;' +
; 'background:rgba(0,0,0,0.7);' +
; 'color:white;' +
; 'padding:6px 10px;' +
; 'font-size:18px;' +
; 'pointer-events:none;' +
; '">好感度：' + TYRANO.kag.stat.f.love + '</div>'
; );
; }
; $("#debug_love").text(
; "好感度：" + TYRANO.kag.stat.f.love
; );
; [endscript]

; [endmacro]


; =========================
; デバッグ好感度表示を削除
; =========================


; [macro name="debug_hide"]

; [iscript]
; $("#debug_love").remove();
; [endscript]

; [endmacro]


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

; ============================================================
; エンディング演出共通マクロ (ed_finish)
; ============================================================
[macro name="ed_finish"]
; BGMを2秒かけてフェードアウト
[stopbgm time="2000" fadeout="true"]

; メッセージとウィンドウを残したまま2.5秒間じっくり見せる
[wait time="2500"]

; 1秒かけて黒く暗転（フェードアウト）
[mask time="1000" color="0x000000"]

; 画面クリア処理
[cm]
[clearfix]

; タイトル画面へ遷移
[jump storage="title_screen.ks" target=""]
[endmacro]

; =========================
; 好感度増減 ＆ 演出連動マクロ
; 使い方: [love value="1"] や [love value="-1"]
; =========================
[macro name="love"]

; 1. 変数の更新（加算値を取得して f.love を計算）
[eval exp="tf.change = Number(mp.value || 0)"]
[eval exp="f.love = Number(f.love || 0) + tf.change"]

[iscript]

// ヘッダーバーのゲージ＆テキスト更新
if (typeof updateTopHeader === "function") {
    updateTopHeader();
}

// 2. メーターの演出アニメーション発火
var change = tf.change;
var $target = $('#header_meter_fill, #header_meter_icon'); // アニメーションさせる対象

if ($target.length > 0 && change !== 0) {
    // 既存のアニメーションクラスを一度取り除く
    $target.removeClass('meter_anim_up meter_anim_down');
    
    // 再描画（リフロー）を挟んでからアニメーションクラスを付与
    void $target[0].offsetWidth; 

    if (change > 0) {
        // 上昇時：ポッっと膨らんで光る
        $target.addClass('meter_anim_up');
    } else if (change < 0) {
        // 下降時：ガタガタ揺れて暗くなる
        $target.addClass('meter_anim_down');
    }

    // アニメーション完了後にクラスを自動削除
    setTimeout(function(){
        $target.removeClass('meter_anim_up meter_anim_down');
    }, 700);
}
[endscript]

[endmacro]