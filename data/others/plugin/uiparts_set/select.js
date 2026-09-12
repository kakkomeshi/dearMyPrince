;(function () {
    /**
     *
     * セレクトボックスUIプラグイン
     *
     */

    /**
     * 変数定義
     */
    const SELECT_ID_POST = "selectbox_ui_"
    const SELECT_COMMON_CLASS = "selectboxui"
    const PARAM_OPTION_POST = "option_"
    const COLOR_COMMON_CLASS = "colortipui"

    /**
     * 関数定義
     */
    const str2var = function (str, val) {
        let ary = str.replace(/\]/g, "").split(/\.|\[/g)
        let variable = window
        if (ary[0] === "f") {
            variable = TYRANO.kag.stat
        } else if (ary[0] === "sf" || ary[0] === "tf") {
            variable = TYRANO.kag.variable
        } else if (ary[0] === "TG") {
            variable = TYRANO.kag
        }
        ary.forEach(function (key) {
            key = key.replace(/"|'/g, "")
            if (val !== undefined) {
                if (typeof variable[key] === "object") {
                    variable = variable[key]
                } else {
                    variable[key] = val
                }
            } else {
                variable = variable[key]
            }
        })
        return variable
    }

    /**
     * タグ定義
     */

    TYRANO.kag.tag.selectbox = {
        vital: ["name", "var"],
        pm: {
            name: "",
            x: "0",
            y: "0",
            width: "300",
            height: "60",
            selected: "0",
            var: "",
            exp: "",
            preexp: "",
            storage: "",
            target: "",
            bg: "white",
            margin_x: "10",
            margin_y: "0",
            font_color: "black",
            font_size: "24",
            font_face: "san-serif",
            thumb_image: "../others/plugin/selectbox_ui/image/arrow.png",
            thumb_width: "32",
            thumb_height: "32",
            thumb_left: "240",
            thumb_top: "14",
            border_radius: "0",
            border_width: "0",
            border_color: "white",
        },
        start(pm) {
            const that = this
            const layer = that.kag.layer.getLayer("fix")

            //オプションリスト作成
            const optionList = []
            Object.keys(pm).forEach((val) => {
                if (val.indexOf(PARAM_OPTION_POST) == 0) {
                    const value = pm[val].split(",")
                    value.unshift(val.replace(PARAM_OPTION_POST, ""))
                    optionList.push(value)
                }
            })

            const j_div = $("<div />")
            j_div.css({
                position: "absolute",
                top: `${pm.y}px`,
                left: `${pm.x}px`,
                width: `${pm.width}px`,
                height: `${pm.height}px`,
                "--thumb-content": `url(../../../image/${pm.thumb_image})`,
                "--thumb-width": `${pm.thumb_width}px`,
                "--thumb-height": `${pm.thumb_height}px`,
                "--thumb-left": `${pm.thumb_left}px`,
                "--thumb-top": `${pm.thumb_top}px`,
                "z-index": 99999999,
            })

            const j_select = $("<select />")
            const selected = {
                color: optionList[0][4],
                face: optionList[0][3],
            }

            optionList.forEach((elm) => {
                const opt = $("<option />")
                opt.attr({
                    value: elm[2] !== undefined ? elm[2] : elm[1],
                    "data-color": elm[4],
                    "data-face": elm[3],
                })
                opt.text(elm[1])
                opt.css({
                    color: elm[4] || pm.font_color,
                    "font-family": elm[3] || pm.font_face,
                })
                //デフォルトで選択状態か
                if (parseInt(pm.selected) === elm[0]) {
                    opt.attr("selected")
                    selected.color = elm[4]
                    selected.face = elm[3]
                }
                j_select.append(opt)
            })

            j_select.attr({
                id: `${SELECT_ID_POST}${pm.name}`,
                name: pm.var,
            })

            j_select.css({
                width: "100%",
                height: "100%",
                border: "none",
                background: pm.bg,
                color: pm.font_color,
                padding: `${pm.margin_y}px ${pm.margin_x}px`,
                border: `${pm.border_width}px solid ${pm.border_color}`,
                "font-size": `${pm.font_size}px`,
                "border-radius": `${pm.border_radius}px`,
            })
            if (pm.selected) {
                j_select.css({
                    color: selected.color,
                    "font-family": selected.face,
                })
            }
            if (that.kag.setElmCursor === undefined) {
                j_select.css({
                    cursor: "pointer",
                })
            } else {
                that.kag.setElmCursor(j_select, "pointer")
            }

            j_select.addClass("fixlayer")
            j_select.addClass(pm.name)
            j_div.addClass(SELECT_COMMON_CLASS)
            layer.append(j_div.append(j_select)).show()

            that.kag.event.addEventElement({
                tag: "selectbox",
                j_target: j_select,
                pm: pm,
            })
            that.setEvent(j_select, pm)

            that.kag.ftag.nextOrder()
        },
        setEvent(j_select, pm) {
            const that = this

            //optionのサイズ調整（画面の拡大率が影響するため）
            j_select.on("mousedown", function () {
                $(this)
                    .find("option")
                    .each(function () {
                        //現在の拡大率
                        const matrix = $("#tyrano_base").css("transform").split(/\(|,/gi)
                        const scale = parseFloat(matrix[1])

                        $(this).css({
                            display: "block",
                            "font-size": `${pm.font_size * scale}px`,
                        })
                    })
            })

            j_select.on("change", function (e) {
                //変数に値代入
                str2var(pm.var, this.value)
                that.kag.saveSystemVariable()

                //フォントと色を反映
                const opt = $(`option[value=${this.value}]`)
                $(this).css({
                    color: opt.attr("data-color") || pm.font_color,
                    "font-family": opt.attr("data-face") || pm.font_face,
                })

                //関数実行
                if (pm.exp != "") {
                    that.kag.embScript(pm.exp, pm.preexp)
                }

                //fixレイヤの場合はcallでスタックが積まれる
                if (pm.storage != "" || pm.target != "") {
                    //コールスタックが帰ってきてない場合は、実行しないようにする必要がある
                    //fixの場合はコールスタックに残る。
                    var stack_pm = that.kag.getStack("call") //最新のコールスタックを取得
                    if (stack_pm == null) {
                        //strong_stopの場合は反応しない
                        var _auto_next = pm.auto_next
                        if (that.kag.stat.is_strong_stop == true) {
                            _auto_next = "stop"
                        }
                        //call実行
                        that.kag.ftag.startTag("call", {
                            storage: pm.storage,
                            target: pm.target,
                            auto_next: _auto_next,
                        })
                    } else {
                        //スタックが残っている場合
                        that.kag.log("callスタックが残っている場合、fixボタンは反応しません")
                        that.kag.log(stack_pm)
                        return false
                    }
                }
            })
        },
    }
    TYRANO.kag.ftag.master_tag.selectbox = TYRANO.kag.tag.selectbox
    TYRANO.kag.ftag.master_tag.selectbox.kag = TYRANO.kag

    TYRANO.kag.tag.colorpicker = {
        vital: ["name", "var"],
        pm: {
            name: "",
            var: "",
            x: "0",
            y: "0",
            width: "100",
            height: "50",
            border_width: "",
            border_color: "",
            storage: "",
            target: "",
            exp: "",
            preexp: "",
        },
        start(pm) {
            const that = this
            const layer = that.kag.layer.getLayer("fix")
            const j_color = $("<input />")
            j_color.attr({
                type: "color",
                name: pm.var,
                value: str2var(pm.var).replace("0x", "#"),
            })
            j_color.css({
                position: "absolute",
                top: `${pm.y}px`,
                left: `${pm.x}px`,
                width: `${pm.width}px`,
                height: `${pm.height}px`,
                border: `${pm.border_width}px solid ${pm.border_color}`,
                background: pm.border_color,
                "z-index": 999999,
            })

            if (that.kag.setElmCursor === undefined) {
                j_select.css({
                    cursor: "pointer",
                })
            } else {
                that.kag.setElmCursor(j_select, "pointer")
            }

            j_color.addClass("fixlayer")
            j_color.addClass(pm.name)
            j_color.addClass(COLOR_COMMON_CLASS)
            layer.append(j_color).show()

            that.kag.event.addEventElement({
                tag: "colortip",
                j_target: j_color,
                pm: pm,
            })
            that.setEvent(j_color, pm)

            that.kag.ftag.nextOrder()
        },
        setEvent(j_color, pm) {
            const that = this

            j_color.on("change", function (e) {
                //変数に値代入
                str2var(pm.var, this.value)

                //関数実行
                if (pm.exp != "") {
                    that.kag.embScript(pm.exp, pm.preexp)
                }

                //fixレイヤの場合はcallでスタックが積まれる
                if (pm.storage != "" || pm.target != "") {
                    //コールスタックが帰ってきてない場合は、実行しないようにする必要がある
                    //fixの場合はコールスタックに残る。
                    var stack_pm = that.kag.getStack("call") //最新のコールスタックを取得
                    if (stack_pm == null) {
                        //strong_stopの場合は反応しない
                        var _auto_next = pm.auto_next
                        if (that.kag.stat.is_strong_stop == true) {
                            _auto_next = "stop"
                        }
                        //call実行
                        that.kag.ftag.startTag("call", {
                            storage: pm.storage,
                            target: pm.target,
                            auto_next: _auto_next,
                        })
                    } else {
                        //スタックが残っている場合
                        that.kag.log("callスタックが残っている場合、fixボタンは反応しません")
                        that.kag.log(stack_pm)
                        return false
                    }
                }
            })
        },
    }
    TYRANO.kag.ftag.master_tag.colorpicker = TYRANO.kag.tag.colorpicker
    TYRANO.kag.ftag.master_tag.colorpicker.kag = TYRANO.kag
})()
