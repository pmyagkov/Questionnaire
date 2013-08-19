jQuery.fn.unanswered = function (options) {
    var $control = $(this);

    var getUnanswered = function () {
        var result = _.groupBy($("[data-question]:not(a)"), function (e) { return $(e).data("question");});
        result = _(result).filter(function (e) {
            var some =  _.every(e, function (el) {
                var $e = $(el);
                if ($e.is(":radio")) {
                    return !$e.is(":checked");
                }
                else {
                    return !$e.val();
                }
            });

            return some;
        });

        return result.length;
    };

    $("body").on("blur", "textarea[data-question]", function (e) {
        $control.text(getUnanswered());

    }).on("change", "input[data-question]", function (e) {
        $control.text(getUnanswered());
    });

    $control.text(getUnanswered());








    jQuery.expr.pseudos.answered = jQuery.expr.createPseudo(function(arg) {
        return function(elem) {
            var $elem = $(elem).closest("[data-question]");

            if (!$elem.length) {
                return false;
            }

            return _.some($("[data-question=" + $elem.data("question") + "]"), function (e) {
                var $e = $(e);
                if ($e.is(":radio")) {
                    return $e.is(":checked");
                }
                else {
                    return !!$e.val();
                }

            });
        };
    });

    return this;
}


jQuery.fn.accordion = function (options) {

    if (options.linkSelector) {
        $(document).on("click", options.linkSelector, function (e) {
            var $link = $(e.target).closest("a");
            var $container = $link.closest(options.containerSelector);
            if ($container.is(".collapsed")) {
                $container.toggleClass("collapsed").find("td:eq(1)>*").show().end()
                    .next("tr").show();
                $link.removeClass("b-task__accord-pointer_answer_none");
            }
            else {
                $container.toggleClass("collapsed").find("td:eq(1)>*").hide().end()
                    .next("tr").hide();
                if (!$link.is(":answered")) {
                    $link.addClass("b-task__accord-pointer_answer_none");

                }
            }
        });
    }

    return this;
}

jQuery.fn.toTheTop = function (options) {
    var $panel = $(this);
    var $window = $(window);
    $window.on("scroll", function () {
        $(".b-rest-questions")[$window.scrollTop() > 200 ? "show" : "hide"]();
        $panel[$window.scrollTop() > $window.height() / 2 ? "show" : "hide"]();
    });

    $panel.on("click", function (e) {
        $("html,body").animate({scrollTop: "0px"}, 200);
    })

    return this;

}
