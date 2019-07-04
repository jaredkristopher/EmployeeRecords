var id = 0;

$(document).ready(function () {
    get();
});

function get() {
    $('#tbody').text('');

    (new http).post("employees.aspx/get", {

    }).then(function (response) {

        var items = response.d.map(item => {
            return new Promise(function (resolve, reject) {
                var isActive = item.DatedDeleted == "" ? "Activated" : "Not Activated";

                var active = "<i data-id=\"" + item.ID + "\" data-name=\"" + item.FirstName + " " + item.LastName + "\" class=\"fa fa-remove remove\">" +
                                   //"<span class=\"tooltiptext\">Click to deactivate</span>" +
                               "</i>";
                var inactive = "<i data-id=\"" + item.ID + "\" data-name=\"" + item.FirstName + " " + item.LastName + "\" class=\"fa fa-check-circle activate\">" +
                                   //"<span class=\"tooltiptext\">Click to activate</span>" +
                               "</i>";

                var statusAction = isActive == "Not Activated" ? inactive : active;

                var html = "<tr>" +
                           "<td>" + item.ID + "</td>" +
                           "<td><img class='img-responsive' src=\"Content/img/29-512.png\"/></td>" +
                           "<td>" + item.FirstName + " " + item.LastName + "</td>" +
                           "<td>" + item.Email + "</td>" +
                           "<td>" + item.Contact + "</td>" +
                           "<td>" + isActive + "</td>" +
                           "<td>" + item.Gender + "</td>" +
                           "<td>" +
                               "<i data-id=\"" + item.ID + "\" class=\"fa fa-search view\" data-toggle='modal' data-target='#view-modal'> " +
                                   //"<span class=\"tooltiptext\">Click to view details</span>" +
                               "</i>";
                html += "<i data-id=\"" + item.ID + "\" class=\"fa fa-edit edit\" data-toggle='modal' data-target='#editModal'>" +
                        //"<span class=\"tooltiptext\">Click to modify details</span>" +
                    "</i>";

                html += statusAction;

                html += "</td>" +
               "</tr>";

                $('#tbody').append(html);
                resolve();
            });
        });

        Promise.all(items).then(function () {
            //$('.loading').remove();
            //$('#tbl').DataTable();
        });
    }).run();
}

$(document).on('click', '#save', function (e) {
    e.preventDefault();

    //if (isInputValid()) {
        //$('.fa-spin').removeClass('hidden');

    (new http).post("employees.aspx/insert", {
            fname: $('#first-name').val(),
            lname: $('#last-name').val(),
            mname: $('#MI').val(),
            email: $('#email').val(),
            password: $('#password').val(),
            contact: $('#contact').val(),
            address: $('#address').val().replace(/,/g, " "),
            birthday: $('#birthday').val(),
            gender: $('#gender').val(),
            religion: $('#religion').val(),
            nationality: $('#nationality').val(),
            birthplace: $('#birthplace').val(),
            civilstatus: $('#civilstatus').val(),
            employeestatus: $('#employeestatus').val(),
            role: $('#role').val()
            //image: $('#ContentPlaceHolder1_image').val().split('\\')[$('#ContentPlaceHolder1_image').val().split('\\').length - 1]
        }).then(function (response) {
            $('#ContentPlaceHolder1_upload').trigger('click');
        }).run();
    //}
});

$(document).on('click', '.view', function () {
    id = $(this).data('id');

    (new http).post("instructors.aspx/find", {
        id: id
    }).then(function (response) {
        var item = response.d[0];

        $('#fnameView').val(item.Firstname);
        $('#lnameView').val(item.Lastname);
        $('#mnameView').val(item.Middlename);
        $('#emailView').val(item.Email);
        $('#addressView').val(item.Address);
        $('#contactView').val(item.Contact);
        $('#imageLabelView').text(item.ImagePath);

        $('#viewModal .form-control').prop('disabled', true);
    }).run();
});

$(document).on('click', '.edit', function () {
    id = $(this).data('id');

    (new http).post("instructors.aspx/find", {
        id: id
    }).then(function (response) {
        var item = response.d[0];

        $('#fnameEdit').val(item.Firstname);
        $('#lnameEdit').val(item.Lastname);
        $('#mnameEdit').val(item.Middlename);
        $('#emailEdit').val(item.Email);
        $('#addressEdit').val(item.Address);
        $('#contactEdit').val(item.Contact);
        $('#imageLabel').text(item.ImagePath);

    }).run();
});

