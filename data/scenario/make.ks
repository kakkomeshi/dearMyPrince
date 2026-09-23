;このファイルは削除しないでください！
;
;make.ks はデータをロードした時に呼ばれる特別なKSファイルです。
;Fixレイヤーの初期化など、ロード時点で再構築したい処理をこちらに記述してください。
;
;現在は、シナリオ選択画面からとはじめからのときも呼び出しています
;awakegameの時も呼び出されてるらしい
;return 必須



; ヘッダー、システムボタンを表示
[iscript]
  // タイトルからコンフィグを表示した場合はタイトルに戻ったときにヘッダーとシステムボタンを表示しないようにする
  if (TYRANO.kag.variable.sf.from_title_config) {
    TYRANO.kag.variable.sf.from_title_config = false;
  } else {
    if (window.showTopHeader) {
      window.showTopHeader();
      loadSystemButtons();
    }
  }
[endscript]

[return]