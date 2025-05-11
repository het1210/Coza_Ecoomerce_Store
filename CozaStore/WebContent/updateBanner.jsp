<%@page import="pojo.Banner"%>
<%@page import="pojo.Category"%>
<%@page import="java.util.List"%>
<%@page import="Com.Dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-admin/assets-path="admin/assets/"
  data-template="vertical-menu-template-free"
>
  
<!-- Mirrored from somoorish.com.au/admin/addcat.php by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 31 Dec 2022 06:24:00 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>Admin Panel</title>

    <meta name="description" content="" />

    <!-- Favicon -->
   <link rel="shortcut icon" href="admin/assets/img/favicon.png" type="image/x-icon">

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com/" />
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&amp;display=swap"
      rel="stylesheet"
    />
    <script src="../../ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="admin/assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="admin/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="admin/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="admin/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="admin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <link rel="stylesheet" href="admin/assets/vendor/libs/apex-charts/apex-charts.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
                                                                                                                                                                                                                                                                                                                                                                                                        
    <script src="admin/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="admin/assets/js/config.js"></script>
         <link rel="stylesheet" type="text/css" href="../../maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
      <link rel="stylesheet" type="text/css" href="../../cdn.datatables.net/1.12.1/css/dataTables.bootstrap.min.css">
      <link rel="stylesheet" type="text/css" href="../../cdn.datatables.net/fixedheader/3.2.4/css/fixedHeader.bootstrap.min.css">
      <link rel="stylesheet" type="text/css" href="../../cdn.datatables.net/responsive/2.3.0/css/responsive.bootstrap.min.css">

      <link rel="stylesheet" href="../../cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       <link href="../../cdn.jsdelivr.net/npm/select2%404.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
       
  </head>

  <body>
    <!-- Layout wrapper -->
    
		<%@include file="admin_header.jsp" %>
          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">

 <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Form/</span>Add Banner</h4>

              <!-- Basic Layout & Basic with Icons -->
               <div class="page-content">
                    <div class="container-fluid">

                        <!-- start page title -->
                        
                        <!-- end page title -->
                        
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">Add Banner</h4>
                                    </div>
                                    <%
												Dao dao = new Dao();
												List<Banner> list = dao.viewimage();
												session.setAttribute("c", list);
											%>
                                    <div class="card-body">
                                        <form action="EditBanner" method="post"  class="needs-validation" novalidate enctype="multipart/form-data">
                                           
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label class="form-label" for="validationCustom03">Banner Name</label>
                                                        <input type="text" name="name" value="${list.name}"  class="form-control" id="validationCustom03" placeholder="Banner Name" required>
                                                        <div class="invalid-feedback">
                                                            Please provide a name.
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label class="form-label" for="validationCustom04">Banner Image</label>
                                                        <input type="file" name="bimage" class="form-control" id="validationCustom04" placeholder="Image" required accept="image/*" onchange="loadFile(event)">
                                                        <input type="hidden" value="${list.bimage}" name="bimage">
                                                        <div class="invalid-feedback" >
                                                            Please provide a image.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                           <a><img src="" id="output" alt="" style="height: 130px; width: 230px; border: 10px;"></a>

											<!-- for file image output  -->

											<script>
												function loadFile(event) {
													document
															.getElementById('output').src = URL
															.createObjectURL(event.target.files[0]);
												};
											</script>
                                           <div class="mt-4">
                                            <button class="btn btn-primary" type="submit">Submit form</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <!-- end card -->
                            </div> <!-- end col -->
        
                            
                        </div>
                        <!-- end row -->

                        <!-- end row -->
                    </div> <!-- container-fluid -->
                </div>
            </div>
                        <!-- / Content -->
<script>
    $(document).ready(function(){
      $('#dash').removeClass('active');
    });
