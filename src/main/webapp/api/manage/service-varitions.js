// UTIL
function showAlert(id, alertType, message) {
	$(id).addClass(alertType).find(".d-flex > div").text(message);
	$(document).find(".spinner-show").addClass("d-none");
	$(id).parent().removeClass("d-none").hide().fadeIn(500).delay(1500).animate({ height: 'toggle' }, 500, function() {
		$(this).addClass("d-none");
		$(id).removeClass(alertType);
	});
}

function tomSelectInit(id) {
	var el, instance;
	if (window.TomSelect) {
		instance = new TomSelect((el = $(id)), {
			copyClassesToDropdown: false,
			dropdownParent: "body",
			controlInput: "<input>",
			render: {
				item: function(data, escape) {
					if (data.customProperties) {
						return ('<div><span class="dropdown-item-indicator">' + data.customProperties + "</span>" + escape(data.text) + "</div>");
					}
					return "<div>" + escape(data.text) + "</div>";
				},
				option: function(data, escape) {
					if (data.customProperties) {
						return ('<div><span class="dropdown-item-indicator">' + data.customProperties + "</span>" + escape(data.text) + "</div>");
					}
					return "<div>" + escape(data.text) + "</div>";
				}
			},
		});

		// Store reference to the original destroy method
		var originalDestroy = instance.destroy;

		// Override destroy method
		instance.destroy = function() {
			originalDestroy.call(instance); // Call the original destroy method
			instance = null; // Reset the instance
		};

		return instance;
	}
}

function loadDropDowns() {
	// Loads Services
	$.ajax({
		url: SERVICES + "/services",
		type: "GET",
		beforeSend: function() {
			$(document).find(".spinner-show").removeClass("d-none");
		},
		success: function(services) {
			services.forEach(service => {
				if (service.status == true) {
					$("#select-service").append(`
                        <option value="${service.serviceId}">${service.serviceName}</option>
                    `);
					/*
					$("#edit-select-service").append(`
						<option value="${service.serviceId}">${service.serviceName}</option>
					`);
					*/
				}
			});
		},
		error: function(error) {
			console.log(error);
		},
		complete: function() {
			// tomSelectInit("#edit-select-service"); // don't enable it not working in models
			servicesDropdown = tomSelectInit("#select-service");
			serviceItemDropdown = tomSelectInit("#select-service-item");
			variationDropdown = tomSelectInit("#select-variation");
			variationOptionsDropdown = tomSelectInit("#select-variation-option");
			$(document).find(".spinner-show").addClass("d-none");
		}
	});
}

function initDatatable(id, sortClass, listClass, values) {
	new List(id, {
		sortClass: sortClass,
		listClass: listClass,
		valueNames: values,
	});
}

// ENDPOINT: variations
const VARIATIONS = "/variations";

// ENDPOINT: services
const SERVICES = "/services";

// ENDPOINT: service-variation
const SERVICE_VARIATION = "/service-variation";

// Get All service-categories & services
$(document).ready(function() {
	loadDropDowns();
	initDatatable("table-default", "table-sort", "table-tbody", ["sort-map-id", "sort-service", "sort-service-items",
		"sort-service-variations", "sort-action"]);
});

// SERVICE DROPDOWN INSTANCE
let servicesDropdown;
let serviceItemDropdown;
let variationDropdown;
let variationOptionsDropdown;

$("#select-service").on('change', function() {
	serviceItemDropdown.destroy();
	variationDropdown.destroy();
	variationOptionsDropdown.destroy();
	$("#select-variation-option").html(`
		<option value>Select Variation First</option>
	`)
	variationOptionsDropdown = tomSelectInit("#select-variation-option");

	let service = $(this).val();
	// Loads Service Items
	loadServiceItems(service);
	loadVariations(service);
});

$("#select-variation").on('change', function() {
	variationOptionsDropdown.destroy();
	let variation = $(this).val();
	loadvariationOption(variation);
});

// loads Services
function loadServiceItems(service) {
	$.ajax({
		url: SERVICES + "/service-items/" + service,
		type: "GET",
		beforeSend: function() {
			$(document).find(".spinner-show").removeClass("d-none");
		},
		statusCode: {
			404: () => {
				$("#select-service-item").html(`
				<option class="text-danger" value>No Items Found</option>
				`);
			}
		},
		success: function(items) {
			$("#select-service-item").html(`
				<option class="text-danger" value>Select Service Item</option>
				`);
			items.forEach(item => {
				$("#select-service-item").append(`
                        <option value="${item.serviceItemId}">${item.itemName}</option>
                    `);
				/*
				$("#edit-select-service").append(`
					<option value="${service.serviceId}">${service.serviceName}</option>
				`);
				*/
			});
		},
		error: function(error) {
			console.log(error);
		},
		complete: function() {
			// tomSelectInit("#edit-select-service"); // don't enable it not working in models
			serviceItemDropdown = tomSelectInit("#select-service-item");
			$(document).find(".spinner-show").addClass("d-none");
		}
	});
}

