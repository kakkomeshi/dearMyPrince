// data/others/js/ending_list.js

(function() {
    window.itemsPerPage = 6;
    window.currentEdPage = 1;

    // 画面初期化処理
    window.initEdListScreen = function() {
        $('#ed_list_wrapper').remove(); // 重複防止

        $.get('./data/html/ending_list.html', function(htmlData) {
            $('#tyrano_base').append(htmlData);
            window.renderEdPage(window.currentEdPage || 1);
        });
    };

    // リスト描画関数
    window.renderEdPage = function(page) {
        // 外部化したデータファイルから取得
        var edData = (typeof window.getEndingData === 'function') ? window.getEndingData() : [];
        var totalPages = Math.ceil(edData.length / window.itemsPerPage) || 1;
        
        window.currentEdPage = page;

        var startIndex = (page - 1) * window.itemsPerPage;
        var endIndex = Math.min(startIndex + window.itemsPerPage, edData.length);
        var pageItems = edData.slice(startIndex, endIndex);

        var htmlContent = '<div class="ed_item_list_box">';

        for (var i = 0; i < pageItems.length; i++) {
            var ed = pageItems[i];
            var isUnlocked = (ed.flag === true);

            var displayTitle = isUnlocked ? ed.title : "？？？？？？？？？？？？？？";
            var displayStatus = isUnlocked ? "CLEAR" : "未解放";
            var stateClass = isUnlocked ? "unlocked" : "locked";

            htmlContent += `
                <div class="ed_item_row ${stateClass}">
                    <div class="ed_item_left">
                        <span class="ed_item_id">${ed.id}</span>
                        <span class="ed_item_title">${displayTitle}</span>
                    </div>
                    <span class="ed_item_status">${displayStatus}</span>
                </div>
            `;
        }

        htmlContent += '</div>';

        // 流し込み ＆ ページ数更新
        $('#ed_list_container').html(htmlContent);
        $('.pager_num_display').text(window.currentEdPage + ' / ' + totalPages);
    };

    // ページ切り替え関数（ループ対応）
    window.changeEdPage = function(dir) {
        var edData = (typeof window.getEndingData === 'function') ? window.getEndingData() : [];
        var totalPages = Math.ceil(edData.length / window.itemsPerPage) || 1;

        if (dir === 1) {
            window.currentEdPage = (window.currentEdPage >= totalPages) ? 1 : window.currentEdPage + 1;
        } else if (dir === -1) {
            window.currentEdPage = (window.currentEdPage <= 1) ? totalPages : window.currentEdPage - 1;
        }
        window.renderEdPage(window.currentEdPage);
    };

    // 画面破棄関数
    window.closeEdListScreen = function() {
        $('#ed_list_wrapper').fadeOut(200, function() {
            $(this).remove();
        });
    };
})();