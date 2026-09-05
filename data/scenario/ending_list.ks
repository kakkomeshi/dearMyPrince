[_tb_system_call storage=system/_ending_list.ks]

[cm]

; ============================================================
; 1. 全画面HTML/CSSコンテナの一括構築
; ============================================================
[html]
<div id="ed_list_wrapper" style="
  position: absolute;
  top: 0;
  left: 0;
  width: 960px;
  height: 640px;
  background-color: rgba(15, 18, 25, 0.88);
  font-family: sans-serif;
  box-sizing: border-box;
  padding: 30px 80px;
  z-index: 9999;
  user-select: none;
">
  <!-- 画面タイトル -->
  <div style="
    text-align: center;
    color: #ffffff;
    font-size: 28px;
    font-weight: bold;
    letter-spacing: 2px;
    margin-bottom: 20px;
    text-shadow: 0 2px 4px rgba(0,0,0,0.5);
  ">
    ENDING LIST
  </div>

  <!-- リスト用パネル（座布団） -->
  <div id="ed_list_container" style="
    width: 800px;
    height: 410px;
    background-color: rgba(31, 35, 45, 0.90);
    border: 1.5px solid #D4C291;
    border-radius: 8px;
    padding: 20px 25px;
    box-sizing: border-box;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.6);
    overflow-y: auto;
  ">
    <!-- JS(iscript) でここにエンディング一覧が流し込まれます -->
  </div>

  <!-- BACKボタン（HTML内へ包含） -->
  <div style="text-align: center; margin-top: 20px;">
    <button class="ed_back_btn" onclick="TYRANO.kag.ftag.startTag('jump', {target: '*back'});">
      BACK
    </button>
  </div>
</div>

<style>
/* 戻るボタン専用スタイル */
.ed_back_btn {
  background: rgba(0, 0, 0, 0.5);
  border: 1px solid #D4C291;
  color: #ffffff;
  padding: 8px 45px;
  font-size: 16px;
  font-weight: bold;
  border-radius: 4px;
  cursor: pointer;
  transition: all 0.2s ease;
  letter-spacing: 1px;
}
.ed_back_btn:hover {
  background: rgba(212, 194, 145, 0.3);
  border-color: #ffffff;
  transform: translateY(-2px);
}
</style>
[endhtml]

; ============================================================
; 2. システムフラグ(sf.)判定 ＆ 動的HTML生成
; ============================================================
[iscript]
// エンディングデータの定義
var edData = [
    {
        id: "01",
        flag: sf.ed01_continue,
        title: "TRUE END ～これからも君のコーチだ～",
        status: "CLEAR",
        type: "TRUE"
    },
    {
        id: "02",
        flag: sf.ed02_goodbye,
        title: "NORMAL END 〜またね、コーチ〜",
        status: "CLEAR",
        type: "NORMAL"
    },
    {
        id: "03",
        flag: sf.ed03_change,
        title: "BITTER END 〜コーチ、チェンジで〜",
        status: "CLEAR",
        type: "NORMAL"
    },
    {
        id: "04",
        flag: sf.ed04_endOfContract,
        title: "NORMAL END 〜契約終了〜",
        status: "CLEAR",
        type: "NORMAL"
    },
    {
        id: "05",
        flag: sf.ed05_dependent,
        title: "SECRET END 〜二人だけの秘密〜",
        status: "CLEAR",
        type: "SECRET"
    }
];

var htmlContent = '<div style="display: flex; flex-direction: column; gap: 10px;">';

for (var i = 0; i < edData.length; i++) {
    var ed = edData[i];
    var isUnlocked = (ed.flag === true);

    var displayTitle = isUnlocked ? ed.title : "？？？？？？？？？？？？？？";
    var displayStatus = isUnlocked ? "CLEAR" : "未解放";
    
    var numColor = isUnlocked ? "#D4C291" : "#666666";
    var titleColor = isUnlocked ? "#FFFFFF" : "#888888";
    var statusColor = isUnlocked ? "#81C784" : "#555555";
    

    htmlContent += `
        <div style="
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: rgba(255, 255, 255, 0.04);
            border-bottom: 1px solid rgba(212, 194, 145, 0.15);
            padding: 10px 15px;
            border-radius: 4px;
            font-size: 15px;
        ">
            <div style="display: flex; align-items: center; gap: 20px;">
                <span style="color: ${numColor}; font-weight: bold; font-family: monospace; font-size: 17px;">${ed.id}</span>
                <span style="color: ${titleColor}; letter-spacing: 1px;">${displayTitle}</span>
            </div>
            <span style="
                color: ${statusColor};
                font-weight: bold;
                font-size: 13px;
                padding: 3px 12px;
                background-color: rgba(0, 0, 0, 0.4);
                border-radius: 3px;
                min-width: 65px;
                text-align: center;
            ">${displayStatus}</span>
        </div>
    `;
}

htmlContent += '</div>';

// 生成したコンテンツを流し込み
$('#ed_list_container').html(htmlContent);
[endscript]

[s]

*back
[cm]
[iscript]
// 画面退出時にコンテナをまるごと破棄
$('#ed_list_wrapper').remove();
[endscript]
[jump storage="title_screen.ks" target="*title"]
[s]