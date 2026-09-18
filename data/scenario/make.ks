;このファイルは削除しないでください！
;
;make.ks はデータをロードした時に呼ばれる特別なKSファイルです。
;Fixレイヤーの初期化など、ロード時点で再構築したい処理をこちらに記述してください。
;
;現在は、シナリオ選択画面からとはじめからのときも呼び出しています
;awakegameの時も呼び出されてるらしい
;return 必須



; ; ヘッダーを表示
[iscript]
// タイトルからコンフィグを表示した場合はタイトルに戻ったときにヘッダーを表示しないようにする
if (TYRANO.kag.variable.sf.from_title_config) {
    TYRANO.kag.variable.sf.from_title_config = false;
} else {
    if (window.showTopHeader) {
        window.showTopHeader();
    }
}
[endscript]

; ----------------------------------------------------
; ロード直後にシステムボタンを復活させる
; ----------------------------------------------------
; すでにロールボタンが作成されている場合は、一度綺麗に消してから再生成する
[clearfix name="role_btn"]

; ロールボタンの生成（共通の name="role_btn" を付与）
[button role="auto" graphic="auto_icon.png" x="810" y="410" width="90" height="30" name="role_btn"]
[button role="skip" graphic="skip_icon.png" x="710" y="410" width="90" height="30" name="role_btn"]
[button role="backlog" graphic="log_icon.png" x="610" y="410" width="90" height="30" name="role_btn"]

[return]