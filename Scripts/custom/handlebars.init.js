jQuery(function ($) {
    var templateMarkup = $('#task-template').html();
    var template = Handlebars.compile(templateMarkup);
    var rendered = template(window.templateData);
    $('.b-content').append(rendered);

    $.validator.unobtrusive.parse(document);
});
