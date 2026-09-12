;(function () {
    const __slider_ui = {
        updateRange: function (name, w, pm) {
            var rangeValue = $("#input_" + name).val()
            var active = w * ((rangeValue - $("#input_" + name).attr("min")) / ($("#input_" + name).attr("max") - $("#input_" + name).attr("min")))
            var param = {width: active + "px"}
            let left = $("#input_" + name)
                .css("left")
                .replace("px", "")
            $("." + name)
                .find(".range_active")
                .css(param)
            let tip = $("." + name).find(".range_tip")
            if (tip.length > 0) {
                let tip_x = 0
                if (pm.reverse === "true") {
                    tip_x = parseInt(left) + parseInt(w) - parseInt(active) - parseInt(tip.css("width").replace("px", "")) / 2
                } else {
                    tip_x = parseInt(left) + parseInt(active) - parseInt(tip.css("width").replace("px", "")) / 2
                }
                tip.text(rangeValue)
                if (pm.tip_pos !== "static") {
                    tip.css({
                        left: `${tip_x}px`,
                    })
                }
            }
        },
        updateRange_touch: function (name, w, pm, e) {
            let scale = $("#tyrano_base").css("transform")
            scale = scale.substring(0, scale.indexOf(",")).replace("matrix(", "")
            let touch = e.touches[0]
            let val = touch.clientX / scale - pm.x - $("#tyrano_base").css("margin-left").replace("px", "")
            if (val > w) {
                val = w
            } else if (val < 0) {
                val = 0
            }
            if (pm.reverse == "true") {
                val = w - val
            }
            $("#input_" + name).val((val / w) * (pm.max - pm.min) + pm.min * 1)
            this.updateRange(name, w, pm)
        },
        convertColor: function (color) {
            return $.convertColor(color).replace("=", "#")
        },
    }

    //スライダー
    TYRANO.kag.kag.tag.slider = {
        vital: ["x", "y", "name"],
        pm: {
            name: "",
            x: "",
            y: "",
            width: "400",
            height: "4",
            min: "0",
            max: "100",
            step: "1",
            border: "0",
            border_color: "white",
            border_radius: "30",
            thumb_width: "30",
            thumb_height: "30",
            thumb_radius: "30",
            thumb_color: "white",
            thumb_border: "0",
            thumb_border_color: "white",
            thumb_img: "",
            base_color: "#999",
            active_color: "white",
            base_img: "",
            active_img: "",
            storage: "",
            target: "",
            exp: "",
            preexp: "",
            var: "",
            tip_width: "0",
            tip_height: "0",
            tip_color: "white",
            tip_radius: "0",
            tip_text_color: "black",
            tip_text_size: "24",
            tip_tail: "true",
            tip_pos: "top",
            tip_margin: "0",
            reverse: "false",
        },
        start: function (pm) {
            const that = TYRANO
            const _pm = pm
            const name = _pm.name
            const variable = that.kag.embScript(_pm.var)

            const layer = TYRANO.kag.layer.getLayer("fix")

            let wrap = $('<div class="range fixlayer"></div>')
            let base = $('<div class="range_base"></div>')
            let active = $('<div class="range_active"></div>')
            let input = $("<input type=range>")
            let tip = $('<div class="range_tip"></div>')

            wrap.addClass(name)
            tip.addClass(name)
            input.attr({
                name: name,
                min: _pm.min,
                max: _pm.max,
                step: _pm.step,
            })
            input.attr({
                id: "input_" + name,
                value: variable,
            })

            let bg_base = ""
            if (pm.base_img != "") {
                //画像
                bg_base = `url(data/image/${pm.base_img})`
            } else {
                bg_base = __slider_ui.convertColor(_pm.base_color)
            }
            base.css({
                background: bg_base,
                position: "absolute",
                top: _pm.y + "px",
                left: _pm.x + "px",
                width: _pm.width + "px",
                height: _pm.height + "px",
                border: _pm.border + "px solid " + __slider_ui.convertColor(_pm.border_color),
                "border-radius": _pm.border_radius + "px",
            })

            let bg_active = ""
            if (pm.active_img != "") {
                //画像
                bg_active = `url(data/image/${pm.active_img})`
            } else {
                bg_active = __slider_ui.convertColor(_pm.active_color)
            }
            active.css({
                background: bg_active,
                position: "absolute",
                top: parseInt(_pm.border) + parseInt(_pm.y) + "px",
                left: parseInt(_pm.border) + parseInt(_pm.x) + "px",
                height: _pm.height + "px",
                width: _pm.width + "px",
                "border-radius": _pm.border_radius + "px",
            })

            //逆順の場合
            if (_pm.reverse == "true") {
                input.css({
                    direction: "rtl",
                })
                active.css({
                    left: "auto",
                    right: `${parseInt(TYRANO.kag.config.scWidth) - (parseInt(_pm.width) + parseInt(_pm.x))}px`,
                })
            }

            if (_pm.thumb_img !== "") {
                input.css({
                    top: _pm.y + "px",
                    left: _pm.x + "px",
                    width: _pm.width + "px",
                    height: _pm.height + "px",
                    "--thumb-width": _pm.thumb_width + "px",
                    "--thumb-height": _pm.thumb_height + "px",
                    "--thumb-img": `url(../../../image/${_pm.thumb_img})`,
                    "--thumb-color": "transparent",
                })
            } else {
                input.css({
                    top: _pm.y + "px",
                    left: _pm.x + "px",
                    width: _pm.width + "px",
                    height: _pm.height + "px",
                    "--thumb-width": _pm.thumb_width + "px",
                    "--thumb-height": _pm.thumb_height + "px",
                    "--thumb-radius": _pm.thumb_radius == "0" ? "none" : _pm.thumb_radius + "px",
                    "--thumb-color": __slider_ui.convertColor(_pm.thumb_color),
                    "--thumb-border": _pm.thumb_border + "px solid " + __slider_ui.convertColor(_pm.thumb_border_color),
                })
            }
            let _top = 0
            let _left = 0
            let _opacity = 0
            let _tail_top = "none"
            let _tail_bottom = "none"
            let _tail_arrow = ""
            let _tail = "none"
            if (_pm.tip_tail == "true") {
                _tail = "block"
            }
            if (_pm.tip_pos == "top") {
                _top = parseInt(_pm.y) - parseInt(_pm.tip_height) - parseInt(_pm.tip_margin)
                _tail_top = parseInt(_pm.tip_width) + "px solid " + _pm.tip_color
                _tail_arrow = (parseInt(_pm.tip_height) / 2) * 1
            } else if (_pm.tip_pos == "bottom") {
                _top = parseInt(_pm.y) + parseInt(_pm.tip_margin)
                _tail_bottom = parseInt(_pm.tip_width) + "px solid " + _pm.tip_color
                _tail_arrow = (parseInt(_pm.tip_height) / 2) * -1
            } else if (_pm.tip_pos == "static") {
                _top = pm.tip_y
                _left = pm.tip_x
                _opacity = 1
            }
            tip.css({
                position: "absolute",
                top: `${_top}px`,
                left: `${_left}px`,
                opacity: _opacity,
                "z-index": "999",
                width: _pm.tip_width + "px",
                height: _pm.tip_height + "px",
                background: __slider_ui.convertColor(_pm.tip_color),
                color: __slider_ui.convertColor(_pm.tip_text_color),
                "font-size": _pm.tip_text_size + "px",
                "text-align": "center",
                "line-height": _pm.tip_height + "px",
                "border-radius": _pm.tip_radius + "px",
                "--tip_width": _pm.tip_width + "px",
                "--tip_height": _pm.tip_height + "px",
                "--tip_color": __slider_ui.convertColor(_pm.tip_color),
                "--tip_tail": _tail,
                "--tip_tail_top": _tail_top,
                "--tip_tail_bottom": _tail_bottom,
                "--tip_tail_arrow": _tail_arrow + "px",
            })
            wrap.append(base).append(active).append(input)
            if (_pm.tip_width != "0") {
                wrap.append(tip)
            }
            layer.append(wrap)
            __slider_ui.updateRange(_pm.name, _pm.width, pm)

            that.kag.event.addEventElement({
                tag: "slider",
                j_target: input,
                pm: pm,
            })
            this.setEvent(input, pm)
            that.kag.ftag.nextOrder()
        },
        setEvent: function (input, pm) {
            const that = TYRANO
            const _pm = pm

            //タッチデバイス対応
            input.on("touchend", function () {
                input.trigger("change")
            })
            input.on("touchmove", function (e) {
                __slider_ui.updateRange_touch(_pm.name, _pm.width, pm, e)
                input.trigger("input")
            })

            //ツマミを動かしているとき
            input.on("input", function (e) {
                $("." + _pm.name)
                    .find(".range_tip")
                    .css({
                        opacity: 1,
                    })
                __slider_ui.updateRange(_pm.name, _pm.width, pm)
                that.kag.embScript(_pm.var + " = " + this.value)
                if (_pm.exp != "") {
                    that.kag.embScript(_pm.exp, _pm.preexp)
                }
            })

            //ツマミを動かし終わったとき
            input.on("change", function () {
                $("." + _pm.name)
                    .find(".range_tip")
                    .css({
                        opacity: 0,
                    })
                //fixレイヤの場合はcallでスタックが積まれる
                if (_pm.storage != "" || _pm.target != "") {
                    //コールスタックが帰ってきてない場合は、実行しないようにする必要がある
                    //fixの場合はコールスタックに残る。
                    var stack_pm = that.kag.getStack("call") //最新のコールスタックを取得
                    if (stack_pm == null) {
                        //strong_stopの場合は反応しない
                        var _auto_next = _pm.auto_next
                        if (that.kag.stat.is_strong_stop == true) {
                            _auto_next = "stop"
                        }
                        //call実行
                        $("input").prop("disabled", true)
                        that.kag.ftag.startTag("call", {
                            storage: _pm.storage,
                            target: _pm.target,
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
            input.on("mouseup touchend", function () {
                $("." + _pm.name)
                    .find(".range_tip")
                    .css({
                        opacity: 0,
                    })
            })
        },
    }
    TYRANO.kag.kag.ftag.master_tag.slider = TYRANO.kag.kag.tag.slider
    TYRANO.kag.kag.ftag.master_tag.slider.kag = TYRANO.kag.kag

    //スイッチ
    TYRANO.kag.kag.tag.switch = {
        vital: ["x", "y", "name"],
        pm: {
            name: "",
            x: "",
            y: "",
            width: "60",
            height: "4",
            border: "0",
            border_color: "white",
            border_radius: "30",
            thumb_width: "30",
            thumb_height: "30",
            thumb_radius: "30",
            thumb_color: "white",
            thumb_border: "0",
            thumb_border_color: "white",
            thumb_img: "",
            base_color: "#999",
            active_color: "white",
            base_img: "",
            active_img: "",
            storage: "",
            target: "",
            var: "",
        },
        start: function (pm) {
            const that = TYRANO
            const _pm = pm
            const name = _pm.name
            const variable = that.kag.embScript(_pm.var)
            const active = _pm.active_img != "" ? _pm.active_img : __slider_ui.convertColor(_pm.active_color)
            const base = _pm.base_img != "" ? _pm.base_img : __slider_ui.convertColor(_pm.base_color)
            const color = variable ? active : base

            const layer = TYRANO.kag.layer.getLayer("fix")

            let wrap = $('<div class="fixlayer"></div>')
            let input = $("<input type=checkbox />")
            let label = $("<label />")

            wrap.addClass(name)
            wrap.css({
                position: "absolute",
                top: _pm.y + "px",
                left: _pm.x + "px",
                width: _pm.width + "px",
                height: _pm.height + "px",
            })
            input.attr({
                id: "input_" + name,
            })

            input.css({
                display: "none",
                opacity: 0,
                width: _pm.width + "px",
                height: _pm.width + "px",
            })
            label.attr({
                for: "input_" + name,
            })

            label.css({
                position: "absolute",
                cursor: "pointer",
                background: color,
                border: _pm.boder + "px solid " + __slider_ui.convertColor(_pm.border_color),
                "border-radius": _pm.border_radius == "0" ? "none" : _pm.border_radius + "px",
                width: _pm.width + "px",
                height: _pm.height + "px",
                display: "inline-block",
                transition: "0.2s",
                "box-sizing": "border-box",
                "--thumb_top": ((_pm.thumb_height - _pm.height) / 2) * -1 - _pm.border / 2 + "px",
                "--thumb-width": _pm.thumb_width + "px",
                "--thumb-height": _pm.thumb_height + "px",
                "--thumb-move": _pm.width / 2 + "px",
                "--active-color": active,
            })
            if (_pm.thumb_img != "") {
                label.css({
                    "--thumb-img": `url("../../../image/${_pm.thumb_img}")`,
                })
            } else {
                label.css({
                    "--thumb-radius": _pm.thumb_radius == "0" ? "none" : _pm.thumb_radius + "px",
                    "--thumb-color": __slider_ui.convertColor(_pm.thumb_color),
                    "--thumb-border": _pm.thumb_border + "px solid " + __slider_ui.convertColor(_pm.thumb_border_color),
                })
            }
            input.prop("checked", variable)

            wrap.append(input)
            wrap.append(label)
            layer.append(wrap)

            that.kag.event.addEventElement({
                tag: "switch",
                j_target: input,
                pm: pm,
            })
            this.setEvent(input, label, pm)
            that.kag.ftag.nextOrder()
        },
        setEvent: function (input, label, pm) {
            const that = TYRANO
            const _pm = pm

            input.on("change", function () {
                const active = _pm.active_img != "" ? _pm.active_img : __slider_ui.convertColor(_pm.active_color)
                const base = _pm.base_img != "" ? _pm.base_img : __slider_ui.convertColor(_pm.base_color)
                if (input.prop("checked")) {
                    that.kag.evalScript(_pm.var + " = true")
                    label.css({
                        background: active,
                    })
                    label.find("div").css({
                        left: _pm.width / 2 + "px",
                    })
                    //fixレイヤの場合はcallでスタックが積まれる
                    if (_pm.storage != "" || _pm.target != "") {
                        //コールスタックが帰ってきてない場合は、実行しないようにする必要がある
                        //fixの場合はコールスタックに残る。
                        var stack_pm = that.kag.getStack("call") //最新のコールスタックを取得
                        if (stack_pm == null) {
                            //strong_stopの場合は反応しない
                            var _auto_next = _pm.auto_next
                            if (that.kag.stat.is_strong_stop == true) {
                                _auto_next = "stop"
                            }
                            //call実行
                            that.kag.ftag.startTag("call", {
                                storage: _pm.storage,
                                target: _pm.target,
                                auto_next: _auto_next,
                            })
                        } else {
                            //スタックが残っている場合
                            that.kag.log("callスタックが残っている場合、fixボタンは反応しません")
                            that.kag.log(stack_pm)
                            return false
                        }
                    }
                } else {
                    that.kag.evalScript(_pm.var + " = false")
                    label.css({
                        background: base,
                    })
                    label.find("div").css({
                        left: "0px",
                    })
                    //fixレイヤの場合はcallでスタックが積まれる
                    if (_pm.storage != "" || _pm.target != "") {
                        //コールスタックが帰ってきてない場合は、実行しないようにする必要がある
                        //fixの場合はコールスタックに残る。
                        var stack_pm = that.kag.getStack("call") //最新のコールスタックを取得
                        if (stack_pm == null) {
                            //strong_stopの場合は反応しない
                            var _auto_next = _pm.auto_next
                            if (that.kag.stat.is_strong_stop == true) {
                                _auto_next = "stop"
                            }
                            //call実行
                            that.kag.ftag.startTag("call", {
                                storage: _pm.storage,
                                target: _pm.target,
                                auto_next: _auto_next,
                            })
                        } else {
                            //スタックが残っている場合
                            that.kag.log("callスタックが残っている場合、fixボタンは反応しません")
                            that.kag.log(stack_pm)
                            return false
                        }
                    }
                }
            })
        },
    }
    TYRANO.kag.kag.ftag.master_tag.switch = TYRANO.kag.kag.tag.switch
    TYRANO.kag.kag.ftag.master_tag.switch.kag = TYRANO.kag.kag

    const _return = TYRANO.kag.kag.tag.return
    TYRANO.kag.kag.tag.return = $.extend(true, {}, _return, {
        start: function () {
            $("input").prop("disabled", false)
            _return.start.apply(this, arguments)
        },
    })
    TYRANO.kag.kag.ftag.master_tag.return = TYRANO.kag.kag.tag.return
    TYRANO.kag.kag.ftag.master_tag.return.kag = TYRANO.kag.kag
})()
