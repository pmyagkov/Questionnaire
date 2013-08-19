$.validator.unobtrusive.adapters.add("mandatory", function (options) {
    options.rules["required"] = true;
    if (options.message) {
        options.messages["required"] = options.message;
    }
});

$.validator.unobtrusive.adapters.addBool("mandatory", "required");
