
(function () {

    function isIOS() {
        const ua = navigator.userAgent || navigator.vendor || window.opera;

        // iPhone / iPad / iPod（従来）
        if (/iPad|iPhone|iPod/.test(ua)) {
            return true;
        }

        // iPadOS 13以降（MacのUAを名乗るがタッチ対応）
        if (navigator.platform === 'MacIntel' && navigator.maxTouchPoints > 1) {
            return true;
        }

        return false;
    }

    let resumed = false;

    function resumeAudio() {
        if (resumed) return;
        resumed = true;

        try {
            // WebAudio復帰
            if (window.Howler && Howler.ctx && Howler.ctx.state === "suspended") {
                Howler.ctx.resume();
            }

            // TyranoScriptのBGMが停止していたら再開
            if (window.TYRANO && TYRANO.kag && TYRANO.kag.stat.current_bgm) {
                const kag = TYRANO.kag;

                if (!kag.tmp.is_bgm_play) {
                    kag.ftag.startTag("playbgm", {
                        storage: kag.stat.current_bgm,
                        loop: kag.stat.bgm_loop,
                        volume: kag.stat.bgm_volume
                    });
                }
            }

        } catch (e) {
            console.log("Audio resume error:", e);
        }
    }

    //iphone系の場合のみ復帰処理
    if (isIOS()) {

        // ① アプリ復帰検知
        document.addEventListener("visibilitychange", function () {

            if (!document.hidden) {
                alert("ゲームに復帰しました");
                resumeAudio();
            }

        });

        // ② iOS対策：タップ時に確実に復帰
        document.addEventListener("touchstart", resumeAudio, { once: true });

    }

})();

