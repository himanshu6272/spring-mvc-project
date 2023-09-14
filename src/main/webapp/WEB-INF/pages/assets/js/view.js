$(document).ready(function(){

    let success = $("#successPopup")[0].innerText;
                  if(success === "User Updated Successfully"){
                  $("#successPopup").removeClass("d-none");
                        setTimeout(function () {
                            $("#successPopup").addClass("d-none");
                        }, 3000);
                  }

    $(".navbar-brand").addClass("d-none");
    $("#edit-user-btn").click(function(){
        $("input").removeAttr("disabled");

        $("#email-address").attr("disabled", "disabled");
        $(".remove-address-btn").removeAttr("disabled");
        $("#submit-btn").removeAttr("disabled");
        $("#add-address-btn").removeClass("d-none");
   })

    $("#login-btn").html("Logout").removeAttr("href").attr("href", "logout");
    $("#register-btn").remove();


    let firstName = function () {
        let fname = $("#fname").val();
        let nameExp = /^[a-zA-Z]{2,8}$/;
        if (fname == "" || fname == undefined) {
          $("#fnameHelp").html("first name is required!").addClass("text-danger");
          return false;
        } else if (nameExp.test(fname) == false) {
          $("#fnameHelp")
            .html(
              "name should have atleat two character and does not contain any digit"
            )
            .addClass("text-danger");
          return false;
        } else {
          $("#fnameHelp").empty();
          return true;
        }
      };

      let lastName = function () {
        let lname = $("#lname").val();
        let nameExp = /^[a-zA-Z]{2,8}$/;
        if (lname == "" || lname == undefined) {
          $("#lnameHelp").html("last name is required!").addClass("text-danger");
          return false;
        } else if (nameExp.test(lname) == false) {
          $("#lnameHelp")
            .html(
              "name should have atleat two character and does not contain any digit"
            )
            .addClass("text-danger");
          return false;
        } else {
          $("#lnameHelp").empty();
          return true;
        }
      };

      let mobileNumber = function () {
        let mobNum = $("#mobile-number").val();
        let mobExp = /^[0-9]{10,11}$/;
        if (mobNum == "" || mobNum == undefined) {
          $("#mobileHelp")
            .html("mobile number is required!")
            .addClass("text-danger");
          return false;
        } else if (mobExp.test(mobNum) == false) {
          $("#mobileHelp")
            .html("enter valid mobile number!")
            .addClass("text-danger");
          return false;
        } else {
          $("#mobileHelp").empty();
          return true;
        }
      };

      let emailAddress = function () {
        let emailExp = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        let email = $("#email-address").val();
        if (email == "" || email == undefined) {
          $("#emailHelp").html("email is required!").addClass("text-danger");
          return false;
        } else if (emailExp.test(email) == false) {
          $("#emailHelp")
            .html("Invalid email, email must contain @ (example@xyz.com)!")
            .addClass("text-danger");
          return false;
        } else {
          $("#emailHelp").empty();
          return true;
        }
      };

      let dateOfBirth = function () {
        let dob = $("#dob").val();
        let currentDate = new Date().toISOString().split("T")[0];
        if (dob == "" || dob == undefined) {
          $("#dateHelp").html("enter date of birth!").addClass("text-danger");
          return false;
        } else if (dob > currentDate) {
          $("#dateHelp").html("please enter valid date!").addClass("text-danger");
          return false;
        } else {
          $("#dateHelp").empty();
          return true;
        }
      };


    let address = function(){
        let length = $("#addresses").children("div").length;
        if(length == 0){
            $("#addressHelp")
                    .html("please add atleast one address!")
                    .addClass("text-danger");
                  return false;
            }
            else {
                $("#addressHelp").empty();
                return true;
            }

      }

      let profilePhoto = function(){
        let photo = $("#profile-photo").val();
        if(photo === "" || photo === undefined){
            $("#profilephotoHelp")
                    .html("please upload the profile photo!")
                    .addClass("text-danger");
                  return false;
            }
            else {
                $("#profilephotoHelp").empty();
                return true;
            }

      }

      let gender = function () {
        let selectedGender = $(".gender:checked").val();

        if (selectedGender === undefined) {
          $("#genderHelp").html("please select the gender").addClass("text-danger");
          return false;
        } else {
          $("#genderHelp").empty();
          return true;
        }
      };

      let role = function () {
        let selectedRole = $(".role:checked").val();
        if (selectedRole === undefined) {
          $("#roleHelp").html("please select the role").addClass("text-danger");
          return false;
        } else {
          $("#roleHelp").empty();
          return true;
        }
      };

      $(".gender").click(function () {
          $("#genderHelp").empty();
      });

     $(".role").click(function () {
          $("#roleHelp").empty();
      });

      $("#dob").datepicker({
        dateFormat: "yy-mm-dd",
        maxDate: 0,
        changeMonth: true,
        changeYear: true,
        yearRange: "-100:+0"
      });

      $("#calendar-icon").click(function () {
        $("#dob").datepicker("show");
      });
      $("#dob, #calendar-icon").click(function () {
        $("#dateHelp").empty();
      });

    $("#profile-photo").on('change', function(){
            let inputFile = $(this);
            let files = inputFile[0].files;
            let fileName = files[0].name;
            let extension = fileName.substr(fileName.lastIndexOf("."));
            let allowedExtensionsRegx = /(\.jpg|\.jpeg|\.png|\.gif)$/i;
            let isAllowed = allowedExtensionsRegx.test(extension);
            if(isAllowed){
            $("#profilephotoHelp").empty();
            return true;
            }else{
              $("#profilephotoHelp").html("please upload valid file").addClass("text-danger");
              return false;
            }
        })

      $("#fname").blur(firstName);
      $("#lname").blur(lastName);
      $("#mobile-number").blur(mobileNumber);
      $("#email-address").blur(emailAddress);
      $("#dob").blur(dateOfBirth);
      $("#submit-btn").click(firstName);
      $("#submit-btn").click(lastName);
      $("#submit-btn").click(mobileNumber);
      $("#submit-btn").click(emailAddress);
      $("#submit-btn").click(dateOfBirth);
      $("#submit-btn").click(address);
      $("#submit-btn").click(gender);
      $("#submit-btn").click(profilePhoto);

    $("#add-address-btn").click(function(){
          $(this).addClass("d-none");
          $("#address").removeClass("d-none");
          $("#addressHelp").empty();

        })

        $(".update-user-btn").click(function(){
            $("#dashboard-btn").removeClass("d-none");
        })

        $("#cancel-address-btn").click(function(){
          $("#address").addClass("d-none");
          $("#add-address-btn").removeClass("d-none");
        })




            var id = 0;
            $("#save-address-btn").click(function(){
                let street = $("#inputStreet").val();
                let city = $("#inputCity").val();
                let state = $("#inputState").val();
                let zip = $("#inputZip").val();
                let country = $("#inputCountry").val();

                if(street === "" || street === undefined){
                    $("#streetHelp").html("street is required").addClass("text-danger");
                }else{
                    $("#streetHelp").empty();
                }
                 if(city === "" || city === undefined){
                    $("#cityHelp").html("city is required").addClass("text-danger");
                }else{
                    $("#cityHelp").empty();
                }
                 if(state === "" || state === undefined){
                    $("#stateHelp").html("state is required").addClass("text-danger");
                }else{
                $("#stateHelp").empty();
                }

                let zipExp = /^[0-9]{6,7}$/;
                 if(zip === "" || zip === undefined){
                    $("#zipHelp").html("zip is required").addClass("text-danger");
                }else if (zipExp.test(zip) == false) {
                            $("#zipHelp")
                              .html("enter valid zip code!")
                              .addClass("text-danger");
                }else if(country === "" || country === undefined){
                    $("#countryHelp").html("country is required").addClass("text-danger");
                }else{
                    $("#zipHelp").empty();
                    $("#countryHelp").empty();
                    let addElement = '<div class="address border border-black p-2 m-3"><input hidden name="addressId"<label>Street</label><br><input readonly class="street form-control" name="addresses['+id+'].street" value="'+street+
                                '"><label>City</label><br><input readonly class="city form-control" name="addresses['+id+'].city" value="'+city+
                                '"><label>State</label><br><input readonly class="state form-control" name="addresses['+id+'].state" value="'+state+
                                '"><label>Zip</label><br><input readonly class="zip form-control" name="addresses['+id+'].zip" value="'+zip+
                                '"><label>Country</label><br><input readonly class="country form-control" name="addresses['+id+'].country" value="'+country+
                                '"></div><small class="form-text addressesHelp"></small></div>';
                                $("#addresses").append(addElement);
                                $("#inputStreet").val("");
                                $("#inputCity").val("");
                                $("#inputState").val("");
                                $("#inputZip").val("");
                                $("#inputCountry").val("");
                                id = id + 1;
                }

            })

    $(document).on("click", ".remove-address-btn", function() {
        $(this).closest(".address").remove();
    });






})