<%@page import="pojo.Product"%>
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
  
<!-- Mirrored from somoorish.com.au/admin/addproduct.php by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 31 Dec 2022 06:24:00 GMT -->
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

          <!-- / Navbar -->

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">

 <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Form/</span>Add Product</h4>

              <!-- Basic Layout & Basic with Icons -->
              <div class="page-content">
                    <div class="container-fluid">

                        <!-- start page title -->
                        
                        <!-- end page title -->
                        
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">Add Product</h4>
                                    </div>
										<%
											Dao dao = new Dao();
											List<Category> list = dao.viewCategory();
											session.setAttribute("cat", list);
										%>
										<%
											Dao dao2 = new Dao();
											List<Product> list2 = dao.viewProduct();
											session.setAttribute("p", list);
										%>
										<div class="card-body">
                                        <form action="EditProduct"  method="post"  class="needs-validation" novalidate enctype="multipart/form-data">
                                           
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                    <input type="hidden" name="id" value="${list.id}">
                                                        <label class="form-label" for="validationCustom03">Product Name</label>
                                                        <input type="text" name="productName" value="${list.productName}" class="form-control" id="validationCustom03" placeholder="Category Name" required>
                                                        <div class="invalid-feedback">
                                                            Please provide a name.
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label class="form-label" for="validationCustom04">Choose Category:</label>
                                                        <select name="category" id="Category" class="form-control" id="validationCustom04" placeholder="Choose Category">
														 <c:forEach items="${cat}" var="c">
														 <option value="${c.category}" disabled hidden selected><c:out value="${c.category}"></c:out></option>
														 <option value="${c.category}">${c.category}</option>
														  <br>
														 </c:forEach>
														  </select>
														  <div class="invalid-feedback" >
                                                            Please provide a category.
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label class="form-label" for="validationCustom03">Qty</label>
                                                        <input type="text" name="qty" value="${list.qty}" class="form-control" id="validationCustom03" placeholder="Enter Qty" required>
                                                        <div class="invalid-feedback">
                                                            Please provide a qty.
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                         		 <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label class="form-label" for="validationCustom04">Image1</label>
                                                        <input type="file" name="image1" class="form-control" id="validationCustom04" placeholder="Image" required accept="image/*" onchange="loadFile(event)">
                                                         <input type="hidden" value="${list.image1}" name="image1">
                                                        <div class="invalid-feedback" >
                                                            Please provide a image.
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                
                                                
                                            </div>
                                            <!--  -->
                                             <div class="row">
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label class="form-label" for="validationCustom03">Price</label>
                                                        <input type="text" name="price" value="${list.price}" class="form-control" id="validationCustom03" placeholder="Enter Price" required>
                                                        <div class="invalid-feedback">
                                                            Please provide a price.
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label class="form-label" for="validationCustom04">Image2</label>
                                                        <input type="file" name="image2" class="form-control" id="validationCustom04" placeholder="Image" required accept="image/*" onchange="loadFile(event)">
                                                         <input type="hidden" value="${list.image2}" name="image2">
                                                        <div class="invalid-feedback" >
                                                            Please provide a image.
                                                        </div>
                                                    </div>
                                                </div>
                                                 <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label class="form-label" for="validationCustom03">Materials</label>
                                                        <input type="text" name="materials" value="${list.materials}"  class="form-control" id="validationCustom03" placeholder="Enter materials %" required>
                                                        <div class="invalid-feedback">
                                                            Please provide a materials 56%.
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                  <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label class="form-label" for="validationCustom04">Image3</label>
                                                        <input type="file" name="image3" class="form-control" id="validationCustom04" placeholder="Image" required accept="image/*" onchange="loadFile(event)">
                                                         <input type="hidden" value="${list.image3}" name="image3">
                                                        <div class="invalid-feedback" >
                                                            Please provide a image.
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                    <div class="form-group label-floating">
                                                        <label class="form-label" for="validationCustom03">Choose Color:</label>
                                                        <select name="color" class="form-control" id="validationCustom03" placeholder="Category Name" required>
														<option value="" disabled hidden selected><c:out value="${list.color}"></c:out></option>
	                                                	<option value="Blue"> Blue </option>
	                                                	<option value="Grey"> Grey</option>
	                                                	<option value="Green">Green</option>
	                                                	<option value="Red"> Red </option>
	                                                	<option value="White"> White </option>
	                                                	<option value="Black"> Black </option>
	                                            	</select>
                                                        <div class="invalid-feedback">
                                                            Please provide a color.
                                                        </div>
                                                    </div>
                                                </div>
                                                </div>
                                                
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                    <div class="form-group label-floating">
                                                        <label class="form-label" for="validationCustom03">Choose Size:</label>
                                                        <select name="size"  class="form-control" id="validationCustom03" placeholder="Category Name" required>
														<option value="" disabled hidden selected> <c:out value="${list.size}"></c:out></option>
	                                                	<option value="S"> S </option>
	                                                	<option value="M"> M</option>
	                                                	<option value="L"> L </option>
	                                                	<option value="Xl">XL</option>
	                                                	<option value="XXl">XXL</option>
	                                            	</select>
                                                        <div class="invalid-feedback">
                                                            Please provide a size.
                                                        </div>
                                                    </div>
                                                </div>
                                                </div>
                                                
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label class="form-label" for="validationCustom03">Weight</label>
                                                        <input type="text" name="weight" value="${list.weight}" class="form-control" id="validationCustom03" placeholder="Enter Weight" required>
                                                        <div class="invalid-feedback">
                                                            Please provide a weight.
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label class="form-label" for="validationCustom03">Dimensions</label>
                                                        <input type="text" name="dimensions" value="${list.dimensions}" class="form-control" id="validationCustom03" placeholder="Enter Dimensions  12*34*56" required>
                                                        <div class="invalid-feedback">
                                                            Please provide a dimensions.
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="mb-3">
                                                        <label class="form-label" for="validationCustom03">Description</label>
                                                        <textarea rows="6" cols="15" class="form-control" name="description" id="validationCustom03" placeholder="Enter Description" required><c:out value="${list.description}"></c:out></textarea>
                                                        <div class="invalid-feedback">
                                                            Please provide a description.
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                
                                            </div>
                                            
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
                </div>            </div>
            <script src="../../ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script type="text/javascript">
                function getStatesSelectList(){
                  var catsel = document.getElementById("catid");
                
                  
                  var cattid = catsel.options[catsel.selectedIndex].value;
                
                  var xhr = new XMLHttpRequest();
                  var url = 'subcat5175.html?catid=' + cattid;
                  // open function
                  xhr.open('GET.html', url, true);
                  xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                  
                  // check response is ready with response states = 4
                  xhr.onreadystatechange = function(){
                    if(xhr.readyState == 4 && xhr.status == 200){
                      var text = xhr.responseText;
                      //console.log('response from states.php : ' + xhr.responseText);
                      var subselect = document.getElementById("subct");
                      subselect.innerHTML = text;
                      subselect.style.display='inline';
                    
                    }
                  }
             
                  xhr.send();
                }

                var cat = document.getElementById("catid");
                cat.addEventListener("change", getStatesSelectList);
         </script>

            <script>
              $(document).ready(function(){
                $('#engdiv').hide(500);
                $('#prodiv').hide(500);
                $('#fatdiv').hide(500);
                $('#satdiv').hide(500);
                $('#carbodiv').hide(500);
                $('#sugdiv').hide(500);
                $('#sodediv').hide(500);

                $("#engid").click(function(){
                  var checkBox1 = document.getElementById("engid");
                  if (checkBox1.checked == true){
                    $('#engdiv').show(500);
                    
                  } else {
                    $('#engdiv').hide(500);
                  }
                });

                $("#protid").click(function(){
                  var checkBox1 = document.getElementById("protid");
                  if (checkBox1.checked == true){
                    $('#prodiv').show(500);
                  } else {
                    $('#prodiv').hide(500);
                  }
                });

                $("#fatid").click(function(){
                  var checkBox1 = document.getElementById("fatid");
                  if (checkBox1.checked == true){
                    $('#fatdiv').show(500);
                  } else {
                    $('#fatdiv').hide(500);
                  }
                });

                $("#fatid").click(function(){
                  var checkBox1 = document.getElementById("fatid");
                  if (checkBox1.checked == true){
                    $('#fatdiv').show(500);
                  } else {
                    $('#fatdiv').hide(500);
                  }
                });

                $("#satu").click(function(){
                  var checkBox1 = document.getElementById("satu");
                  if (checkBox1.checked == true){
                    $('#satdiv').show(500);
                  } else {
                    $('#satdiv').hide(500);
                  }
                });

                $("#carboid").click(function(){
                  var checkBox1 = document.getElementById("carboid");
                  if (checkBox1.checked == true){
                    $('#carbodiv').show(500);
                  } else {
                    $('#carbodiv').hide(500);
                  }
                });

                $("#sugid").click(function(){
                  var checkBox1 = document.getElementById("sugid");
                  if (checkBox1.checked == true){
                    $('#sugdiv').show(500);
                  } else {
                    $('#sugdiv').hide(500);
                  }
                });

                $("#sodeid").click(function(){
                  var checkBox1 = document.getElementById("sodeid");
                  if (checkBox1.checked == true){
                    $('#sodediv').show(500);
                  } else {
                    $('#sodediv').hide(500);
                  }
                });
            
              });
               
            </script>
            <script>
             function productname(){
              let m = /^[A-Za-z0-9 _-]*[A-Za-z0-9][A-Za-z0-9 _-]*$/;
              document.getElementById('productNameSpan').style.display = "block";
              let pname = document.getElementById('productNameId').value;

              if(pname == ''){
                document.getElementById('productNameSpan').innerHTML = "Product name must be filled out";
                return false;
              }else if(pname.match(m)){
                document.getElementById('productNameSpan').innerHTML = '';
                document.getElementById('productNameSpan').style.display = "none";
              }
              else{
                document.getElementById('productNameSpan').innerHTML = "Product name can only have alphabets and number";
                return false;
              }
             }
             function productdiscount(){
              let m = /^(\d*([.,](?=\d{1}))?\d+)+((?!\2)[.,]\d\d)?$/
              document.getElementById('discountName').style.display = "block";
              let dprice = document.getElementById('discountNameId').value;

              if(dprice == ''){
                document.getElementById('discountName').innerHTML = '';
                document.getElementById('discountName').style.display = "none";
                return false;
              }else if(dprice.match(m)){
                document.getElementById('discountName').innerHTML = '';
                document.getElementById('discountName').style.display = "none";
              }
              else{
                document.getElementById('discountName').innerHTML = "Price can only have number";
                return false;
              }

             }
             function productoriginal(){
              let m = /^(\d*([.,](?=\d{1}))?\d+)+((?!\2)[.,]\d\d)?$/
              document.getElementById('original_price').style.display = "block";
              let dprice = document.getElementById('original_price_id').value;

              if(dprice == ''){
                document.getElementById('original_price').innerHTML = "Price must be filled out";
                return false;
              }else if(dprice.match(m)){
                document.getElementById('original_price').innerHTML = '';
                document.getElementById('original_price').style.display = "none";
              }
              else{
                document.getElementById('original_price').innerHTML = "Price can only have number";
                return false;
              }

             }
             function productcategory(){
              document.getElementById('category_name').style.display = "block";
              let cat = document.getElementById('category_name_id').value;

              if(cat == ''){
                document.getElementById('category_name').innerHTML = "Category must be selected";
                return false;
              }
              else{
                document.getElementById('category_name').innerHTML = "";
                document.getElementById('category_name').style.display = "none";
              }

             }
             function productdescription(){
            //   let m = /^[A-Za-z0-9 _%@.,']*[A-Za-z0-9][A-Za-z0-9 _%@.,']*$/
              document.getElementById('product_description').style.display = "block";
              let desproduct = document.getElementById('product_description_id').value;

              if(desproduct == ''){
                document.getElementById('product_description').innerHTML = "Product description must be filled out";
                return false;
              }
              else{
                  document.getElementById('product_description').innerHTML = '';
                 document.getElementById('product_description').style.display = "none";
              }
            //   else if(desproduct.match(m)){
            //     document.getElementById('product_description').innerHTML = '';
            //     document.getElementById('product_description').style.display = "none";
            //   }
            //   else{
            //     document.getElementById('product_description').innerHTML = "Product description can only have alphabets and number";
            //     return false;
            //   }
             }
             function productinformation(){
            //   let m = /^[A-Za-z0-9 _%@.,']*[A-Za-z0-9][A-Za-z0-9 _%@.,']*$/
              document.getElementById('product_information').style.display = "block";
              let infoproduct = document.getElementById('product_information_id').value;

              if(infoproduct == ''){
                document.getElementById('product_information').innerHTML = "Product information must be filled out";
                return false;
              }
              else{
                  document.getElementById('product_information').innerHTML = '';
                document.getElementById('product_information').style.display = "none";
              }
            //   else if(infoproduct.match(m)){
            //     document.getElementById('product_information').innerHTML = '';
            //     document.getElementById('product_information').style.display = "none";
            //   }
            //   else{
            //     document.getElementById('product_information').innerHTML = "Product information can only have alphabets and number";
            //     return false;
            //   }
             }
             function perserve(){
              let m = /^(\d*([.,](?=\d{1}))?\d+)+((?!\2)[.,]\d\d)?$/
              document.getElementById('per_serve').style.display = "block";
              let perser = document.getElementById('per_serve_id').value;

              if(perser == ''){
                document.getElementById('per_serve').innerHTML = "Per Serve must be filled out";
                return false;
              }else if(perser.match(m)){
                document.getElementById('per_serve').innerHTML = '';
                document.getElementById('per_serve').style.display = "none";
              }
              else{
                document.getElementById('per_serve').innerHTML = "Per serve can only have number";
                return false;
              }
             }
             function persize(){
              let m = /^(\d*([.,](?=\d{1}))?\d+)+((?!\2)[.,]\d\d)?$/
              document.getElementById('per_size').style.display = "block";
              let persiz = document.getElementById('per_size_id').value;

              if(persiz == ''){
                document.getElementById('per_size').innerHTML = "Per Size must be filled out";
                return false;
              }else if(persiz.match(m)){
                document.getElementById('per_size').innerHTML = '';
                document.getElementById('per_size').style.display = "none";
              }
              else{
                document.getElementById('per_size').innerHTML = "Per Size can only have number";
                return false;
              }
             }

    function validateform() {
      let pname = document.getElementById('productNameId').value;
      let dprice = document.getElementById('original_price_id').value;
      let cat = document.getElementById('category_name_id').value;
      let desproduct = document.getElementById('product_description_id').value;
      let infoproduct = document.getElementById('product_information_id').value;
      let perser = document.getElementById('per_serve_id').value;
      let persiz = document.getElementById('per_size_id').value;
      let primaryimage = document.getElementById('primimg').value;
      let m = /^[A-Za-z0-9 _-]*[A-Za-z0-9][A-Za-z0-9 _-]*$/;
      let mm = /^(\d*([.,](?=\d{1}))?\d+)+((?!\2)[.,]\d\d)?$/
    //   let mmm = /^[A-Za-z0-9 _%@.,']*[A-Za-z0-9][A-Za-z0-9 _%@.,']*$/
    //   let quan = document.forms["bform"]["qua[]"].value; 

        if (pname == '' && dprice == '' && cat == '' && desproduct == '' && infoproduct == '' && primaryimage == '' && perser == '' && persiz == '') {
            document.getElementById('productNameSpan').style.display = "block";
            document.getElementById('original_price').style.display = "block";
            document.getElementById('category_name').style.display = "block";
            document.getElementById('product_description').style.display = "block";
            document.getElementById('product_information').style.display = "block";
            // document.getElementById('quality_span').style.display = "block";
            document.getElementById('prim').style.display = "block";
            // document.getElementById('prim2s').style.display = "block";
            // document.getElementById('prim3s').style.display = "block";
            // document.getElementById('prim4s').style.display = "block";
            document.getElementById('per_serve').style.display = "block";
            document.getElementById('per_size').style.display = "block";
            
            document.getElementById('productNameSpan').innerHTML = "Product Name must be filled out";
            document.getElementById('original_price').innerHTML = "Product price must be filled out";
            document.getElementById('category_name').innerHTML = "Category must be selected";
            document.getElementById('product_description').innerHTML = "Product description must be selected";
            document.getElementById('product_information').innerHTML = "Product information must be filled out";
            // document.getElementById('quality_span').innerHTML = "Please select anyone option";
            document.getElementById('prim').innerHTML = "Please select an image";
            // document.getElementById('prim2s').innerHTML = "Please select an image";
            // document.getElementById('prim3s').innerHTML = "Please select an image";
            // document.getElementById('prim4s').innerHTML = "Please select an image";
            document.getElementById('per_serve').innerHTML = "Please fill out the field";
            document.getElementById('per_size').innerHTML = "Please fill out the field";
            return false;
        }
        else if (pname == '') {
            document.getElementById('productNameSpan').style.display = "block";
            document.getElementById('original_price').style.display = "none";
            document.getElementById('category_name').style.display = "none";
            document.getElementById('product_description').style.display = "none";
            document.getElementById('product_information').style.display = "none";
            // document.getElementById('quality_span').style.display = "none";
            document.getElementById('prim').style.display = "none";
            // document.getElementById('prim2s').style.display = "none";
            // document.getElementById('prim3s').style.display = "none";
            // document.getElementById('prim4s').style.display = "none";
            document.getElementById('per_serve').style.display = "none";
            document.getElementById('per_size').style.display = "none";
            document.getElementById('productNameSpan').innerHTML = "Product Name must be filled out";
            return false;
        }
        else if (!pname.match(m)) {
            document.getElementById('productNameSpan').style.display = "block";
            document.getElementById('original_price').style.display = "none";
            document.getElementById('category_name').style.display = "none";
            document.getElementById('product_description').style.display = "none";
            document.getElementById('product_information').style.display = "none";
            // document.getElementById('quality_span').style.display = "none";
            document.getElementById('prim').style.display = "none";
            // document.getElementById('prim2s').style.display = "none";
            // document.getElementById('prim3s').style.display = "none";
            // document.getElementById('prim4s').style.display = "none";
            document.getElementById('per_serve').style.display = "none";
            document.getElementById('per_size').style.display = "none";
            document.getElementById('productNameSpan').innerHTML = "Product name can only have alphabets and number";
            return false;
        }
        else if (dprice == '') {
            document.getElementById('productNameSpan').style.display = "none";
            document.getElementById('original_price').style.display = "block";
            document.getElementById('category_name').style.display = "none";
            document.getElementById('product_description').style.display = "none";
            document.getElementById('product_information').style.display = "none";
            // document.getElementById('quality_span').style.display = "none";
            document.getElementById('prim').style.display = "none";
                    // document.getElementById('prim2s').style.display = "none";
                    // document.getElementById('prim3s').style.display = "none";
                    // document.getElementById('prim4s').style.display = "none";
                    document.getElementById('per_serve').style.display = "none";
                    document.getElementById('per_size').style.display = "none";
            document.getElementById('original_price').innerHTML = "Price must be filled out";
            return false;
        }
        else if (!dprice.match(mm)) {
            document.getElementById('productNameSpan').style.display = "none";
            document.getElementById('original_price').style.display = "block";
            document.getElementById('category_name').style.display = "none";
            document.getElementById('product_description').style.display = "none";
            document.getElementById('product_information').style.display = "none";
            // document.getElementById('quality_span').style.display = "none";
            document.getElementById('prim').style.display = "none";
                    // document.getElementById('prim2s').style.display = "none";
                    // document.getElementById('prim3s').style.display = "none";
                    // document.getElementById('prim4s').style.display = "none";
                    document.getElementById('per_serve').style.display = "none";
                    document.getElementById('per_size').style.display = "none";
            document.getElementById('original_price').innerHTML = "Price can only have number";
            return false;
        }
        else if (cat == '') {
            document.getElementById('productNameSpan').style.display = "none";
            document.getElementById('original_price').style.display = "none";
            document.getElementById('category_name').style.display = "block";
            document.getElementById('product_description').style.display = "none";
            document.getElementById('product_information').style.display = "none";
            // document.getElementById('quality_span').style.display = "none";
            document.getElementById('prim').style.display = "none";
                    // document.getElementById('prim2s').style.display = "none";
                    // document.getElementById('prim3s').style.display = "none";
                    // document.getElementById('prim4s').style.display = "none";
                    document.getElementById('per_serve').style.display = "none";
                    document.getElementById('per_size').style.display = "none";
                    document.getElementById('category_name').innerHTML = "Category must be selected";
            
            return false;
        }
        else if (desproduct == '') {
                document.getElementById('productNameSpan').style.display = "none";
                document.getElementById('original_price').style.display = "none";
            document.getElementById('category_name').style.display = "none";
            document.getElementById('product_description').style.display = "block";
            document.getElementById('product_information').style.display = "none";
            // document.getElementById('quality_span').style.display = "none";
            document.getElementById('prim').style.display = "none";
                    // document.getElementById('prim2s').style.display = "none";
                    // document.getElementById('prim3s').style.display = "none";
                    // document.getElementById('prim4s').style.display = "none";
                    document.getElementById('per_serve').style.display = "none";
                    document.getElementById('per_size').style.display = "none";
                document.getElementById('product_description').innerHTML = "Product Description must be filled out";
                return false;
        }
        // else if (!desproduct.match(mmm)) {
        //         document.getElementById('productNameSpan').style.display = "none";
        //         document.getElementById('original_price').style.display = "none";
        //     document.getElementById('category_name').style.display = "none";
        //     document.getElementById('product_description').style.display = "block";
        //     document.getElementById('product_information').style.display = "none";
        //     // document.getElementById('quality_span').style.display = "none";
        //     document.getElementById('prim').style.display = "none";
        //             // document.getElementById('prim2s').style.display = "none";
        //             // document.getElementById('prim3s').style.display = "none";
        //             // document.getElementById('prim4s').style.display = "none";
        //             document.getElementById('per_serve').style.display = "none";
        //             document.getElementById('per_size').style.display = "none";
        //         document.getElementById('product_description').innerHTML = "Product description can only have alphabets and number";
        //         return false;
        // }
        else if (infoproduct == '') {
                document.getElementById('productNameSpan').style.display = "none";
                document.getElementById('original_price').style.display = "none";
            document.getElementById('category_name').style.display = "none";
            document.getElementById('product_description').style.display = "none";
            document.getElementById('product_information').style.display = "block";
            // document.getElementById('quality_span').style.display = "none";
            document.getElementById('prim').style.display = "none";
                    // document.getElementById('prim2s').style.display = "none";
                    // document.getElementById('prim3s').style.display = "none";
                    // document.getElementById('prim4s').style.display = "none";
                    document.getElementById('per_serve').style.display = "none";
                    document.getElementById('per_size').style.display = "none";
                document.getElementById('product_information').innerHTML = "Product information must be filled out";
                return false;
        }
        // else if (!infoproduct.match(mmm)) {
        //         document.getElementById('productNameSpan').style.display = "none";
        //         document.getElementById('original_price').style.display = "none";
        //     document.getElementById('category_name').style.display = "none";
        //     document.getElementById('product_description').style.display = "none";
        //     document.getElementById('product_information').style.display = "block";
        //     // document.getElementById('quality_span').style.display = "none";
        //     document.getElementById('prim').style.display = "none";
        //             // document.getElementById('prim2s').style.display = "none";
        //             // document.getElementById('prim3s').style.display = "none";
        //             // document.getElementById('prim4s').style.display = "none";
        //             document.getElementById('per_serve').style.display = "none";
        //             document.getElementById('per_size').style.display = "none";
        //         document.getElementById('product_information').innerHTML = "Product information can only have alphabets and number";
        //         return false;
        // }
        // else if (quan == '') {
        //         document.getElementById('productNameSpan').style.display = "none";
        //         document.getElementById('original_price').style.display = "none";
        //     document.getElementById('category_name').style.display = "none";
        //     document.getElementById('product_description').style.display = "none";
        //     document.getElementById('product_information').style.display = "none";
        //     // document.getElementById('quality_span').style.display = "block";
        //     document.getElementById('prim').style.display = "none";
        //             // document.getElementById('prim2s').style.display = "none";
        //             // document.getElementById('prim3s').style.display = "none";
        //             // document.getElementById('prim4s').style.display = "none";
        //             document.getElementById('per_serve').style.display = "none";
        //             document.getElementById('per_size').style.display = "none";
        //         document.getElementById('quality_span').innerHTML = "Please select anyone option";
        //         return false;
        // }
        else if (primaryimage == '') {
              document.getElementById('productNameSpan').style.display = "none";
                    // document.getElementById('gops').style.display = "none";
                    document.getElementById('original_price').style.display = "none";
                    document.getElementById('category_name').style.display = "none";
                    document.getElementById('product_description').style.display = "none";
                    document.getElementById('product_information').style.display = "none";
                    // document.getElementById('quality_span').style.display = "none";
                    document.getElementById('prim').style.display = "block";
                    // document.getElementById('prim2s').style.display = "none";
                    // document.getElementById('prim3s').style.display = "none";
                    // document.getElementById('prim4s').style.display = "none";
                    document.getElementById('per_serve').style.display = "none";
                    document.getElementById('per_size').style.display = "none";
                    document.getElementById('prim').innerHTML = "Please select an image";
              return false;
              
          }
        //   else if (img2 == '') {
        //       document.getElementById('gfns').style.display = "none";
        //             // document.getElementById('gops').style.display = "none";
        //             document.getElementById('original_price').style.display = "none";
        //             document.getElementById('gds').style.display = "none";
        //             document.getElementById('product_information').style.display = "none";
        //             document.getElementById('pis').style.display = "none";
        //             document.getElementById('prim').style.display = "none";
        //             document.getElementById('prim2s').style.display = "block";
        //             document.getElementById('prim3s').style.display = "none";
        //             document.getElementById('prim4s').style.display = "none";
        //             document.getElementById('per_serve').style.display = "none";
        //             document.getElementById('per_size').style.display = "none";
        //             document.getElementById('prim2s').innerHTML = "Please select an image";
        //       return false;
              
        //   }
        //   else if (img3 == '') {
        //       document.getElementById('gfns').style.display = "none";
        //             // document.getElementById('gops').style.display = "none";
        //             document.getElementById('original_price').style.display = "none";
        //             document.getElementById('gds').style.display = "none";
        //             document.getElementById('product_information').style.display = "none";
        //             document.getElementById('pis').style.display = "none";
        //             document.getElementById('prim').style.display = "nonne";
        //             document.getElementById('prim2s').style.display = "none";
        //             document.getElementById('prim3s').style.display = "block";
        //             document.getElementById('prim4s').style.display = "none";
        //             document.getElementById('per_serve').style.display = "none";
        //             document.getElementById('per_size').style.display = "none";
        //             document.getElementById('prim3s').innerHTML = "Please select an image";
        //       return false;
              
        //   }
        //   else if (img4 == '') {
        //       document.getElementById('gfns').style.display = "none";
        //             // document.getElementById('gops').style.display = "none";
        //             document.getElementById('original_price').style.display = "none";
        //             document.getElementById('gds').style.display = "none";
        //             document.getElementById('product_information').style.display = "none";
        //             document.getElementById('pis').style.display = "none";
        //             document.getElementById('prim').style.display = "nonne";
        //             document.getElementById('prim2s').style.display = "none";
        //             document.getElementById('prim3s').style.display = "none";
        //             document.getElementById('prim4s').style.display = "block";
        //             document.getElementById('per_serve').style.display = "none";
        //             document.getElementById('per_size').style.display = "none";
        //             document.getElementById('prim4s').innerHTML = "Please select an image";
        //       return false;
              
        //   }
          else if (perser == '') {
              document.getElementById('productNameSpan').style.display = "none";
                    // document.getElementById('gops').style.display = "none";
                    document.getElementById('original_price').style.display = "none";
                    document.getElementById('category_name').style.display = "none";
                    document.getElementById('product_description').style.display = "none";
                    document.getElementById('product_information').style.display = "none";
                    // document.getElementById('quality_span').style.display = "none";
                    document.getElementById('prim').style.display = "none";
                    // document.getElementById('prim2s').style.display = "none";
                    // document.getElementById('prim3s').style.display = "none";
                    // document.getElementById('prim4s').style.display = "none";
                    document.getElementById('per_serve').style.display = "block";
                    document.getElementById('per_size').style.display = "none";
                    document.getElementById('per_serve').innerHTML = "Please fill out the field";
              return false;
              
          }
          else if (!perser.match(mm)) {
              document.getElementById('productNameSpan').style.display = "none";
                    // document.getElementById('gops').style.display = "none";
                    document.getElementById('original_price').style.display = "none";
                    document.getElementById('category_name').style.display = "none";
                    document.getElementById('product_description').style.display = "none";
                    document.getElementById('product_information').style.display = "none";
                    // document.getElementById('quality_span').style.display = "none";
                    document.getElementById('prim').style.display = "none";
                    // document.getElementById('prim2s').style.display = "none";
                    // document.getElementById('prim3s').style.display = "none";
                    // document.getElementById('prim4s').style.display = "none";
                    document.getElementById('per_serve').style.display = "block";
                    document.getElementById('per_size').style.display = "none";
                    document.getElementById('per_serve').innerHTML = "This field can only have number";
              return false;
              
          }
          else if (persiz == '') {
              document.getElementById('productNameSpan').style.display = "none";
                    // document.getElementById('gops').style.display = "none";
                    document.getElementById('original_price').style.display = "none";
                    document.getElementById('category_name').style.display = "none";
                    document.getElementById('product_description').style.display = "none";
                    document.getElementById('product_information').style.display = "none";
                    // document.getElementById('quality_span').style.display = "none";
                    document.getElementById('prim').style.display = "none";
                    // document.getElementById('prim2s').style.display = "none";
                    // document.getElementById('prim3s').style.display = "none";
                    // document.getElementById('prim4s').style.display = "none";
                    document.getElementById('per_serve').style.display = "none";
                    document.getElementById('per_size').style.display = "block";
                    document.getElementById('per_size').innerHTML = "Please fill out the field";
              return false;
              
          }
          else if (!persiz.match(mm)) {
              document.getElementById('productNameSpan').style.display = "none";
                    // document.getElementById('gops').style.display = "none";
                    document.getElementById('original_price').style.display = "none";
                    document.getElementById('category_name').style.display = "none";
                    document.getElementById('product_description').style.display = "none";
                    document.getElementById('product_information').style.display = "none";
                    // document.getElementById('quality_span').style.display = "none";
                    document.getElementById('prim').style.display = "none";
                    // document.getElementById('prim2s').style.display = "none";
                    // document.getElementById('prim3s').style.display = "none";
                    // document.getElementById('prim4s').style.display = "none";
                    document.getElementById('per_serve').style.display = "none";
                    document.getElementById('per_size').style.display = "block";
                    document.getElementById('per_size').innerHTML = "This field can only have number";
              return false;
              
          }
        else {
            return true;
        }
    }