</script>
<script type="text/javascript">
document.getElementById('catnames').style.display = "none";
document.getElementById('catdes').style.display = "none";
document.getElementById('proimgs').style.display = "none";
document.getElementById('proimgs1').style.display = "none";
        function catnamefun() {
        var m = /^[a-zA-Z ]+$/
        document.getElementById('catnames').style.display = "block";
        var fname = document.getElementById('catnamei').value;

        if (fname == '') {
            document.getElementById('catnames').innerHTML = "Category Name must be filled out";
            return false;
        } else if (fname.match(m)) {
            document.getElementById('catnames').innerHTML = '';
             document.getElementById('catnames').style.display = "none";
        } else {
            document.getElementById('catnames').innerHTML = "Category Name must be in alphabets only";
            return false;
        }

    }
        function catdesfun() {
        document.getElementById('catdes').style.display = "block";
        var lname = document.getElementById('catdesi').value;

        if (lname == '') {
            document.getElementById('catdes').innerHTML = "Category description must be filled out";
            return false;
        } else {
            document.getElementById('catdes').innerHTML = "";
            document.getElementById('catdes').style.display = "none";
        }

    }
    function validateform() {
       
          var catnames = document.getElementById('catnamei').value;
          var catdes = document.getElementById('catdesi').value;
          var proimgs = document.getElementById('file').value;
          var proimgs1 = document.getElementById('file1').value;
          var m = /^[a-zA-Z ]+$/
          
          if (catnames == '' && catdes == '' && proimgs == '' && proimgs1 == '') {
                document.getElementById('catnames').style.display = "block";
                document.getElementById('catdes').style.display = "block";
                document.getElementById('proimgs').style.display = "block";
                document.getElementById('proimgs1').style.display = "block";

                document.getElementById('catnames').innerHTML = "Category name must be filled out";
                document.getElementById('catdes').innerHTML = "Category description must be filled out";
                document.getElementById('proimgs').innerHTML = "Please select an image";
                document.getElementById('proimgs1').innerHTML = "Please select an image";
                return false;
          }
          else if (catnames == '') {
              document.getElementById('catnames').style.display = "block";
                document.getElementById('catdes').style.display = "none";
                document.getElementById('proimgs').style.display = "none";
                document.getElementById('proimgs1').style.display = "none";
              document.getElementById('catnames').innerHTML = "Category name must be filled out";
              return false;
          }
          else if (!catnames.match(m)) {
              document.getElementById('catnames').style.display = "block";
                document.getElementById('catdes').style.display = "none";
                document.getElementById('proimgs').style.display = "none";
                document.getElementById('proimgs1').style.display = "none";
              document.getElementById('catnames').innerHTML = "Category name must be in alphabets only";
              return false;
          }else if (catdes == '') {
              document.getElementById('catnames').style.display = "none";
                document.getElementById('catdes').style.display = "block";
                document.getElementById('proimgs').style.display = "none";
                document.getElementById('proimgs1').style.display = "none";
              document.getElementById('catdes').innerHTML = "Category description must be filled out";
              return false;
              
          }
          else if (proimgs == '') {
              document.getElementById('catnames').style.display = "none";
                document.getElementById('catdes').style.display = "none";
                document.getElementById('proimgs').style.display = "block";
                document.getElementById('proimgs1').style.display = "none";
              document.getElementById('proimgs').innerHTML = "Please select an image";
              return false;
              
          }
          else if (proimgs1 == '') {
              document.getElementById('catnames').style.display = "none";
                document.getElementById('catdes').style.display = "none";
                document.getElementById('proimgs').style.display = "none";
                document.getElementById('proimgs1').style.display = "block";
              document.getElementById('proimgs1').innerHTML = "Please select an image";
              return false;
              
          }
      else 
      {
          return true;
      }
    }
</script>
<script>
    function checkFileDetails(){
            var fi = document.getElementById('file');
            if (fi.files.length > 0) {      // FIRST CHECK IF ANY FILE IS SELECTED.
    
                for (var i = 0; i <= fi.files.length - 1; i++) {
                    var fileName, fileExtension, fileSize, fileType, fileSize2;
    
                    // FILE NAME AND EXTENSION.
                    fileName = fi.files.item(i).name;
                    fileExtension = fileName.replace(/^.*\./, '');
                    readImageFile(fi.files.item(i));
                    fileSize = fi.files.item(i).size;  // FILE SIZE.
                    fileType = fi.files.item(i).type;  // GET IMAGE INFO USING fileReader().
                    fileSize2 = Math.round((fileSize / 1024));
    
                    // CHECK IF ITS AN IMAGE FILE.
                    // TO GET THE IMAGE WIDTH AND HEIGHT, WE'LL USE fileReader().
                    if ((fileExtension == 'png' || fileExtension == 'jpg' || fileExtension == 'jpeg' || fileExtension == 'webp') && (fileSize2 <= 1024)) {
                    }
                    else {
                        document.getElementById('file').value = "";
                    }
                }
    
                // GET THE IMAGE WIDTH AND HEIGHT USING fileReader() API.
                function readImageFile(file) {
                    var reader = new FileReader(); // CREATE AN NEW INSTANCE.
    
                    reader.onload = function (e) {
                        var img = new Image();
                        img.src = e.target.result;
    
                        img.onload = function () {
                            var w = this.width;
                            var h = this.height;
    
                            if(w == 4969 && h==1500){
                                document.getElementById('proimgs').innerHTML = "";
                            }
                            else{
                                document.getElementById('file').value="";
                                document.getElementById('proimgs').style.display ="block";
                                document.getElementById('proimgs').innerHTML = "Please select image with dimension 4969x1500";
                            }
                        }
                    };
                    reader.readAsDataURL(file);
                }
            }
        }
