var id = 0;

$(document).ready(function () {
    get();
});

function get() {
    $('#tbody').text('');

    (new http).post("employees.aspx/get", {

    }).then(function (response) {

        console.log(response.d[0].ID);

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
                           "<td>" + item.EmployeeNumber + "</td>" +
                           "<td><img class='img-responsive' src=\"Content/img/29-512.png\"/></td>" +
                           "<td>" + item.FirstName + " " + item.LastName + "</td>" +
                           "<td>" + item.Email + "</td>" +
                           "<td>" + item.Contact + "</td>" +
                           "<td>" + item.Address + "</td>" +
                           "<td>" + item.Gender + "</td>" +
                           "<td>" + isActive + "</td>" +
                           "<td>" +
                               "<i data-id=\"" + item.ID + "\" class=\"fa fa-search view\" data-toggle='modal' data-target='#view-modal' data-backdrop='static' data-keyboard='false'> " +
                                   //"<span class=\"tooltiptext\">Click to view details</span>" +
                               "</i>";
                html += "<i data-id=\"" + item.ID + "\" class=\"fa fa-edit edit\" data-toggle='modal' data-target='#edit-modal' data-backdrop='static' data-keyboard='false'>" +
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

//function getBenefits() {
//    $('#tbodyBenefits').text('');

//    (new http).post("employees.aspx/getBenefits", {

//    }).then(function (response) {

//        console.log(response.d[0].ID);

//        var items = response.d.map(item => {
//            return new Promise(function (resolve, reject) {
//                var isActive = item.DatedDeleted == "" ? "Activated" : "Not Activated";

//                var active = "<i data-id=\"" + item.ID + "\" data-name=\"" + item.FirstName + " " + item.LastName + "\" class=\"fa fa-remove remove\">" +
//                                   //"<span class=\"tooltiptext\">Click to deactivate</span>" +
//                               "</i>";
//                var inactive = "<i data-id=\"" + item.ID + "\" data-name=\"" + item.FirstName + " " + item.LastName + "\" class=\"fa fa-check-circle activate\">" +
//                                   //"<span class=\"tooltiptext\">Click to activate</span>" +
//                               "</i>";

//                var statusAction = isActive == "Not Activated" ? inactive : active;

//                var html = "<tr>" +
//                           "<td>" + item.ID + "</td>" +
//                           "<td><img class='img-responsive' src=\"Content/img/29-512.png\"/></td>" +
//                           "<td>" + item.FirstName + " " + item.LastName + "</td>" +
//                           "<td>" + item.Email + "</td>" +
//                           "<td>" + item.Contact + "</td>" +
//                           //"<td>" + isActive + "</td>" +
//                           "<td>" + item.Address + "</td>" +
//                           "<td>" + item.Gender + "</td>" +
//                           "<td>" +
//                               "<i data-id=\"" + item.ID + "\" class=\"fa fa-search view\" data-toggle='modal' data-target='#view-modal'> " +
//                                   //"<span class=\"tooltiptext\">Click to view details</span>" +
//                               "</i>";
//                html += "<i data-id=\"" + item.ID + "\" class=\"fa fa-edit edit\" data-toggle='modal' data-target='#editModal'>" +
//                        //"<span class=\"tooltiptext\">Click to modify details</span>" +
//                    "</i>";

//                html += statusAction;

//                html += "</td>" +
//               "</tr>";

//                $('#tbody').append(html);
//                resolve();
//            });
//        });

//        Promise.all(items).then(function () {
//            //$('.loading').remove();
//            //$('#tbl').DataTable();
//        });
//    }).run();
//}


$(document).on('click', '#save', function (e) {
    e.preventDefault();

    if (isInputValid()) {
        $('.fa-spin').removeClass('hidden');

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
        swal('Successfully Added!', 'Employee has been added', 'success');
        $('.close').trigger('click');
        get();

        $('.modal .form-control').val('');
        }).run();
    }
});

$(document).on('click', '.view', function () {
    id = $(this).data('id');

    (new http).post("employees.aspx/find", {
        id: id
    }).then(function (response) {
        var item = response.d[0];
        $('#employeenumber-view').val(item.EmployeeNumber);
        $('#first-name-view').val(item.FirstName);
        $('#last-name-view').val(item.LastName);
        $('#MI-view').val(item.MI);
        $('#contact-view').val(item.Contact);
        $('#email-view').val(item.Email);
        //$('#imageLabelView').text(item.ImagePath);
        $('#password-view').val(item.Password);
        $('#address-view').val(item.Address);
        $('#birthday-view').val(item.Birthday);
        $('#gender-view').val(item.Gender);
        $('#religion-view').val(item.Religion);
        $('#nationality-view').val(item.Nationality);
        $('#birthplace-view').val(item.Birthplace);
        $('#civilstatus-view').val(item.CivilStatus);
        $('#employeestatus-view').val(item.EmployeeStatusID);
        $('#role-view').val(item.RoleID);
        $('#full-name-view').val(item.FirstName + " " + item.MI + " " + item.LastName);
        $('#view-modal .form-control').prop('disabled', true);

        var url = '/employee?_rlmswhk=' + id;

        $('.more-employee-info').attr('href', url);
    }).run();
});

$(document).on('click', '.edit', function () {
    id = $(this).data('id');

    (new http).post("employees.aspx/find", {
        id: id
    }).then(function (response) {
        var item = response.d[0];
        $('#first-name-edit').val(item.FirstName);
        $('#last-name-edit').val(item.LastName);
        $('#MI-edit').val(item.MI);
        $('#contact-edit').val(item.Contact);
        $('#email-edit').val(item.Email);
        //$('#imageLabelView').text(item.ImagePath);
        $('#password-edit').val(item.Password);
        $('#address-edit').val(item.Address);
        $('#birthday-edit').val(item.Birthday);
        $('#gender-edit').val(item.Gender);
        $('#religion-edit').val(item.Religion);
        $('#nationality-edit').val(item.Nationality);
        $('#birthplace-edit').val(item.Birthplace);
        $('#civilstatus-edit').val(item.CivilStatus);
        $('#employeestatus-edit').val(item.EmployeeStatusID);
        $('#role-edit').val(item.RoleID);
        
    }).run();
});

$(document).on('click', '#saveChanges', function (e) {
    e.preventDefault();

    if (isInputEditValid()) {
    $('.fa-spin').removeClass('hidden');

        (new http).post("employees.aspx/update", {
            id: id,
            fname: $('#first-name-edit').val(),
            lname: $('#last-name-edit').val(),
            mname: $('#MI-edit').val(),
            contact: $('#contact-edit').val(),
            email: $('#email-edit').val(),
            address: $('#address-edit').val(),
            birthday: $('#birthday-edit').val(),
            gender: $('#gender-edit').val(),
            religion: $('#religion-edit').val(),
            nationality: $('#nationality-edit').val(),
            birthplace: $('#birthplace-edit').val(),
            civilstatus: $('#civilstatus-edit').val(),
            employeestatus: $('#employeestatus-edit').val(),
            role: $('#role-edit').val()
            //image: $('#imageLabel').text()
        }).then(function (response) {
            //if ($('#ContentPlaceHolder1_imageEdit').val() != '') {
            //    $('#ContentPlaceHolder1_uploadChanges').trigger('click');
            //} else {
            //    swal('Successfully Updated!', 'Instructor has been successfully updated.', 'success');
            //    get();
            //    $('.fa-spin').addClass('hidden');
            //    $('.close').click();
        
            //}
            swal('Successfully updated!', 'Employee has been updated', 'success');
            $('.close').trigger('click');
            get();
        }).run();
    }

});

$(document).on('click', '.remove', function () {
    id = $(this).data('id');
    var name = $(this).data('name');

    swal({
        title: 'Are you sure you want to deactivate ' + $(this).data('name') + '?',
        text: "You won't be able to revert this action!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'green',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Deactivate!'
    }).then(function (isConfirm) {
        if (isConfirm.value == true) {
            (new http).post("employees.aspx/deactivate", {
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
            (new http).post("employees.aspx/activate", {
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
    var isFirstValid = $("#first-name").validate(['required']).displayErrorOn($("#error-first-name"));
    var isLastValid = $("#last-name").validate(['required']).displayErrorOn($("#error-last-name"));
    var isMIValid = $("#MI").validate(['required']).displayErrorOn($("#error-MI"));
    var isEmailValid = $("#email").validate(['email']).displayErrorOn($("#error-email"));
    var isPasswordValid = $("#password").validate(['required']).displayErrorOn($("#error-password"));
    var isContactValid = $("#contact").validate(['required']).displayErrorOn($("#error-contactnumber"));
    var isAddressValid = $("#address").validate(['required']).displayErrorOn($("#error-address"));
    var isGenderValid = $("#gender").validate(['required']).displayErrorOn($("#error-gender"));
    var isBirthdayValid = $("#birthday").validate(['required']).displayErrorOn($("#error-birthday"));
    var isReligionValid = $("#religion").validate(['required']).displayErrorOn($("#error-religion"));
    var isNationalityValid = $("#nationality").validate(['required']).displayErrorOn($("#error-nationality"));
    var isBirthplaceValid = $("#birthplace").validate(['required']).displayErrorOn($("#error-birthplace"));
    var isCivilStatusValid = $("#civilstatus").validate(['required']).displayErrorOn($("#error-civilstatus"));
    var isEmployeeStatusValid = $("#employeestatus").validate(['required']).displayErrorOn($("#error-employeestatus"));
    var isRoleValid = $("#role").validate(['required']).displayErrorOn($("#error-role"));
 
    //var isImageValid = $("#ContentPlaceHolder1_image").validate(['required']).displayErrorOn($("#errorImage"));

    return isFirstValid && isLastValid && isMIValid && isEmailValid && isPasswordValid && isContactValid && isAddressValid && isGenderValid &&
           isBirthdayValid && isReligionValid && isNationalityValid && isBirthplaceValid && isCivilStatusValid && isEmployeeStatusValid && isRoleValid;
}

function isInputEditValid() {
    var isFirstValid = $("#first-name-edit").validate(['required']).displayErrorOn($("#error-first-name-edit"));
    var isLastValid = $("#last-name-edit").validate(['required']).displayErrorOn($("#error-last-name-edit"));
    var isMIValid = $("#MI-edit").validate(['required']).displayErrorOn($("#error-MI-edit"));
    var isEmailValid = $("#email-edit").validate(['email']).displayErrorOn($("#error-email-edit"));
    //var isPasswordValid = $("#password").validate(['required']).displayErrorOn($("#error-password"));
    var isContactValid = $("#contact-edit").validate(['required']).displayErrorOn($("#error-contactnumber-edit"));
    var isAddressValid = $("#address-edit").validate(['required']).displayErrorOn($("#error-address-edit"));
    var isGenderValid = $("#gender-edit").validate(['required']).displayErrorOn($("#error-gender-edit"));
    var isBirthdayValid = $("#birthday-edit").validate(['required']).displayErrorOn($("#error-birthday-edit"));
    var isReligionValid = $("#religion-edit").validate(['required']).displayErrorOn($("#error-religion-edit"));
    var isNationalityValid = $("#nationality-edit").validate(['required']).displayErrorOn($("#error-nationality-edit"));
    var isBirthplaceValid = $("#birthplace-edit").validate(['required']).displayErrorOn($("#error-birthplace-edit"));
    var isCivilStatusValid = $("#civilstatus-edit").validate(['required']).displayErrorOn($("#error-civilstatus-edit"));
    var isEmployeeStatusValid = $("#employeestatus-edit").validate(['required']).displayErrorOn($("#error-employeestatus-edit"));
    var isRoleValid = $("#role-edit").validate(['required']).displayErrorOn($("#error-role-edit"));

    return isFirstValid && isLastValid && isMIValid && isEmailValid && isContactValid && isAddressValid && isGenderValid &&
       isBirthdayValid && isReligionValid && isNationalityValid && isBirthplaceValid && isCivilStatusValid && isEmployeeStatusValid && isRoleValid;
}

//Get Employee Benefits
$(document).on('click', '.view', function () {
    id = $(this).data('id');

    (new http).post("employees.aspx/getBenefits", {
        id: id
    }).then(function (response) {
        var items = response.d.map(item => {
            var html = "<tr>" +
                        "<td>" + item.Benefit + "</td>" +
                        "<td>" + item.ID + "</td>" +
                        "<td>" +
                            "<i data-id=\"" + item.ID + "\" class=\"fa fa-search view\" data-toggle='modal' data-target='#view-modal'> " +
                                //"<span class=\"tooltiptext\">Click to view details</span>" +
                            "</i>";
            html += "<i data-id=\"" + item.ID + "\" class=\"fa fa-edit edit\" data-toggle='modal' data-target='#editModal'>" +
                    //"<span class=\"tooltiptext\">Click to modify details</span>" +
                "</i>";
            html += "</td>" +
            "</tr>";

            $('#tbodyBenefits').append(html);
        });
    }).run();
});

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

//search
$(document).ready(function () {
    $("#myInput").on("keyup", function () {
        var value = $(this).val().toLowerCase();
        $("#tbody tr").filter(function () {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
    });
});



//add
$(function () {
    $('#birthday').datetimepicker({
        format: 'DD/MM/YYYY'
    });
});
//edit
$(function () {
    $('#birthday-edit').datetimepicker({
        format: 'DD/MM/YYYY'
    });
});

function find(emp_id) {

    (new http).post("employees.aspx/find", {
        id: emp_id
    }).then(function (response) {
        var item = response.d[0];

        $('#hired-view').text(item.EmployeeNumber);
        //$('#first-name-view').val(item.FirstName);
        //$('#last-name-view').val(item.LastName);
        //$('#MI-view').val(item.MI);
        //$('#contact-view').val(item.Contact);
        //$('#email-view').val(item.Email);
        ////$('#imageLabelView').text(item.ImagePath);
        //$('#password-view').val(item.Password);
        //$('#address-view').val(item.Address);
        //$('#birthday-view').val(item.Birthday);
        //$('#gender-view').val(item.Gender);
        //$('#religion-view').val(item.Religion);
        //$('#nationality-view').val(item.Nationality);
        //$('#birthplace-view').val(item.Birthplace);
        //$('#civilstatus-view').val(item.CivilStatus);
        //$('#employeestatus-view').val(item.EmployeeStatusID);
        //$('#role-view').val(item.RoleID);
        //$('#full-name-view').val(item.FirstName + " " + item.MI + " " + item.LastName);
        //$('#view-modal .form-control').prop('disabled', true);

        //var url = '/employee?_rlmswhk=' + id;

        //$('.more-employee-info').attr('href', url);
    }).run();
}


$('#myModal').modal({ backdrop: 'static', keyboard: false })
$('#edit-modal').modal({ backdrop: 'static', keyboard: false })
$('#view-modal').modal({ backdrop: 'static', keyboard: false })