// loads Variations 
function loadVariations(service) {
	$.ajax({
		url: VARIATIONS + "/variations/" + service,
		type: "GET",
		beforeSend: function() {
			$(document).find(".spinner-show").removeClass("d-none");
		},
		statusCode: {
			404: () => {
				$("#select-variation").html(`
				<option class="text-danger" value>No Variations Available</option>
				`);
			}
		},
		success: function(variations) {
			$("#select-variation").html(`
				<option class="text-danger" value>Select Variation</option>
				`);
			variations.forEach(variation => {
				$("#select-variation").append(`
                        <option value="${variation.variationId}">${variation.variationName}</option>
                    `);
				/*
				$("#edit-select-service").append(`
					<option value="${service.serviceId}">${service.serviceName}</option>
				`);
				*/
			});
		},
		error: function(error) {
			console.log(error);
		},
		complete: function() {
			// tomSelectInit("#edit-select-service"); // don't enable it not working in models
			variationDropdown = tomSelectInit("#select-variation");
			$(document).find(".spinner-show").addClass("d-none");
		}
	});
}

// loads Variation Options
function loadvariationOption(variation) {
	$.ajax({
		url: VARIATIONS + "/variation-options/" + variation,
		type: "GET",
		beforeSend: function() {
			$(document).find(".spinner-show").removeClass("d-none");
		},
		statusCode: {
			404: () => {
				$("#select-variation-option").html(`
				<option class="text-danger" value>No Variation Options Available</option>
				`);
			}
		},
		success: function(options) {
			$("#select-variation-option").html(`
				<option class="text-danger" value>Select Option</option>
			`);
			options.forEach(option => {
				$("#select-variation-option").append(`
                        <option value="${option.variationOptionId}">${option.variationOptionName}</option>
                    `);
				/*
				$("#edit-select-service").append(`
					<option value="${service.serviceId}">${service.serviceName}</option>
				`);
				*/
			});
		},
		error: function(error) {
			console.log(error);
		},
		complete: function() {
			// tomSelectInit("#edit-select-service"); // don't enable it not working in models
			variationOptionsDropdown = tomSelectInit("#select-variation-option");
			$(document).find(".spinner-show").addClass("d-none");
		}
	});
}


// ADD SERVICE VARIATION MAPPING
$("#add-service-variation").on("submit", function(e) {
	e.preventDefault();
	$.ajax({
		beforeSend: function() {
			$(document).find(".spinner-show").removeClass("d-none");
		},
		url: SERVICE_VARIATION + "/add",
		type: "POST",
		data: $(this).serialize(),
		statusCode: {
			200: () => {
				$("#add-service-variation").trigger("reset");
				servicesDropdown.destroy();
				serviceItemDropdown.destroy();
				variationDropdown.destroy();
				variationOptionsDropdown.destroy();
				servicesDropdown = tomSelectInit("#select-service");
				serviceItemDropdown = tomSelectInit("#select-service-item");
				variationDropdown = tomSelectInit("#select-variation");
				variationOptionsDropdown = tomSelectInit("#select-variation-option");
			},
			500: () => showAlert("#add-service-variation-msg", "alert-danger", "Internal Server Error"),
		},
		success: function() {
			showAlert("#add-service-variation-msg", "alert-success", "Service Variation Added Successfully");
		},
		error: function(data) {
			console.log(data);
		}
	});
});

$(document).on("click", ".edit-service", function() {
	let serviceId = $(this).data("service-id");
	let serviceName = $(this).data("service-name");
	let serviceDescription = $(this).data("service-description");
	let serviceCategory = $(this).data("category");
	let status = $(this).data("status");

	$("#edit-service-id").val(serviceId);
	$("#edit-service-name").val(serviceName);
	$('#edit-service-category option[value="' + serviceCategory + '"]').attr("selected", "selected");
	$("#edit-service-description").val(serviceDescription);

	if (status == 1) {
		$("#edit-service-active").prop("checked", true);
		$("#edit-service-inactive").prop("checked", false);
	} else {
		$("#edit-service-active").prop("checked", false);
		$("#edit-service-inactive").prop("checked", true);
	}

	$.ajax({
		url: SERVICES + "/service-items/" + serviceId,
		type: "GET",
		statusCode: {
			404: () => $("#model-table-body").html(`
			<tr>
				<td colspan="3" class="text-danger text-center">No Service Items Found</td>
			</tr>
			`)
		},
		success: function(serviceItems) {
			console.log(serviceItems);
			let bodyData = "";
			$.each(serviceItems, function(index, value) {
				bodyData += ` 
			        <tr>
			            <td class="sort-servive-item-id" class="text-secondary">${value.serviceItemId}</td>
			            <td class="sort-service-item-name">
			                <div class="d-flex py-1 align-items-center">
			                    <div class="flex-fill">
			                        <div class="font-weight-medium">${value.itemName}</div>
			                    </div>
			                </div>
			            </td>
			            <td>
			                <div class="btn-list flex-nowrap">
			                	<button class="btn edit-service-item" data-bs-target="#modal-edit-item" data-bs-toggle="modal" data-service-item-id="${value.serviceItemId}">Edit</button>
			                    <button class="btn delete-service-item" data-service-item-id="${value.serviceItemId}">Delete</button>
			                </div>
			            </td>
			        </tr>`
			});
			$("#model-table-body").html(bodyData);
			initDatatable("table-service-items-wrapper", "table-sort", "table-service-item-body", ["sort-service-item-id", "sort-service-item-name", "sort-action"]);
		},
		error: function(error) {
			console.log(error);
		}
	});
});