</script>
<script>
    function checkFileDetails1(){
            var fi = document.getElementById('file1');
            if (fi.files.length > 0) {      // FIRST CHECK IF ANY FILE IS SELECTED.
    
                for (var i = 0; i <= fi.files.length - 1; i++) {
                    var fileName, fileExtension, fileSize, fileType, fileSize2;
    
                    // FILE NAME AND EXTENSION.
                    fileName = fi.files.item(i).name;
                    fileExtension = fileName.replace(/^.*\./, '');
                    readImageFile(fi.files.item(i));
                    fileSize = fi.files.item(i).size;  // FILE SIZE.
                    fileType = fi.files.item(i).type;  // GET IMAGE INFO USING fileReader().
                    fileSize2 = Math.round((fileSize / 1024));
    
                    // CHECK IF ITS AN IMAGE FILE.
                    // TO GET THE IMAGE WIDTH AND HEIGHT, WE'LL USE fileReader().
                    if ((fileExtension == 'png' || fileExtension == 'jpg' || fileExtension == 'jpeg' || fileExtension == 'webp') && (fileSize2 <= 1024)) {
                    }
                    else {
                        document.getElementById('file1').value = "";
                    }
                }
    
                // GET THE IMAGE WIDTH AND HEIGHT USING fileReader() API.
                function readImageFile(file) {
                    var reader = new FileReader(); // CREATE AN NEW INSTANCE.
    
                    reader.onload = function (e) {
                        var img = new Image();
                        img.src = e.target.result;
    
                        img.onload = function () {
                            var w = this.width;
                            var h = this.height;
    
                            if(w == 300 && h==200){
                                document.getElementById('proimgs1').innerHTML = "";
                            }
                            else{
                                document.getElementById('file1').value="";
                                document.getElementById('proimgs1').style.display ="block";
                                document.getElementById('proimgs1').innerHTML = "Please select image with dimension 300x200";
                            }
                        }
                    };
                    reader.readAsDataURL(file);
                }
            }
        }
</script>
<script>
        // function fileValidation(x) {
         
        //   var fileInput = x;//           document.getElementById('fileToUpload');
        //     //alert(fileInput);
        //     var filePath = fileInput.value;
          
        //     // Allowing file type
        //     var allowedExtensions = 
        //             /(\.jpg|\.jpeg|\.png|\.gif)$/i;
              
        //     if (!allowedExtensions.exec(filePath)) {
        //         //alert('Invalid file type');
        //         fileInput.value = '';
        //          $('#proimgs').html('Must Select File with Extensions .jpg .png .jpeg .gif');
        //         // alert("proimgs");
        //         return false;
        //     }
        //     else
        //     {
        //         //$('#err1').html('');
        //         //   alert("success");
        //         document.getElementById('proimgs').style.display = "none";
        //     }

           
        //      if (typeof (x.files) != "undefined") 
        //      {
        //         var size = parseFloat(x.files[0].size / 1024).toFixed(2);
        //     //  alert(size + " KB.");
        //         if(size>500)
        //         {
        //              var ns="";
        //             $('#file').val(ns);
        //             // $('#fileToUpload3').val(ns);
        //             //  $('#x').val(n);
        //              document.getElementById('proimgs').style.display = "block";
        //             document.getElementById('proimgs').innerHTML = "Must Select Image size within 500 KB";
        //         }
        //         else
        //         {
        //               $('#proimgs').html('');
        //               document.getElementById('proimgs').style.display = "none";
        //         }
        //      } 
        //     else
        //     {
        //         alert("This browser does not support HTML5.");
        //     }
            
        //     // var fileUpload = document.getElementById("file");
        //     //  if (typeof (fileUpload.files) != "undefined") 
        //     //  {
        //     //     var size = parseFloat(fileUpload.files[0].size / 1024).toFixed(2);
        //     //     // alert(size + " KB.");
        //     //     if(size>500)
        //     //     {
        //     //         var n="";
        //     //         $('#file').val(n);
        //     //         // $('#proimgs').html('Must Select Image size within 4 MB ');
        //     //         document.getElementById('proimgs').style.display = "block";
        //     //         document.getElementById('proimgs').innerHTML = "Hello world";
        //     //     }
        //     //       else
        //     //     {
        //     //           $('#proimgs').html('');
        //     //     }
        //     //  } 
        //     // else
        //     // {
        //     //     alert("This browser does not support HTML5.");
        //     // }

        // }
