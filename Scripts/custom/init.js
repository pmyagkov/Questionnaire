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

    $("select[name='recommend']").change(function (e) {
        var $select = $(this);
        if ($select.val() == "другое") {
            $select.next().show();
        }
        else {
            $select.next().hide().find("input").val("");
        }
    });


    var agreeText = $("[for='agree'].b-static-text").text();
    var beg =  agreeText.substr(0, 1);
    var end = agreeText.substr(1);

    $("[for='agree'].b-static-text").empty().append(beg).append($("<span class='name'/>")).append(end);


    $("[name='name']").keyup(function (e) {
        var name = $(this).val();
        var $name =$("[for='agree'].b-static-text .name");
        if (name.length) {
            $name.text(', ' + name + ',');
        }
        else {
            $name.text('');
        }

        var v = $("[for='agree'].b-static-text").val();

    });

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
