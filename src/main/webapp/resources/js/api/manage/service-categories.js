function showAlert(id, alertType, message) {
    $(id).addClass(alertType).find(".d-flex > div").text(message);
    $("#add-service-category-msg").parent().removeClass("d-none").hide().fadeIn(500).delay(1500).animate({ height: 'toggle' }, 500, function () {
        $(this).addClass("d-none");
    });
}

// APIs REQUESTS FOR SERVICE CATEGORIES

// ENDPOINT: service-categories/add-service-category
const ENDPOINT_BASE = "/service-categories"

// ADD SERVICE CATEGORY
$("#add-service-category").on("submit", function (e) {
    e.preventDefault();
    $.ajax({
        url: ENDPOINT_BASE + "/add-service-categories",
        type: "POST",
        data: new FormData(this),
        enctype: "multipart/form-data",
        cache: false,
        contentType: false,
        processData: false,
        statusCode: {
            200: () => $("#add-service-category").trigger("reset"),
            500: () => showAlert("#add-service-category-msg", "alert-danger", "Internal Server Error"),
        },
        success: function (data) {
            showAlert("#add-service-category-msg", "alert-success", "Service Category Added Successfully");
        }
    });
});


// DELETE SERVICE CATEGORY
// Delete Faculty
$(document).on("click", ".delete-service-category", function () {
    let id = $(this).data("id");
    let element = this;
    $.ajax({
        url: ENDPOINT_BASE + "/delete-service-categories/" + id,
        type: "DELETE",
        statusCode: {
            403: function (data) {
                $(element).closest("tbody").append("<tr><td colspan='4' class='alert alert-danger' role='alert'>" + data.responseText + "</td></tr>");
                $(element).closest("tbody").find("tr:last-child")
                    .hide()
                    .fadeIn(500)
                    .delay(1000)
                    .animate({ opacity: 0, height: 'toggle' }, 500, function () {
                        $(this).fadeOut("slow");
                    });
            },
            404: function (data) {
                $(element).closest("tr").fadeOut("slow");
                $(element).closest("tbody").append("<tr><td colspan='4' class='alert alert-danger' role='alert'>" + data.responseText + "</td></tr>");
                $(element).closest("tbody").find("tr:last-child")
                    .hide()
                    .fadeIn(500)
                    .delay(1000)
                    .animate({ opacity: 0, height: 'toggle' }, 500, function () {
                        $(this).fadeOut(500);
                    });
            },
        },
        success: function () {
            $(element).closest("tr").html("<td colspan='4' class='alert alert-success' role='alert'>Category Deleted Successfully</td>")
                .hide() // Initially hide the row
                .fadeIn(500) // Fade in the row with a 500-millisecond animation
                .delay(1000) // Wait for 1 second
                .animate({ opacity: 0, height: 'toggle' }, 500, function () {
                    $(this).fadeOut(500); // Remove the row after the animation
                });
        }
    });
});
