try {
    if ($.browser.msie && $.browser.version == "6.0") {
        document.execCommand("BackgroundImageCache", false, true)
    }
} catch(e) {}
if (typeof Fai == "undefined") {
    Fai = {}
}
Fai.isNull = function(A) {
    return (typeof A == "undefined") || (A == null)
};
Fai.isArray = function(A) {
    if (A.constructor == window.Array) {
        return true
    } else {
        return false
    }
};
Fai.isDate = function(A) {
    if (A.constructor == Date) {
        return true
    } else {
        return false
    }
};
Fai.isNumber = function(A) {
    if (/[^\d]/.test(A)) {
        return false
    } else {
        return true
    }
}; 
Fai.isIE6 = function() {
    if ($.browser.msie) {
        if ($.browser.version == "6.0") {
            return true
        }
    }
    return false
};
Fai.isIE7 = function() {
    if ($.browser.msie) {
        if ($.browser.version == "7.0") {
            return true
        }
    }
    return false
};
Fai.isIE9 = function() {
    if ($.browser.msie) {
        if ($.browser.version == "9.0") {
            return true
        }
    }
    return false
};
Fai.getCssInt = function(C, B) {
    if (C.css(B)) {
        var A = parseInt(C.css(B).replace("px", ""));
        if (isNaN(A)) {
            return 0
        }
        return A
    } else {
        return 0
    }
};
Fai.getEventX = function(A) {
    A = A || window.event;
    return A.pageX || A.clientX + document.body.scrollLeft
};
Fai.getEventY = function(A) {
    A = A || window.event;
    return A.pageY || A.clientY + document.body.scrollTop
};
Fai.inRect = function(A, B) {
    if (A.x > B.left && A.x < (B.left + B.width) && A.y > B.top && A.y < (B.top + B.height)) {
        return true
    }
    return false
}; 
var timeout = 500;
var closetimer = 0;
var ddmenuitem = 0; 
Fai.containsChinese = function(B) {
    var A = /[\u4e00-\u9fa5]+/;
    return A.test(B)
};
Fai.refreshClass = function(A) {
    A.children().each(function() {
        $(this).attr("className", $(this).attr("className"));
        Fai.refreshClass($(this))
    })
};
Fai.addInterval = function(D, C, A) {
    if (Fai.isNull(Fai.intervalFunc)) {
        Fai.intervalFunc = new Array()
    }
    for (var B = 0; B < Fai.intervalFunc.length; ++B) {
        if (Fai.intervalFunc[B].id == D) {
            return
        }
    }
    Fai.intervalFunc.push({
        id: D,
        func: C,
        interval: A,
        type: 1
    })
};
Fai.addTimeout = function(D, C, A) {
    if (Fai.isNull(Fai.intervalFunc)) {
        Fai.intervalFunc = new Array()
    }
    for (var B = 0; B < Fai.intervalFunc.length; ++B) {
        if (Fai.intervalFunc[B].id == D) {
            return
        }
    }
    Fai.intervalFunc.push({
        id: D,
        func: C,
        interval: A,
        type: 0
    })
};
Fai.startInterval = function(C) {
    if (Fai.isNull(Fai.intervalFunc)) {
        return
    }
    for (var B = 0; B < Fai.intervalFunc.length; ++B) {
        var A = Fai.intervalFunc[B];
        if (C == null || A.id == C) {
            if (A.timer) {
                clearInterval(A.timer)
            }
            if (A.type == 1) {
                A.timer = setInterval(A.func, A.interval)
            } else {
                A.timer = setTimeout(A.func, A.interval)
            }
        }
    }
};
Fai.stopInterval = function(C) {
    if (Fai.isNull(Fai.intervalFunc)) {
        return
    }
    for (var B = 0; B < Fai.intervalFunc.length; ++B) {
        var A = Fai.intervalFunc[B];
        if (C == null || A.id == C) {
            if (A.timer) {
                clearInterval(A.timer)
            }
        }
    }
};
jQuery.extend(jQuery.fx.step, {
    opacity: function(A) {
        var B = jQuery.style(A.elem, "opacity");
        if (B == null || B == "" || B != A.now) {
            jQuery.style(A.elem, "opacity", A.now)
        }
    }
});
jQuery.extend(jQuery.easing, {
    faicount: 10,
    failinear: function(E, B, A, D, C) {
        var F = Math.abs(D - A) / jQuery.easing.faicount;
        if (F == 0) {
            return D
        }
        E = parseInt(E / F) * F;
        return jQuery.easing.linear(E, B, A, D, C)
    }
});
Fai.easingFaiLinear = function() {
    jQuery.extend(jQuery.easing, {
        swing: function(D, E, A, C, B) {
            return jQuery.easing.failinear(D, E, A, C, B)
        }
    })
};
Fai.getDivHeight = function(E) {
    var D = Fai.getCssInt(E, "padding-top") + Fai.getCssInt(E, "padding-bottom");
    var C = Fai.getCssInt(E, "margin-top") + Fai.getCssInt(E, "margin-bottom");
    var B = Fai.getCssInt(E, "border-top-width") + Fai.getCssInt(E, "border-bottom-width");
    var A = E.height();
    return A + B + C + D
};
Fai.getDivWidth = function(E) {
    var D = Fai.getCssInt(E, "padding-left") + Fai.getCssInt(E, "padding-right");
    var C = Fai.getCssInt(E, "margin-left") + Fai.getCssInt(E, "margin-right");
    var A = Fai.getCssInt(E, "border-left-width") + Fai.getCssInt(E, "border-right-width");
    var B = E.width();
    return B + A + C + D
};
Fai.getFrameHeight = function(D) {
    var C = Fai.getCssInt(D, "padding-top") + Fai.getCssInt(D, "padding-bottom");
    var B = Fai.getCssInt(D, "margin-top") + Fai.getCssInt(D, "margin-bottom");
    var A = Fai.getCssInt(D, "border-top-width") + Fai.getCssInt(D, "border-bottom-width");
    return A + B + C
};
Fai.getFrameWidth = function(D) {
    var C = Fai.getCssInt(D, "padding-left") + Fai.getCssInt(D, "padding-right");
    var B = Fai.getCssInt(D, "margin-left") + Fai.getCssInt(D, "margin-right");
    var A = Fai.getCssInt(D, "border-left-width") + Fai.getCssInt(D, "border-right-width");
    return A + B + C
};
Fai.showMenu = function(H) {
    var D = H.id;
    if (Fai.isNull(D)) {
        D = ""
    }
    var B = H.host;
    var I = 0;
    if (!Fai.isNull(H.mode)) {
        I = H.mode
    }
    if (Fai.isNull(H.fixpos)) {
        H.fixpos = true
    }
    var C = 0;
    if (!Fai.isNull(H.closeMode)) {
        C = H.closeMode
    }
    var F = 0;
    var A = 0;
    if (I == 1) {
        F = B.offset().left + B.width();
        A = B.offset().top
    } else {
        F = B.offset().left;
        A = B.offset().top + B.height()
    }
    var E = $("#g_menu" + D);
    if (E.length != 0) {
        if (C == 0) {
            E.attr("_mouseIn", 1);
            return E
        } else {
            E.attr("_mouseIn", 0);
            Fai.hideMenu();
            return
        }
    }
    $(".g_menu").each(function() {
        $(this).remove()
    });
    var G = H.data;
    if (H.data == null || H.data == "") {
        return
    }
    E = $("<div id='g_menu" + D + "' tabindex='0' hidefocus='true' class='g_menu " + H.cls + "' style='display:block;outline:none;'></div>");
    E.appendTo($("body"));
    var J = $("<div class='content'></div>");
    J.appendTo(E);
    Fai.addMenuItem(G, J, H);
    if (H.fixpos) {
        if (A + E.height() + 20 > $(document).height()) {
            A = B.offset().top - E.height()
        }
    }
    E.css("left", F - Fai.getCssInt(J, "border-left-width") + "px");
    E.css("top", A + "px");
    if (C == 0) {
        E.mouseleave(function() {
            E.attr("_mouseIn", 0);
            setTimeout("Fai.hideMenu()", 100)
        });
        E.mouseover(function() {
            E.attr("_mouseIn", 1)
        });
        E.click(function() {
            E.attr("_mouseIn", 0);
            Fai.hideMenu()
        });
        B.mouseleave(function() {
            E.attr("_mouseIn", 0);
            setTimeout("Fai.hideMenu()", 100)
        });
        B.mouseover(function() {
            E.attr("_mouseIn", 1)
        })
    } else {
        B.mousedown(function() {
            E.attr("_mouseIn", 2)
        });
        E.bind("blur",
        function() {
            if (E.attr("_mouseIn") != 2) {
                E.attr("_mouseIn", 0);
                setTimeout("Fai.hideMenu()", 100)
            }
        });
        E.focus()
    }
    if (typeof g_bindMenuMousewheel == "undefined") {
        g_bindMenuMousewheel = 1;
        $("body").bind("mousewheel",
        function() {
            $("#g_menu").remove()
        })
    }
    E.attr("_mouseIn", 1);
    E.slideDown(200);
    Fai.calcMenuSize(E, H);
    return E
};
Fai.addMenuItem = function(A, K, D) {
    if (A.length <= 0) {
        return
    }
    var F = $("<table class='top' cellpadding='0' cellspacing='0'><tr><td class='left'></td><td class='center'></td><td class='right'></td></tr></table><table class='middle' cellpadding='0' cellspacing='0'><tr><td class='left'></td><td class='center'></td><td class='right'></td></tr></table><table class='bottom' cellpadding='0' cellspacing='0'><tr><td class='left'></td><td class='center'></td><td class='right'></td></tr></table>");
    F.appendTo(K);
    F = F.parent().find(".middle .center");
    for (var B = 0; B < A.length; ++B) {
        var N = A[B];
        var G = N.sub;
        var I = N.href;
        var M = N.onclick;
        var E = N.target;
        var L = "";
        if (!I && !M) {
            I = "";
            M = ""
        } else {
            if (!I) {
                I = " href='javascript:;'"
            } else {
                I = ' href="' + I + '"'
            }
            if (!M) {
                M = ""
            } else {
                M = ' onclick="' + M + '"'
            }
            if (!E) {
                E = ""
            } else {
                E = " target='" + E + "'"
            }
        }
        var J = Math.random();
        var C = "<table class='item' itemId='" + J + "' cellpadding='0' cellspacing='0'><tr><td class='itemLeft'></td><td class='itemCenter'><a hidefocus='true' ";
        C += I + M + E;
        if (N.title) {
            C += " title='" + N.title + "'"
        }
        C += ">" + N.html + "</a></td><td class='itemRight'></td></tr></table>";
        var H = $(C);
        if (G) {
            H.addClass("itemPopup")
        }
        if (F.find(" > .subMenu").length >= 1) {
            H.insertBefore(F.find(" > .subMenu").first())
        } else {
            H.appendTo(F)
        }
        if (G) {
            if (G.length == 0) {
                G.push({
                    html: "----"
                })
            }
            var P = $("<div class='subMenu' itemId='" + J + "'><div class='content'></div></div>");
            P.appendTo(F);
            var O = P.find(" > .content");
            Fai.addMenuItem(G, O, D);
            P.mouseleave(function() {
                $(this).attr("_mouseIn", 0);
                setTimeout("Fai.hideSubMenu()", 100)
            });
            P.mouseover(function() {
                $(this).attr("_mouseIn", 1)
            });
            P.click(function() {
                $(this).attr("_mouseIn", 0);
                Fai.hideSubMenu()
            })
        }
        H.hover(function() {
            var Q = $(this);
            var R = null;
            $(this).parent().find(" > .subMenu").each(function() {
                if ($(this).attr("itemId") == Q.attr("itemId")) {
                    R = $(this)
                }
            });
            if (R != null && R.length == 1) {
                if (R.css("display") == "none") {
                    if (R.attr("_hadShow") != 1) {
                        var T = Q.position().left + Q.width();
                        var S = Q.position().top;
                        if (D.fixpos) {
                            var U = Q.offset().top + R.height() + 20 - $(document).height();
                            if (U > 0) {
                                S = S - U
                            }
                        }
                        R.css("left", T + "px");
                        R.css("top", S + "px");
                        R.slideDown(200);
                        Fai.calcMenuSize(R, D);
                        R.attr("_hadShow", 1)
                    } else {
                        R.slideDown(200)
                    }
                }
                R.attr("_mouseIn", 1)
            }
            Q.addClass("itemHover");
            $(".g_menu").attr("_mouseIn", 1)
        },
        function() {
            var R = $(this);
            var Q = null;
            $(this).parent().find(" > .subMenu").each(function() {
                if ($(this).attr("itemId") == R.attr("itemId")) {
                    Q = $(this)
                }
            });
            if (Q != null && Q.length == 1) {
                Q.attr("_mouseIn", 0);
                setTimeout("Fai.hideSubMenu()", 100)
            } else {
                R.removeClass("itemHover")
            }
        }).click(function() {
            $(".g_menu").attr("_mouseIn", 0);
            setTimeout("Fai.hideMenu()", 100)
        });
        if (D.closeMode == 1) {
            H.mousedown(function() {
                $(".g_menu").attr("_mouseIn", 2)
            })
        }
    }
};
Fai.calcMenuSize = function(B, A) {
    B.find(" > .content").each(function() {
        var D = $(" > .middle", this);
        var E = 0;
        if (!Fai.isNull(A.minWidth)) {
            E = A.minWidth - Fai.getCssInt(D.find(".left").first(), "width") - Fai.getCssInt(D.find(".right").first(), "width")
        }
        var C = D.find(" > tbody tr .center .item");
        C.each(function() {
            if ($(this).width() > E) {
                E = $(this).width()
            }
        });
        C.width(E);
        C.find(" > tbody tr .itemCenter").each(function() {
            var H = $(this);
            var I = H.parent().find(" > .itemLeft");
            var F = H.parent().find(" > .itemRight");
            H.css("width", (E - Fai.getDivWidth(I) - Fai.getDivWidth(F) - Fai.getDivWidth(H) + H.width()) + "px");
            var G = H.find("a");
            G.css("width", (H.width() - Fai.getDivWidth(G) + G.width()) + "px")
        });
        $(" > .top", this).width(D.width());
        $(" > .bottom", this).width(D.width())
    })
};
Fai.hideSubMenu = function() {
    $(".g_menu .subMenu").each(function() {
        var A = $(this);
        if (A.length != 1) {
            return
        }
        if (A.attr("_mouseIn") == 1) {
            return
        }
        A.css("display", "none");
        A.parent().find(" > .item").each(function() {
            if ($(this).attr("itemId") == A.attr("itemId")) {
                $(this).removeClass("itemHover")
            }
        })
    })
};
Fai.hideMenu = function() {
    $(".g_menu").each(function() {
        var A = $(this);
        if (A.length != 1) {
            return
        }
        if (A.attr("_mouseIn") == 1) {
            return
        }
        A.remove()
    })
};
Fai.calcCtrlWidth = function(A, B) {
    padding = Fai.getCssInt(B, "padding-left") + Fai.getCssInt(B, "padding-right");
    margin = Fai.getCssInt(B, "margin-left") + Fai.getCssInt(B, "margin-right");
    border = Fai.getCssInt(B, "border-left-width") + Fai.getCssInt(B, "border-right-width");
    B.width(A - padding - margin - border)
};
Fai.calcCtrlHeight = function(A, B) {
    padding = Fai.getCssInt(B, "padding-top") + Fai.getCssInt(B, "padding-bottom");
    margin = Fai.getCssInt(B, "margin-top") + Fai.getCssInt(B, "margin-bottom");
    border = Fai.getCssInt(B, "border-top-width") + Fai.getCssInt(B, "border-bottom-width");
    B.height(A - padding - margin - border)
};
Fai.calcGridSize = function(G, E, H, F, C) {
    if (G > 0) {
        var B = Fai.getCssInt(E, "padding-left") + Fai.getCssInt(E, "padding-right");
        var J = Fai.getCssInt(E, "margin-left") + Fai.getCssInt(E, "margin-right");
        var K = Fai.getCssInt(E, "border-left-width") + Fai.getCssInt(E, "border-right-width");
        E.css("overflow-x", "hidden");
        E.width(G - B - K - J)
    }
    var I = 0;
    if (H.css("display") != "none") {
        B = Fai.getCssInt(H, "padding-left") + Fai.getCssInt(H, "padding-right");
        J = Fai.getCssInt(H, "margin-left") + Fai.getCssInt(H, "margin-right");
        K = Fai.getCssInt(H, "border-left-width") + Fai.getCssInt(H, "border-right-width");
        I = H.width() + B + J + K
    }
    var A = 0;
    if (C.css("display") != "none") {
        B = Fai.getCssInt(C, "padding-left") + Fai.getCssInt(C, "padding-right");
        J = Fai.getCssInt(C, "margin-left") + Fai.getCssInt(C, "margin-right");
        K = Fai.getCssInt(C, "border-left-width") + Fai.getCssInt(C, "border-right-width");
        A = C.width() + B + J + K
    }
    Fai.calcCtrlWidth(E.width() - I - A, F);
    B = Fai.getCssInt(F, "padding-top") + Fai.getCssInt(F, "padding-bottom");
    J = Fai.getCssInt(F, "margin-top") + Fai.getCssInt(F, "margin-bottom");
    K = Fai.getCssInt(F, "border-top-width") + Fai.getCssInt(F, "border-bottom-width");
    var D = F.height() + B + J + K;
    Fai.calcCtrlHeight(D, H);
    Fai.calcCtrlHeight(D, C)
};
Fai.removeBgStyle = function(A) {
    if (A.attr("style")) {
        style = A.attr("style").toLowerCase();
        if (style.indexOf("background-image") > -1) {
            style = style.replace(/background-image[^;]*/gi, "")
        }
        if (style.indexOf("background-repeat") > -1) {
            style = style.replace(/background-repeat[^;]*/gi, "")
        }
        if (style.indexOf("background-position") > -1) {
            style = style.replace(/background-position[^;]*/gi, "")
        }
        if (style.indexOf("background-color") > -1) {
            style = style.replace(/background-color[^;]*/gi, "")
        }
        if (style.indexOf("background") > -1) {
            style = style.replace(/background[^;]*/gi, "")
        }
        if (style == "" || style == null) {
            A.removeAttr("style")
        } else {
            A.attr("style", style)
        }
    }
};
Fai.showTip = function(C) {
    var A = new Array();
    if (!C.content) {
        C.content = ""
    }
    A.push("<div class='tip-content'>");
    if (C.closeSwitch) {
        A.push("<div class='tip-content' style='padding-top:5px;'>");
        A.push("<div class='tip-btnClose'></div>")
    } else {
        A.push("<div class='tip-content'>")
    }
    A.push(C.content);
    A.push("</div>");
    var D = A.join("");
    var B = {
        content: D,
        className: "tip-yellowsimple",
        showTimeout: 1,
        hideTimeout: 0,
        alignTo: "target",
        alignX: "center",
        alignY: "top",
        offsetY: 5,
        showOn: "none",
        hideAniDuration: 0,
        id: "tip-yellowsimple" + parseInt(Math.random() * 10000)
    };
    if (C.id) {
        $.extend(B, {
            id: C.id
        })
    }
    if (C.showMode) {
        if (C.showMode == "left") {
            $.extend(B, {
                alignX: "left",
                alignY: "center",
                offsetY: 0,
                offsetX: 5
            })
        } else {
            if (C.showMode == "right") {
                $.extend(B, {
                    alignX: "right",
                    alignY: "center",
                    offsetY: 0,
                    offsetX: 5
                })
            } else {
                if (C.showMode == "top") {
                    $.extend(B, {
                        alignX: "center",
                        alignY: "top",
                        offsetY: 0,
                        offsetX: 5
                    })
                } else {
                    if (C.showMode == "bottom") {
                        $.extend(B, {
                            alignX: "center",
                            alignY: "bottom",
                            offsetY: 0,
                            offsetX: 5
                        })
                    }
                }
            }
        }
    }
    if (C.data) {
        $.extend(B, C.data)
    }
    if (C.appendToId) {
        $.extend(B, {
            appendToId: C.appendToId
        })
    }
    var E = $(C.tid);
    if (C.cls) {
        $("#" + B.id).addClass(C.cls)
    }
    $("#" + B.id).find(".tip-btnClose").bind("click",
    function() {
        if (C.beforeClose) {
            C.beforeClose()
        }
        Fai.closeTip(C.tid)
    });
    if (C.autoTimeout) {
        window.setTimeout(function() {
            if (C.beforeClose) {
                C.beforeClose()
            }
            Fai.closeTip(C.tid)
        },
        C.autoTimeout)
    }
};
Fai.closeTip = function(A) {
    if (typeof $(A).poshytip == "function") {
        $(A).poshytip("destroy")
    }
};
Fai.refreshTip = function(A) {
    $(A).poshytip("hide");
    $(A).poshytip("show")
};
Fai.removeCss = function(D, A) {
    var C = new RegExp(A + "[^;]*;", "gi");
    var B = D.attr("style").replace(C, "");
    if (B == "" || B == null) {
        D.removeAttr("style")
    } else {
        D.attr("style", B)
    }
};
Fai.rgb2hex = function(B) {
    if (B.charAt(0) == "#") {
        return B
    }
    var E = Number(B);
    var D = B.split(/\D+/);
    var A = Number(D[1]) * 65536 + Number(D[2]) * 256 + Number(D[3]);
    var C = A.toString(16);
    while (C.length < 6) {
        C = "0" + C
    }
    return "#" + C
};
Fai.int2hex = function(A) {
    var B = A.toString(16);
    while (B.length < 6) {
        B = "0" + B
    }
    return "#" + B
};
Fai.setCtrlStyleCss = function(G, F, C, B, A) {
    var E = $("#" + G);
    var K = new Array();
    if (E.length == 1) {
        var J = E.html();
        J = J.replace(/{\r\n/g, "{").replace(/\t/g, "").replace(/\r\n}/g, ";}");
        K = J.split("\n");
        E.remove()
    }
    var H = new RegExp("#" + F + " +" + C.replace(".", "\\.") + " *{ *" + B + "[^;]*;", "gi");
    for (var I = K.length - 1; I >= 0; --I) {
        var D = K[I];
        if (D.length == 0 || /^\s$/.test(D) || H.test(D)) {
            K.splice(I, 1)
        }
    }
    K.push("#" + F + " " + C + "{" + B + ":" + A + ";}");
    $("head").append('<style type="text/css" id="' + G + '">' + K.join("\n") + "</style>")
};
Fai.setCtrlStyleCssList = function(H, G, A) {
    var F = $("#" + H);
    var B = new Array();
    if (F.length == 1) {
        var L = F.html();
        L = L.replace(/{\r\n/g, "{").replace(/\t/g, "").replace(/\r\n}/g, ";}");
        B = L.split("\n");
        F.remove()
    }
    for (var K = B.length - 1; K >= 0; --K) {
        var E = B[K];
        for (var J = 0; J < A.length; ++J) {
            var D = A[J].cls;
            var C = A[J].key;
            var I = new RegExp("#" + G + " +" + D.replace(".", "\\.") + " *{ *" + C + "[^;]*;", "gi");
            if (E.length == 0 || /^\s$/.test(E) || I.test(E)) {
                B.splice(K, 1);
                break
            }
        }
    }
    for (var J = 0; J < A.length; ++J) {
        B.push("#" + G + " " + A[J].cls + "{" + A[J].key + ":" + A[J].value + ";}")
    }
    $("head").append('<style type="text/css" id="' + H + '">' + B.join("\n") + "</style>")
};
Fai.getCtrlStyleCss = function(G, F, B, A) {
    var E = $("#" + G);
    if (E.length == 0) {
        return ""
    }
    var J = E.html().split("\n");
    var H = new RegExp("#" + F + " +" + B.replace(".", "\\.") + " *{ *" + A + "[^;]*;", "gi");
    for (var I = J.length - 1; I >= 0; --I) {
        var C = J[I];
        var D = C.match(H);
        if (D && D.length >= 2) {
            return D[1]
        }
    }
    return ""
};
Fai.removeCtrlStyleCss = function(F, E, B, A) {
    var D = $("#" + F);
    var J = new Array();
    if (D.length == 1) {
        var I = D.html();
        I = I.replace(/{\r\n/g, "{").replace(/\t/g, "").replace(/\r\n}/g, ";}");
        J = I.split("\n");
        D.remove()
    }
    var G = new RegExp("#" + E + " +" + B.replace(".", "\\.") + " *{ *" + A + "[^;]*;", "gi");
    for (var H = J.length - 1; H >= 0; --H) {
        var C = J[H];
        if (C.length == 0 || /^\s$/.test(C) || G.test(C)) {
            J.splice(H, 1)
        }
    }
    $("head").append('<style type="text/css" id="' + F + '">' + J.join("\n") + "</style>")
};
Fai.removeCtrlStyleCssList = function(H, G, A) {
    var F = $("#" + H);
    var B = new Array();
    if (F.length == 1) {
        var L = F.html();
        L = L.replace(/{\r\n/g, "{").replace(/\t/g, "").replace(/\r\n}/g, ";}");
        B = L.split("\n");
        F.remove()
    }
    for (var K = B.length - 1; K >= 0; --K) {
        var E = B[K];
        for (var J = 0; J < A.length; ++J) {
            var D = A[J].cls;
            var C = A[J].key;
            var I = new RegExp("#" + G + " +" + D.replace(".", "\\.") + " *{ *" + C + "[^;]*;", "gi");
            if (E.length == 0 || /^\s$/.test(E) || I.test(E)) {
                B.splice(K, 1);
                break
            }
        }
    }
    $("head").append('<style type="text/css" id="' + H + '">' + B.join("\n") + "</style>")
};
Fai.addCtrlStyle = function(A, D) {
    var C = $("#" + A);
    var E = new Array();
    if (C.length == 1) {
        var B = C.html();
        B = B.replace(/{\r\n/g, "{").replace(/\t/g, "").replace(/\r\n}/g, ";}");
        E = B.split("\n");
        C.remove()
    }
    E.push(D);
    $("head").append('<style type="text/css" id="' + A + '">' + E.join("\n") + "</style>")
};
  


  if (typeof Site == "undefined") {
    Site = {}; 
    Site.initNavList = function(A) {
        $("#nav .navCenter").mouseover(function() {
            Site.addEditLayer("navCenter", A, 4)
        }).mouseleave(function() {
            Site.removeEditLayer("navCenter")
        })
    };
    Site.showNavSubMenu = function(mode) {
        var menuMode = 0;
        if (mode == 1) {
            menuMode = 1
        }
        $.each(top.$("#nav .navCenter .item"),
        function(i, n) {
            $(this).unbind();
            if (mode == 100) {
                var item = $(this);
                if (item.find(".navSubMenu").length >= 1) {
                    return
                }
                var id = item.attr("id");
                var menuData = top.eval(id + "SubMenu");
                var pageColId = top._colId;
                var fromColId = top._fromColId;
                var colId = item.attr("colId");
                if (colId == pageColId || colId == fromColId) {
                    item.addClass("itemSelected")
                }
                item.hover(function() {
                    $(this).addClass("itemHover")
                },
                function() {
                    $(this).removeClass("itemHover")
                });
                if (!menuData || menuData.length < 1) {
                    return
                }
                var level = 0;
                if (colId == pageColId || colId == fromColId) {
                    level = 1
                } else {
                    for (var i = 0; i < menuData.length; ++i) {
                        var colId2 = menuData[i].colId;
                        if (colId2 == pageColId || colId2 == fromColId) {
                            level = 2;
                            break
                        }
                        if (!Fai.isNull(menuData[i].sub)) {
                            var menuDataSub = menuData[i].sub;
                            for (var n = 0; n < menuDataSub.length; ++n) {
                                var colId3 = menuDataSub[n].colId;
                                if (colId3 == pageColId || colId3 == fromColId) {
                                    level = 3;
                                    break
                                }
                            }
                        }
                        if (level != 0) {
                            break
                        }
                    }
                }
                if (menuData) {
                    Site.removeNavHiddenMenu(menuData)
                }
                if (colId == pageColId || colId == fromColId) {
                    if (menuData && menuData.length >= 1) {
                        item.addClass("itemPopupSelected")
                    }
                }
                if (level == 0) {
                    return
                }
                if (!menuData || menuData.length < 1) {
                    return
                }
                var menu = $("<div class='navSubMenu'></div>");
                var content = $("<div class='content2'><table class='top' cellpadding='0' cellspacing='0'><tr><td class='left'></td><td class='center'></td><td class='right'></td></tr></table><table class='middle' cellpadding='0' cellspacing='0'><tr><td class='left'></td><td class='center'></td><td class='right'></td></tr></table><table class='bottom' cellpadding='0' cellspacing='0'><tr><td class='left'></td><td class='center'></td><td class='right'></td></tr></table></div>");
                content.appendTo(menu);
                content = content.find(".middle .center");
                for (var i = 0; i < menuData.length; ++i) {
                    var menuItemClass = "";
                    if (menuData[i].colId == pageColId || menuData[i].colId == fromColId) {
                        menuItemClass = " itemSelected"
                    }
                    var menuItem = "<table class='item" + menuItemClass + "' cellpadding='0' cellspacing='0'><tr><td class='itemLeft'></td><td class='itemCenter'><a href='" + menuData[i].href + "'>" + menuData[i].html + "</a></td><td class='itemRight'></td></tr></table>";
                    $(menuItem).appendTo(content);
                    if (level == 1) {
                        continue
                    }
                    if (level == 2 && pageColId != menuData[i].colId && fromColId != menuData[i].colId) {
                        continue
                    }
                    if (Fai.isNull(menuData[i].sub) || menuData[i].sub.length < 1) {
                        continue
                    }
                    var menuDataSub = menuData[i].sub;
                    if (level == 3) {
                        var current = false;
                        for (var n = 0; n < menuDataSub.length; ++n) {
                            if (menuDataSub[n].colId == pageColId || menuDataSub[n].colId == fromColId) {
                                current = true;
                                break
                            }
                        }
                        if (!current) {
                            continue
                        }
                    }
                    var content3 = $("<div class='content3'><table class='top' cellpadding='0' cellspacing='0'><tr><td class='left'></td><td class='center'></td><td class='right'></td></tr></table><table class='middle' cellpadding='0' cellspacing='0'><tr><td class='left'></td><td class='center'></td><td class='right'></td></tr></table><table class='bottom' cellpadding='0' cellspacing='0'><tr><td class='left'></td><td class='center'></td><td class='right'></td></tr></table></div>");
                    content3.appendTo(content);
                    content3 = content3.find(".middle .center");
                    for (var n = 0; n < menuDataSub.length; ++n) {
                        var menuItemClass3 = "";
                        if (menuDataSub[n].colId == pageColId || menuDataSub[n].colId == fromColId) {
                            menuItemClass3 = " itemSelected"
                        }
                        var menuItem3 = "<table class='item" + menuItemClass3 + "' cellpadding='0' cellspacing='0'><tr><td class='itemLeft'></td><td class='itemCenter'><a href='" + menuDataSub[n].href + "'>" + menuDataSub[n].html + "</a></td><td class='itemRight'></td></tr></table>";
                        $(menuItem3).appendTo(content3)
                    }
                }
                menu.insertAfter($(this));
                menu.find(".item").hover(function() {
                    $(this).addClass("itemHover")
                },
                function() {
                    $(this).removeClass("itemHover")
                })
            } else {
                var item = $(this);
                var pageColId = top._colId;
                var fromColId = top._fromColId;
                var colId = item.attr("colId");
                var id = item.attr("id");
                var menuData = top.eval(id + "SubMenu");
                var current = false;
                if (pageColId == colId || fromColId == colId) {
                    current = true
                } else {
                    if (menuData && menuData.length >= 1) {
                        for (var i = 0; i < menuData.length; ++i) {
                            var colId2 = menuData[i].colId;
                            if (colId2 == pageColId || colId2 == fromColId) {
                                current = true;
                                break
                            }
                            if (!Fai.isNull(menuData[i].sub)) {
                                var menuDataSub = menuData[i].sub;
                                for (var n = 0; n < menuDataSub.length; ++n) {
                                    var colId3 = menuDataSub[n].colId;
                                    if (colId3 == pageColId || colId3 == fromColId) {
                                        current = true;
                                        break
                                    }
                                }
                            }
                            if (current) {
                                break
                            }
                        }
                    }
                }
                if (menuData) {
                    Site.removeNavHiddenMenu(menuData)
                }
                if (current) {
                    item.addClass("itemSelected");
                    if (menuData && menuData.length >= 1) {
                        item.addClass("itemPopupSelected")
                    }
                }
                $(this).hover(function() {
                    var item = $(this);
                    var id = item.attr("id");
                    var menuData = top.eval(id + "SubMenu");
                    item.addClass("itemHover");
                    if (menuData && menuData.length >= 1) {
                        item.addClass("itemPopupHover")
                    }
                    var menu = Fai.showMenu({
                        mode: menuMode,
                        id: id + "SubMenu",
                        minWidth: item.width(),
                        host: item,
                        cls: "navSubMenu",
                        data: menuData,
                        fixpos: false
                    });
                    menu.hover(function() {
                        item.addClass("itemHover");
                        if (top.eval(id + "SubMenu").length > 0) {
                            item.addClass("itemPopupHover")
                        }
                    },
                    function() {
                        item.removeClass("itemHover");
                        item.removeClass("itemPopupHover")
                    })
                },
                function() {
                    $(this).removeClass("itemHover");
                    $(this).removeClass("itemPopupHover");
                    if ($(".navSubMenu").length == 0) {
                        $(this).removeClass("itemHover")
                    }
                })
            }
        })
    };
    Site.removeNavHiddenMenu = function(C) {
        for (var B = C.length - 1; B >= 0; --B) {
            if (C[B].hidden) {
                C.splice(B, 1);
                continue
            }
            if (C[B].sub) {
                var A = C[B].sub;
                for (var D = A.length - 1; D >= 0; --D) {
                    if (A[D].hidden) {
                        A.splice(D, 1)
                    }
                }
            }
        }
    };
    Site.showNavItemContainer = function() {
        Site.hideNavItemContainer();
        var B = $("#nav .itemContainer");
        var A = $("#nav .navCenter").width();
        var D = 0;
        $.each($("#nav .item"),
        function() {
            D += Fai.getDivWidth($(this))
        });
        $.each($("#nav .itemSep"),
        function() {
            D += Fai.getDivWidth($(this))
        });
        if (Fai.isIE9()) {
            D += $("#nav .item").length
        }
        if (D > A) {
            B.css("width", D + "px");
            var F = $("#nav").find(".itemPrev");
            var C = $("#nav").find(".itemNext");
            var E = null;
            C.css("display", "block");
            C.mouseover(function() {
                $(this).addClass("itemNextHover");
                clearInterval(E);
                E = setInterval(function() {
                    if ((Math.abs(B.position().left) + A) > D) {
                        C.css("display", "none");
                        clearInterval(E)
                    } else {
                        B.css("left", (B.position().left - 1) + "px");
                        if ($("#nav .itemContainer").position().left < 0) {
                            F.css("display", "block")
                        }
                    }
                },
                12)
            }).mousedown(function() {
                $(this).addClass("itemNextHover");
                clearInterval(E);
                E = setInterval(function() {
                    if ((Math.abs(B.position().left) + A) > D) {
                        C.css("display", "none");
                        clearInterval(E)
                    } else {
                        B.css("left", (B.position().left - 1) + "px");
                        if ($("#nav .itemContainer").position().left < 0) {
                            F.css("display", "block")
                        }
                    }
                },
                2)
            }).mouseleave(function() {
                $(this).removeClass("itemNextHover");
                clearInterval(E)
            });
            F.mouseover(function() {
                $(this).addClass("itemPrevHover");
                clearInterval(E);
                E = setInterval(function() {
                    if (B.position().left >= 0) {
                        F.css("display", "none");
                        clearInterval(E)
                    } else {
                        B.css("left", (B.position().left + 1) + "px");
                        if ((Math.abs($("#nav .itemContainer").position().left) + A) < D) {
                            C.css("display", "block")
                        }
                    }
                },
                12)
            }).mousedown(function() {
                $(this).addClass("itemPrevHover");
                clearInterval(E);
                E = setInterval(function() {
                    if (B.position().left >= 0) {
                        F.css("display", "none");
                        clearInterval(E)
                    } else {
                        B.css("left", (B.position().left + 1) + "px");
                        if ((Math.abs($("#nav .itemContainer").position().left) + A) < D) {
                            C.css("display", "block")
                        }
                    }
                },
                2)
            }).mouseleave(function() {
                $(this).removeClass("itemPrevHover");
                clearInterval(E)
            })
        }
    };
    Site.hideNavItemContainer = function() {
        $("#nav .itemContainer").removeAttr("style");
        $("#nav").find(".itemPrev").hide();
        $("#nav").find(".itemNext").hide()
    };
    Site.hideNavSubMenu = function() {
        top.$.each(top.$("#nav .navCenter .item"),
        function(A, B) {
            $(this).unbind()
        })
    };
    Site.initModulePhotoSwitch = function(A, B) {
        $("#photoSwitch" + A).imageSwitch(B)
    };
    Site.loadPhotoMarquee = function(H, K, L) {
        var I = $("#module" + H);
        if (Fai.isNull(I)) {
            return
        }
        var D = 0;
        if (!L) {
            I.find(".photoMarqueeForm").each(function() {
                var P = $(this).attr("faiWidth");
                var O = $(this).attr("faiHeight");
                if (Fai.isNull(O)) {
                    return
                }
                var Q = $(this).find(".imgDiv");
                var N = Q.width();
                var R = Q.height();
                var S = Fai.Img.calcSize(P, O, N, R, Fai.Img.MODE_SCALE_FILL);
                if (S.height > D) {
                    D = S.height
                }
            })
        }
        var A = 0;
        var C = 0;
        var M = 0;
        I.find(".photoMarqueeForm").each(function() {
            var O = $(this);
            var T = O.attr("faiHeight");
            if (Fai.isNull(T)) {
                return
            }
            var S = O.attr("faiWidth");
            var W = O.find(".imgDiv");
            var U = W.width();
            if (L) {
                D = W.height()
            }
            var R = {
                width: U,
                height: D
            };
            if (K) {
                if (L) {
                    R = Fai.Img.calcSize(S, T, U, D, Fai.Img.MODE_SCALE_FILL)
                } else {
                    R = Fai.Img.calcSize(S, T, U, D, Fai.Img.MODE_SCALE_DEFLATE_HEIGHT)
                }
            }
            var Q = W.find("img");
            Q.css("width", R.width + "px");
            Q.css("height", R.height + "px");
            var P = R.width;
            var V = O.find(".propDiv");
            if (V.width() != P) {
                V.css("width", P + "px")
            }
            if (W.width() != P) {
                W.css("width", P + "px")
            }
            if (W.height() != D) {
                W.css("height", D + "px")
            }
            if (O.height() > C) {
                C = $(this).height()
            }
            var N = Fai.getDivWidth(O);
            if (N > M) {
                M = N
            }
            A += N
        });
        var G = I.find(".demo");
        var E = I.find(".demo0");
        if (C > 0) {
            G.css("height", C + "px")
        }
        if (A > G.width()) {
            E.css("width", (A + M) + "px");
            var B = $("<div id='photoMarqueeFormEmpty" + H + "' style='width:" + M + "px;height:" + C + "px;'></div>");
            B.appendTo(E);
            var J = 35;
            if (Fai.isIE6()) {
                J = 20
            }
            function F() {
                var O = E.children().first();
                if (O.length != 1) {
                    return
                }
                var N = Fai.getDivWidth(O);
                if (G.scrollLeft() >= N) {
                    G.scrollLeft(0);
                    O.insertBefore(B)
                } else {
                    G.scrollLeft(G.scrollLeft() + 1)
                }
            }
            Fai.addInterval("Marquee" + H, F, J);
            Fai.startInterval("Marquee" + H);
            G.mouseover(function() {
                Fai.stopInterval("Marquee" + H)
            }).mouseout(function() {
                Fai.startInterval("Marquee" + H)
            })
        } else {
            E.css("width", A + "px")
        }
    };
  
};