// to prevent auto submission on model while clicking on data table
$("#edit-service-form").on("submit", function(e) {
	e.preventDefault();
});

// Update Service
$("#update-service-btn").on("click", function() {
	$.ajax({
		beforeSend: function() {
			$(document).find(".spinner-show").removeClass("d-none");
		},
		url: SERVICES + "/update",
		type: "PUT",
		data: $("#edit-service-form").serialize(),
		statusCode: {
			500: () => showAlert("#edit-service-msg", "alert-danger", "Internal Server Error"),
		},
		success: function() {
			showAlert("#edit-service-msg", "alert-success", "Service Updated Successfully");
		}
	});
});

// DELETE MAPPING
$(document).on("click", ".delete-service-variation", function() {
	let id = $(this).data("map-id");
	let element = this;
	$.ajax({
		url: SERVICE_VARIATION + "/delete/" + id,
		type: "DELETE",
		statusCode: {
			404: function(data) {
				$(element).closest("tr").fadeOut("slow");
				$(element).closest("tbody").append("<tr><td colspan='3' class='alert alert-danger' role='alert'>" + data.responseText + "</td></tr>");
				$(element).closest("tbody").find("tr:last-child")
					.hide()
					.fadeIn(500)
					.delay(1000)
					.animate({ opacity: 0, height: 'toggle' }, 500, function() {
						$(this).fadeOut(500);
					});
			},
		},
		success: function(data) {
			$(element).closest("tr").html("<td colspan='3' class='alert alert-success' role='alert'>" + data + "</td>")
				.hide() // Initially hide the row
				.fadeIn(500) // Fade in the row with a 500-millisecond animation
				.delay(1000) // Wait for 1 second
				.animate({ opacity: 0, height: 'toggle' }, 500, function() {
					$(this).fadeOut(500); // Remove the row after the animation
				});
		}
	});
});


// delete service item
$(document).on("click", ".delete-service-item", function() {
	let id = $(this).data("service-item-id");
	let element = this;
	// let actionStatus;
	$.ajax({
		beforeSend: function() {
			//	actionStatus = $(element).closest("tbody").append("<tr><td colspan='5' class='alert alert-warning' role='alert'>Please wait while we delete service item...</td></tr>");
		},
		url: SERVICES + "/delete-item/" + id,
		type: "DELETE",
		statusCode: {
			404: function(data) {
				$(element).closest("tr").fadeOut("slow");
				$(element).closest("tbody").append("<tr><td colspan='5' class='alert alert-danger' role='alert'>" + data.responseText + "</td></tr>");
				$(element).closest("tbody").find("tr:last-child")
					.hide()
					.fadeIn(500)
					.delay(1000)
					.animate({ opacity: 0, height: 'toggle' }, 500, function() {
						$(this).fadeOut(500);
					});
			},
		},
		success: function(data) {
			$(element).closest("tr").html("<td colspan='5' class='alert alert-success' role='alert'>" + data + "</td>")
				.hide() // Initially hide the row
				.fadeIn(500) // Fade in the row with a 500-millisecond animation
				.delay(1000) // Wait for 1 second
				.animate({ opacity: 0, height: 'toggle' }, 500, function() {
					$(this).fadeOut(500); // Remove the row after the animation
				});
		},
		complete: function() {
			//	$(actionStatus).hide();
		}
	});
});

// load Service Item Model
$(document).on("click", ".edit-service-item", function() {
	let serviceItem = $(this).data("service-item-id");
	$.ajax({
		url: SERVICES + "/service-item/" + serviceItem,
		type: "GET",
		success: function(data) {
			console.log(data);
			$("#edit-service-item-id").val(data.serviceItemId);
			$('#edit-select-service option[value="' + data.service.serviceId + '"]').attr("selected", "selected");
			$("#edit-service-item-name").val(data.itemName);
			$("#edit-service-item-price").val(data.approxPrice);

			let images = "";
			$.each(data.images, function(index, value) {
				images += `
				<div>
					<img class="avatar avatar-lg" src="${value.url}" alt="${data.itemName}" />
				</div>
				`;
			});

			$("#service-item-images").html(images);

		},
		error: function(data) {
			console.log(data);
		}
	});
});

// update Service Item
$("#edit-service-item").on("submit", function(e) {
	e.preventDefault();
	$.ajax({
		beforeSend: function() {
			$(document).find(".spinner-show").removeClass("d-none");
		},
		url: SERVICES + "/update-item",
		type: "PUT",
		data: $(this).serialize(),
		statusCode: {
			500: () => showAlert("#edit-service-item-msg", "alert-danger", "Internal Server Error"),
		},
		success: function() {
			showAlert("#edit-service-item-msg", "alert-success", "Service Updated Successfully");
		}
	});
})