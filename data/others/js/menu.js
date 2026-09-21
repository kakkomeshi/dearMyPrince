$(function() {

    // ① コンフィグボタンを押した時
    $(document).off('click.myConfig', '.my_menu_config')
               .on('click.myConfig', '.my_menu_config', function (e) {
        e.stopPropagation();

        var isSmartphone = /iPhone|Android.+Mobile|iPad|Android/i.test(navigator.userAgent);
        var isMobileWidth = window.innerWidth <= 768;

        let menul = $(".layer.layer_menu");
        $(".display_menu.menu").removeClass("menu");
        $(menul).empty().hide();

        if (typeof hideTopHeader === 'function') {
            hideTopHeader();
        } else if ($('#top_header_bar').length > 0) {
            $('#top_header_bar').hide();
        }

        $(document).off('awakegame.restoreHeader').on('awakegame.restoreHeader', function() {
            setTimeout(function() {
                if (typeof showTopHeader === 'function') {
                    showTopHeader();
                } else if ($('#top_header_bar').length > 0) {
                    $('#top_header_bar').show();
                }
                $(document).off('awakegame.restoreHeader');
            }, 50);
        });

        TYRANO.kag.variable.sf.from_title_config = false;

        if (isSmartphone || isMobileWidth) {
            TYRANO.kag.ftag.startTag("sleepgame", { storage: "config_mobile.ks", next: false });
        } else {
            TYRANO.kag.ftag.startTag("sleepgame", { storage: "config.ks", next: false });
        }
    });

    // ② タイトルへ戻るボタンを押した時
    $(document).off('click.myTitle', '.my_menu_back_title')
               .on('click.myTitle', '.my_menu_back_title', function (e) {
        e.stopPropagation();

        openConfirm("タイトル画面に戻ります。よろしいですか？\n（保存していないデータは消去されます）",
            function () {
                $(".layer_menu").empty().hide();
                $(".display_menu").removeClass("menu");
                TYRANO.kag.ftag.startTag("jump", { storage: "title_screen.ks" });
            });
    });

    // ③ ゲームへ戻る（CLOSE）ボタンを押した時
    $(document).off('click.myClose', '.my_menu_window_close')
               .on('click.myClose', '.my_menu_window_close', function (e) {
        e.stopPropagation();

        let menul = $(".layer.layer_menu");
        $(".display_menu.menu").removeClass("menu");
        $(menul).empty().hide();

        TYRANO.kag.ftag.startTag("awakegame", {}, function() {
            TYRANO.kag.tmp.cut_nextorder = null;
        });
    });

});