// </script>
<script>
        function fileValidationimg(x) {
         
          var fileInput = x;//           document.getElementById('fileToUpload');
            //alert(fileInput);
            var filePath = fileInput.value;
          
            // Allowing file type
            var allowedExtensions = 
                    /(\.jpg|\.jpeg|\.png|\.gif)$/i;
              
            if (!allowedExtensions.exec(filePath)) {
                //alert('Invalid file type');
                fileInput.value = '';
                 $('#proimgs1').html('Must%20Select%20File%20with%20Extensions%20.jpg%20.png%20.jpeg%20.html');
                // alert("proimgs");
                return false;
            }
            else
            {
                //$('#err1').html('');
                //   alert("success");
                document.getElementById('proimgs1').style.display = "none";
            }

           
             if (typeof (x.files) != "undefined") 
             {
                var size = parseFloat(x.files[0].size / 1024).toFixed(2);
            //  alert(size + " KB.");
                if(size>500)
                {
                     var ns="";
                    $('#file').val(ns);
                    // $('#fileToUpload3').val(ns);
                    //  $('#x').val(n);
                     document.getElementById('proimgs1').style.display = "block";
                    document.getElementById('proimgs1').innerHTML = "Must Select Image size within 500 KB";
                }
                else
                {
                      $('#proimgs').html('');
                      document.getElementById('proimgs1').style.display = "none";
                }
             } 
            else
            {
                alert("This browser does not support HTML5.");
            }
            
            // var fileUpload = document.getElementById("file");
            //  if (typeof (fileUpload.files) != "undefined") 
            //  {
            //     var size = parseFloat(fileUpload.files[0].size / 1024).toFixed(2);
            //     // alert(size + " KB.");
            //     if(size>500)
            //     {
            //         var n="";
            //         $('#file').val(n);
            //         // $('#proimgs').html('Must Select Image size within 4 MB ');
            //         document.getElementById('proimgs').style.display = "block";
            //         document.getElementById('proimgs').innerHTML = "Hello world";
            //     }
            //       else
            //     {
            //           $('#proimgs').html('');
            //     }
            //  } 
            // else
            // {
            //     alert("This browser does not support HTML5.");
            // }

        }
//     </script>
  </div>
   </div>
            <!-- / Content -->

            <!-- Footer -->
            <footer class="content-footer footer bg-footer-theme">
              <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
               
              
              </div>
            </footer>
            <!-- / Footer -->

            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->

   
    <!-- Core JS -->
    <!-- build:js admin/assets/vendor/js/core.js -->
    <script src="admin/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="admin/assets/vendor/libs/popper/popper.js"></script>
    <script src="admin/assets/vendor/js/bootstrap.js"></script>
    <script src="admin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="admin/assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="admin/assets/vendor/libs/apex-charts/apexcharts.js"></script>

    <!-- Main JS -->
    <script src="admin/assets/js/main.js"></script>

    <!-- Page JS -->
     <script src="admin/assets/js/form-validation.init.js"></script>
    <script src="admin/assets/js/dashboards-analytics.js"></script>

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="../../buttons.github.io/buttons.js"></script>
     <script type="text/javascript" src="../../code.jquery.com/jquery-3.5.1.js"></script>
     <script src="../../unpkg.com/sweetalert%402.1.2/dist/sweetalert.min.js"></script>
     <script src="../../cdn.jsdelivr.net/npm/select2%404.1.0-rc.0/dist/js/select2.min.js"></script>
    <script type="text/javascript" src="../../cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="../../cdn.datatables.net/1.12.1/js/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript" src="../../cdn.datatables.net/fixedheader/3.2.4/js/dataTables.fixedHeader.min.js"></script>
    <script type="text/javascript" src="../../cdn.datatables.net/responsive/2.3.0/js/dataTables.responsive.min.js"></script>
    <script type="text/javascript" src="../../cdn.datatables.net/responsive/2.3.0/js/responsive.bootstrap.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function() {
        var table = $('#example').DataTable( {
            responsive: true
        } );

       var catji = $('#catres').DataTable( {
            responsive: true
        } );

        var subcatji = $('#subcatres').DataTable( {
            responsive: true
        } );


    new $.fn.dataTable.FixedHeader( table );
    new $.fn.dataTable.FixedHeader( catji );
    new $.fn.dataTable.FixedHeader( subcatji );
} );
    </script>


  </body>

<!-- Mirrored from somoorish.com.au/admin/addcat.php by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 31 Dec 2022 06:24:00 GMT -->
</html>