$(document).on('click', '#saveChanges', function (e) {
    e.preventDefault();

    if (isInputEditValid()) {
        $('.fa-spin').removeClass('hidden');

        (new http).post("instructors.aspx/update", {
            id: id,
            fname: $('#fnameEdit').val(),
            lname: $('#lnameEdit').val(),
            mname: $('#mnameEdit').val(),
            email: $('#emailEdit').val(),
            address: $('#addressEdit').val(),
            contact: $('#contactEdit').val(),
            roleID: 1,
            image: $('#imageLabel').text()
        }).then(function (response) {
            if ($('#ContentPlaceHolder1_imageEdit').val() != '') {
                $('#ContentPlaceHolder1_uploadChanges').trigger('click');
            } else {
                swal('Successfully Updated!', 'Instructor has been successfully updated.', 'success');
                get();
                $('.fa-spin').addClass('hidden');
                $('.close').click();
            }
        }).run();
    }

});

$(document).on('click', '.remove', function () {
    id = $(this).data('id');
    var name = $(this).data('name');

    swal({
        title: 'Are you sure you want to deactivate ' + $(this).data('name') + '?',
        text: "You won't be able to revert this action!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'green',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Deactivate!'
    }).then(function (isConfirm) {
        if (isConfirm.value == true) {
            (new http).post("instructors.aspx/deactivate", {
                id: id,
                name: name
            }).then(function (response) {
                swal('Successfully Deactivated', 'User Has Been Deactivated!', 'success');
                get();
            }).run();
        }
    })
});

$(document).on('click', '.activate', function () {
    id = $(this).data('id');
    var name = $(this).data('name');

    swal({
        title: 'Are you sure you want to activate ' + name + '?',
        text: "You won't be able to revert this action!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'green',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Activate!'
    }).then(function (isConfirm) {
        if (isConfirm.value == true) {
            (new http).post("instructors.aspx/activate", {
                id: id,
                name: name
            }).then(function (response) {
                swal('Successfully Activated', 'User Has Been Activated!', 'success');
                get();
            }).run();
        }
    })
});

function isInputValid() {
    var isFirstValid = $("#fname").validate(['required']).displayErrorOn($("#errorFname"));
    var isLastValid = $("#lname").validate(['required']).displayErrorOn($("#errorLname"));
    var isEmailValid = $("#email").validate(['email']).displayErrorOn($("#errorEmail"));
    var isPasswordValid = $("#password").validate(['required']).displayErrorOn($("#errorPassword"));
    var isAddressValid = $("#address").validate(['required']).displayErrorOn($("#errorAddress"));
    var isContactValid = $("#contact").validate(['required']).displayErrorOn($("#errorContact"));
    var isImageValid = $("#ContentPlaceHolder1_image").validate(['required']).displayErrorOn($("#errorImage"));

    return isFirstValid && isLastValid && isEmailValid && isPasswordValid && isImageValid && isAddressValid && isContactValid;
}

function isInputEditValid() {
    var isFirstValid = $("#fnameEdit").validate(['required']).displayErrorOn($("#errorFnameEdit"));
    var isLastValid = $("#lnameEdit").validate(['required']).displayErrorOn($("#errorLnameEdit"));
    var isEmailValid = $("#emailEdit").validate(['email']).displayErrorOn($("#errorEmailEdit"));
    var isAddressValid = $("#addressEdit").validate(['required']).displayErrorOn($("#errorAddressEdit"));
    var isContactValid = $("#contactEdit").validate(['required']).displayErrorOn($("#errorContactEdit"));

    return isFirstValid && isLastValid && isEmailValid && isAddressValid && isContactValid;
}

$(document).on('click', '#add', function (e) {
    e.preventDefault();

});

$(document).on('click', '#imageLabel', function (e) {
    e.preventDefault();

    $('#ContentPlaceHolder1_imageEdit').trigger('click');
});

$(document).on('change', '#ContentPlaceHolder1_imageEdit', function (e) {
    e.preventDefault();

    $('#imageLabel').text($('#ContentPlaceHolder1_imageEdit').val().split('\\')[$('#ContentPlaceHolder1_imageEdit').val().split('\\').length - 1]);
});