// UTIL
function showAlert(id, alertType, message) {
    $(id).addClass(alertType).find(".d-flex > div").text(message);
    $(document).find(".spinner-show").addClass("d-none");
    $(id).parent().removeClass("d-none").hide().fadeIn(500).delay(1500).animate({ height: 'toggle' }, 500, function () {
        $(this).addClass("d-none");
        $(id).removeClass(alertType);
    });
}

function tomSelectInit(id) {
    var el;
    if (window.TomSelect) {
        new TomSelect((el = $(id)), {
            copyClassesToDropdown: false,
            dropdownParent: "body",
            controlInput: "<input>",
            render: {
                item: function (data, escape) {
                    if (data.customProperties) {
                        return ('<div><span class="dropdown-item-indicator">' + data.customProperties + "</span>" + escape(data.text) + "</div>");
                    }
                    return "<div>" + escape(data.text) + "</div>";
                },
                option: function (data, escape) {
                    if (data.customProperties) {
                        return ('<div><span class="dropdown-item-indicator">' + data.customProperties + "</span>" + escape(data.text) + "</div>");
                    }
                    return "<div>" + escape(data.text) + "</div>";
                }
            },
        });
    }
}

function loadDropDowns() {
    // Loads Service Categories
    $.ajax({
        url: SERVICE_CATEGORY + "/categories",
        type: "GET",
        beforeSend: function () {
            $(document).find(".spinner-show").removeClass("d-none");
        },
        success: function (categories) {
            categories.forEach(category => {
                if (category.active == true)
                    $("#service-category").append(`
                        <option value="${category.serviceCategoryId}">${category.serviceCategoryName}</option>
                    `);
            });
        },
        error: function (error) {
            console.log(error);
        },
        complete: function () {
            tomSelectInit("#service-category");
            $(document).find(".spinner-show").addClass("d-none");
        }
    });

    // Loads Variations
    $.ajax({
        url: VARIATION + "/variations",
        type: "GET",
        beforeSend: function () {
            $(document).find(".spinner-show").removeClass("d-none");
        },
        success: function (variations) {
            variations.forEach(variation => {
                $("#variations-select").append(`
                        <option value="${variation.variationId}">${variation.variationName}</option>
                    `);
            });
        },
        error: function (error) {
            console.log(error);
        },
        complete: function () {
            tomSelectInit("#variations-select");
            $(document).find(".spinner-show").addClass("d-none");
        }
    });
}

// ENDPOINT: service-categories
const SERVICE_CATEGORY = "/service-categories"
const VARIATION = "/variations"

// Get All service-categories
$(document).ready(function () {
    loadDropDowns();
});

// ADD VARIATION FOR CATEGORY
$("#add-variation").on("submit", function (e) {
    e.preventDefault();
    $(document).find(".spinner-show").removeClass("d-none");
    $.ajax({
        url: VARIATION + "/add-variations",
        type: "POST",
        data: $(this).serialize(),
        statusCode: {
            200: () => $("#add-variation").trigger("reset"),
            500: () => showAlert("#add-variation-msg", "alert-danger", "Internal Server Error"),
        },
        success: function () {
            showAlert("#add-variation-msg", "alert-success", "Variation Added Successfully");
        },
    });
});

// ADD VARIATION OPTION
$("#add-variation-option").on("submit", function (e) {
    e.preventDefault();
    $(document).find(".spinner-show").removeClass("d-none");
    $.ajax({
        url: VARIATION + "/add-variation-options",
        type: "POST",
        data: $(this).serialize(),
        statusCode: {
            200: () => $("#add-variation-option").trigger("reset"),
            500: () => showAlert("#add-variation-option-msg", "alert-danger", "Internal Server Error"),
        },
        success: function () {
            showAlert("#add-variation-option-msg", "alert-success", "Variation Added Successfully");
        },
    });
});