</script>

<script>
        function filevalidationprim(x) {
         
           var fileInput = x;//           document.getElementById('fileToUpload');
            //alert(fileInput);
            var filePath = fileInput.value;
          
            // Allowing file type
            var allowedExtensions = 
                    /(\.jpg|\.jpeg|\.png|\.gif|\.webp)$/i;
              
            if (!allowedExtensions.exec(filePath)) {
                //alert('Invalid file type');
                fileInput.value = '';
                 $('#prim').html('Must Select File with Extensions .jpg .png .jpeg .gif .webp');
                // alert("proimgs");
                return false;
            }
            else
            {
                //$('#err1').html('');
                //   alert("success");
                document.getElementById('prim').style.display = "none";
            }

           
             if (typeof (x.files) != "undefined") 
             {
                var size = parseFloat(x.files[0].size / 1024).toFixed(2);
            //  alert(size + " KB.");
                if(size>1024)
                {
                     var ns="";
                    $('#primimg').val(ns);
                    // $('#fileToUpload3').val(ns);
                    //  $('#x').val(n);
                     document.getElementById('prim').style.display = "block";
                    document.getElementById('prim').innerHTML = "Must Select Image size within 1024 KB";
                }
                else
                {
                      $('#prim').html('');
                      document.getElementById('prim').style.display = "none";
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
   </script>
<script>
        function filevalidationprimimg2(x) {
         
           var fileInput = x;//           document.getElementById('fileToUpload');
            //alert(fileInput);
            var filePath = fileInput.value;
          
            // Allowing file type
            var allowedExtensions = 
                    /(\.jpg|\.jpeg|\.png|\.gif|\.webp)$/i;
              
            if (!allowedExtensions.exec(filePath)) {
                //alert('Invalid file type');
                fileInput.value = '';
                 $('#prim2s').html('Must Select File with Extensions .jpg .png .jpeg .gif .webp');
                // alert("proimgs");
                return false;
            }
            else
            {
                //$('#err1').html('');
                //   alert("success");
                document.getElementById('prim2s').style.display = "none";
            }

           
             if (typeof (x.files) != "undefined") 
             {
                var size = parseFloat(x.files[0].size / 1024).toFixed(2);
            //  alert(size + " KB.");
                if(size>1024)
                {
                     var ns="";
                    $('#primimg2').val(ns);
                    // $('#fileToUpload3').val(ns);
                    //  $('#x').val(n);
                     document.getElementById('prim2s').style.display = "block";
                    document.getElementById('prim2s').innerHTML = "Must Select Image size within 1024 KB";
                }
                else
                {
                      $('#prim2s').html('');
                      document.getElementById('prim2s').style.display = "none";
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
   </script>
<script>
        function filevalidationprimimg3(x) {
         
           var fileInput = x;//           document.getElementById('fileToUpload');
            //alert(fileInput);
            var filePath = fileInput.value;
          
            // Allowing file type
            var allowedExtensions = 
                    /(\.jpg|\.jpeg|\.png|\.gif|\.webp)$/i;
              
            if (!allowedExtensions.exec(filePath)) {
                //alert('Invalid file type');
                fileInput.value = '';
                 $('#prim3s').html('Must Select File with Extensions .jpg .png .jpeg .gif .webp');
                // alert("proimgs");
                return false;
            }
            else
            {
                //$('#err1').html('');
                //   alert("success");
                document.getElementById('prim3s').style.display = "none";
            }

           
             if (typeof (x.files) != "undefined") 
             {
                var size = parseFloat(x.files[0].size / 1024).toFixed(2);
            //  alert(size + " KB.");
                if(size>1024)
                {
                     var ns="";
                    $('#primimg3').val(ns);
                    // $('#fileToUpload3').val(ns);
                    //  $('#x').val(n);
                     document.getElementById('prim3s').style.display = "block";
                    document.getElementById('prim3s').innerHTML = "Must Select Image size within 1024 KB";
                }
                else
                {
                      $('#prim3s').html('');
                      document.getElementById('prim3s').style.display = "none";
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
        </script>
<script>
        function filevalidationprimimg4(x) {
         
           var fileInput = x;//           document.getElementById('fileToUpload');
            //alert(fileInput);
            var filePath = fileInput.value;
          
            // Allowing file type
            var allowedExtensions = 
                    /(\.jpg|\.jpeg|\.png|\.gif|\.webp)$/i;
              
            if (!allowedExtensions.exec(filePath)) {
                //alert('Invalid file type');
                fileInput.value = '';
                 $('#prim4s').html('Must Select File with Extensions .jpg .png .jpeg .gif .webp');
                // alert("proimgs");
                return false;
            }
            else
            {
                //$('#err1').html('');
                //   alert("success");
                document.getElementById('prim4s').style.display = "none";
            }

           
             if (typeof (x.files) != "undefined") 
             {
                var size = parseFloat(x.files[0].size / 1024).toFixed(2);
            //  alert(size + " KB.");
                if(size>1024)
                {
                     var ns="";
                    $('#primimg4').val(ns);
                    // $('#fileToUpload3').val(ns);
                    //  $('#x').val(n);
                     document.getElementById('prim4s').style.display = "block";
                    document.getElementById('prim4s').innerHTML = "Must Select Image size within 1024 KB";
                }
                else
                {
                      $('#proimgs4').html('');
                      document.getElementById('prim4s').style.display = "none";
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
   </script>
       
            <!-- / Content -->

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
    <script src="admin/assets/js/form-validation.init.js"></script>
    <script src="admin/assets/vendor/js/bootstrap.js"></script>
    <script src="admin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="admin/assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="admin/assets/vendor/libs/apex-charts/apexcharts.js"></script>

    <!-- Main JS -->
    <script src="admin/assets/js/main.js"></script>

    <!-- Page JS -->
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

<!-- Mirrored from somoorish.com.au/admin/addproduct.php by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 31 Dec 2022 06:24:01 GMT -->
</html>
