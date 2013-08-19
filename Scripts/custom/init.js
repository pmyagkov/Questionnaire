jQuery(function ($) {

    var getHighlightElement = function(e) {
        var $e = $(e);
        var $box = $e.closest(".b-input__border");
        return $box.length ? $box : $e;
    };

    var $form = $("form");

    $form.validate().settings["highlight"] = function ( element, errorClass, validClass ) {
        getHighlightElement(element).removeClass(validClass).addClass(errorClass);
    };
    $form.validate().settings["unhighlight"] = function (element, errorClass, validClass) {
        getHighlightElement(element).addClass(validClass).removeClass(errorClass);
    };

    $form.validate().settings["ignore"] = "";

    $(".b-rest-questions__value").unanswered({});
    $(document).accordion({linkSelector: ".b-task__accord-pointer", containerSelector: "tr"});
    $(".b-to-top").toTheTop({});

    $("form").ajaxForm({
        dataType: 'json',
        success: function(data) {
            console.log(data);
            if (!data.Result) {
                if (_.keys(data.Errors).length) {
                    var validator = $("form").validate();
                    validator.showErrors(data.Errors);
                }
            } else {
                window.location = "thanks.html";
            }
        }
    });
});
