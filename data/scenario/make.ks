;このファイルは削除しないでください！
;
;make.ks はデータをロードした時に呼ばれる特別なKSファイルです。
;Fixレイヤーの初期化など、ロード時点で再構築したい処理をこちらに記述してください。
;
;現在は、シナリオ選択画面からとはじめからのときも呼び出しています
;
;return 必須

; 好感度表示
[debug_init]
; menuボタン表示
[button fix="true" auto_next="false"  name="btn_menu" graphic="button/menu_icon.png" width="100px" height="100px" x="20" y="20" storage="menu.ks" role="sleepgame"]

; ----------------------------------------------------
; ロード直後にシステムボタンを復活させる
; ----------------------------------------------------

; 1. 一度メッセージウィンドウ関連のファイルを呼び出して、ボタンなどを再定義する
[button role="auto" graphic="auto_icon.png" x="810" y="410" width="90" height="30"]
[button role="skip" graphic="skip_icon.png" x="710" y="410" width="90" height="30"]
[button role="backlog" graphic="log_icon.png" x="610" y="410" width="90" height="30"]


[return]