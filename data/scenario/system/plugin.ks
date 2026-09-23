;プラグイン。テーマ読み込み
;ルビ表示
[plugin name=custom_ruby]

;html読み込み
[plugin name=html_read]

;iOSのオーディオ復帰プラグイン
[plugin name="ios_resume_audio"]

;スライダーUI
[plugin name=uiparts_set]

; 名前の表示サイズ変更
[free name="chara_name_area" layer="message0"]
[ptext layer="message0" x="118" y="416" size="20" face="NotoSansJP-VariableFont_wght" color="0xFFFFFF" bold="bold" edge="" shadow="" name="chara_name_area"]

; セーブ＆ロード拡張プラグイン設定
[iscript]
tf.saveload = {
    // --- 枠数と配置設定 ---
    "slot": 6,                    // 1ページあたり6枠
    "slot_column": 2,             // 2列配置（2列×3行）
    "slot_vertical": false,       // 並び順（横方向: 1 2 / 3 4 / 5 6）
    
    // --- セーブリスト全体の位置設定 ---
    "area_x": 80,                 // 全体パネルの左位置
    "area_y": 70,                 // 全体パネルの上位置

    // --- 各スロットカードのサイズと余白（CSS再現） ---
    "slot_width": 530,            // スロットカードの幅
    "slot_height": 135,           // スロットカードの高さ
    "slot_marginx": 0,           // カード同士の横余白
    "slot_marginy": 0,           // カード同士の縦余白

    // --- テキスト・文字色の設定（前作カラー再現） ---
    "num": true,                  // SLOT番号表示
    "num_x": 15,
    "num_y": 10,
    "num_size": 15,
    "num_color": "#D4C291",       // ゴールド

    "date": true,                 // 日付表示
    "date_x": 240,
    "date_y": 10,
    "date_size": 12,
    "date_color": "#888888",      // グレー
    "date_align": "right",

    "exvar": "f.chapterTitle",   // ★章タイトルを表示（f.chapterTitle を参照）
    "var_x": 15,
    "var_y": 45,
    "var_size": 13,
    "var_color": "#ffffff",       // ホワイト
    "var_width": 360,

    // --- ダイアログ・ボタン設定 ---
    "delete": true,               // 削除ボタン有効
    "lock": true,                 // 保護ボタン有効
    "dialog_save": true,
    "dialog_load": true,
    "dialog_overwrite": true,
    "dialog_delete": true,

    // --- 戻るボタンの位置（前作CLOSEボタン付近） ---
    // "back_x": 0,
    // "back_y": 0,

};
[endscript]

; プラグイン読み込み
[plugin name="saveload_ex" saveload="&tf.saveload"]

[return ]