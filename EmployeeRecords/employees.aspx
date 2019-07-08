<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="employees.aspx.cs" Inherits="EmployeeRecords.employees" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="col-sm-10 text-left">
        <div class="grid-container">
          <%--First Row--%>
          <div>
              <h1>Employees</h1>
          </div>
           <%--Second row BUTTONS--%>
          <div>        
              <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal"  data-backdrop="static" data-keyboard="false">Add New Employee</button>
              <button type="button" class="btn btn-primary">Import Excel</button>
          </div>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">
                         <label>Show
                            <select name="myTable_length" aria-controls="myTable" class="">
                                <option value="10">10</option>
                                <option value="25">25</option>
                                <option value="50">50</option>
                                <option value="100">100</option>
                            </select> entries
                           </label>  </th>
                            <th scope="col"></th>
                            <th scope="col"></th>
                                <th scope="col">
                                    <label>Search:
                                        <input type="text"  id="myInput" class="" placeholder="Search.." aria-controls="myTable">
                                    </label></th>        
                    </tr>
                </thead>
            </table>
        <table class="table table-hover" id="tbl">
            <thead>
                <tr> 
                    <th>No.</th>
                    <th>Employee Number</th>
                    <th>Profile Picture</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Contact</th>
                    <th>Address</th>
                    <th>Gender</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody id="tbody">

            </tbody>
        </table>
    </div>
    <%--Showing of entries--%>
    <div class="dataTables_info" id="myTable_info" role="status" aria-live="polite">Showing 0 to 0 of 0 entries</div>
    <%--Pagination--%>
    <div class="pagination">
        <a href="#">&laquo;</a>
        <a href="#">1</a>
        <a class="active" href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#">6</a>
        <a href="#">&raquo;</a>
    </div>
 
<%-- ADD EMPLOYEE MODAL--%>
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
        <!-- Modal content-->
        <form id="add">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add New Employee</h4>
                </div>
                    <div class="modal-body">
                        <div class="row">
                          <div class="col-md-4"></div>  
                            <div class="col-md-4">   
                                <div class="container">
                                    <img class='img-responsive' src="Content/img/29-512.png">
                                        <div class="avatar-upload">
                                            <div class="avatar-edit">
                                                <input type='file' id="imageUpload" accept=".png, .jpg, .jpeg" />
                                                <label for="imageUpload"></label>
                                            </div>
                                            <div class="avatar-preview">
                                                <div id="imagePreview" style="background-image: url(http://i.pravatar.cc/500?img=7);">
                                                </div>
                                            </div>
                                        </div>
                                </div>  
                            </div>
                            </div>
                            <div class="row">     
                                <div class="col-md-6">
                                    <label>First Name:</label>
                                    <input class="form-control" id="first-name" type="text" data-name="First Name">
                                    <label id="error-first-name" class="text-danger" style="display:none"></label>
                                </div>
                                <div class="col-md-6">
                                    <label>Last Name:</label>
                                    <input class="form-control" id="last-name" type="text" data-name="Last Name"/>
                                    <label id="error-last-name" class="text-danger" style="display:none"></label>
                                </div>
                             </div>
                             <div class="row">
                                <div class="col-md-6">
                                    <label>Middle Initial:</label>
                                    <input class="form-control" id="MI" type="text" data-name="Middle Initial">
                                    <label id="error-MI" class="text-danger" style="display:none"></label>
                                </div>
                                <div class="col-md-6">
                                    <label>Email:</label>
                                    <input class="form-control" id="email" type="text">
                                   <label id="error-email" class="text-danger" style="display:none"></label>
                                </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Password:</label>
                                        <input class="form-control" id="password" type="password" data-name="Password">
                                        <label id="error-password" class="text-danger" style="display:none"></label>
                                    </div>
                                    <div class="col-md-6">
                                        <label>Contact Number:</label>
                                        <input class="form-control" id="contact" type="text" data-name="Contact Number">
                                        <label id="error-contactnumber" class="text-danger" style="display:none"></label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>Address:</label>
                                        <input class="form-control" id="address" type="text" data-name="Address">
                                        <label id="error-address" class="text-danger" style="display:none"></label>
                                    </div> 
                                </div>                      
                                <div class="row">
                                    <div class="col-md-6">
                                            <label>Gender</label>
                                            <select class="form-control" id="gender" data-name="Gender">
                                                <option value="Male">Male</option>
                                                <option value="Female">Female</option>
                                            </select>
                                            <label id="error-gender" class="text-danger" style="display:none"></label>
                                    </div>
                                    <div class="col-md-6">
                                        <label>Birthday:</label>
                                        <input class="form-control" id="birthday" type="text" data-name="Birthday">
                                        <label id="error-birthday" class="text-danger" style="display:none"></label>
                                        <%--<div class="form-group">
                                            <div class="input-group date" id="birthday">
                                                <input type="text" class="form-control" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                        </div>--%>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Religion:</label>
                                        <input class="form-control" id="religion" type="text" data-name="Religion">
                                        <label id="error-religion" class="text-danger" style="display:none"></label>
                                    </div>
                                    <div class="col-md-6">
                                        <label>Nationality:</label>
                                        <input class="form-control" id="nationality" type="text" data-name="Nationality">
                                        <label id="error-nationality" class="text-danger" style="display:none"></label>
                                    </div>
                                  </div>  
                                    <div class="row">
                                        <div class="col-md-6">
                                                <label>Birthplace:</label>
                                                <input class="form-control" id="birthplace" type="text"  data-name="Birthplace">
                                                <label id="error-birthplace" class="text-danger" style="display:none"></label>
                                            </div>
                                            <div class="col-md-6">
                                                <label>Civil Status:</label>
                                                <select class="form-control" id="civilstatus" data-name="Civil Status">
                                                    <option value="Single">Single</option>
                                                    <option value="Married">Married</option>
                                                    <option value="Widowed">Widowed</option>
                                                    <option value="Complicated">Widowed</option>
                                                </select>
                                                <label id="error-civilstatus" class="text-danger" style="display:none"></label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Employees Status:</label>
                                                <select class="form-control" id="employeestatus" data-name="Civil Status">
                                                    <option value="1">Hired</option>
                                                    <option value="2">Rejected</option>
                                                    <option value="3">Terminated</option>
                                                    <option value="4">Applicant</option>
                                                </select>
                                                <label id="error-employeestatus" class="text-danger" style="display:none"></label>
                                            </div>
                                            <div class="col-md-6">
                                                <label>Role:</label>
                                                <select class="form-control" id="role" data-name="Role">
                                                    <option value="1">Admin</option>
                                                    <option value="2">Supervisor</option>
                                                    <option value="3">Staff</option>
                                                    <option value="4">Employee</option>
                                                </select>
                                                <label id="error-role" class="text-danger" style="display:none"></label>
                                            </div>
                                          </div> 
                                </div>                         
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" id="save" >Create Employee</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
            </div>
        </form>
    </div>
</div>
<%--End of modal--%>


<%-- EDIT EMPLOYEE MODAL--%>
<!-- Modal -->
<div class="modal fade" id="edit-modal" role="dialog">
    <div class="modal-dialog modal-lg">
        <!-- Modal content-->
        <form id="edit">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Modify Employee</h4>
                </div>
                    <div class="modal-body">
                        <div class="row">
                          <div class="col-md-4"></div>  
                            <div class="col-md-4">   
                                <div class="container">
                                    <img class='img-responsive' src="Content/img/29-512.png">
                                        <div class="avatar-upload">
                                            <div class="avatar-edit">
                                                <input type='file' id="imageUpload2" accept=".png, .jpg, .jpeg" />
                                                <label for="imageUpload"></label>
                                            </div>
                                            <div class="avatar-preview">
                                                <div id="imagePreview2" style="background-image: url(http://i.pravatar.cc/500?img=7);">
                                                </div>
                                            </div>
                                        </div>
                                </div>  
                            </div>
                            </div>
                            <div class="row">     
                                <div class="col-md-6">
                                    <label>First Name:</label>
                                    <input class="form-control" id="first-name-edit" type="text" data-name="First Name">
                                    <label id="error-first-name-edit" class="text-danger" style="display:none"></label>
                                </div>
                                <div class="col-md-6">
                                    <label>Last Name:</label>
                                    <input class="form-control" id="last-name-edit" type="text" data-name="Last Name">
                                    <label id="error-last-name-edit" class="text-danger" style="display:none"></label>
                                </div>
                             </div>
                             <div class="row">
                                <div class="col-md-6">
                                    <label>Middle Initial:</label>
                                    <input class="form-control" id="MI-edit" type="text" data-name="Middle Initial">
                                    <label id="error-MI-edit" class="text-danger" style="display:none"></label>
                                </div>
                                <div class="col-md-6">
                                    <label>Email:</label>
                                    <input class="form-control" id="email-edit" type="text" data-name="Email">
                                    <label id="error-email-edit" class="text-danger" style="display:none"></label>
                                </div>
                                </div>
                                <div class="row">
                                   <%-- <div class="col-md-6">
                                        <label>Password:</label>
                                        <input class="form-control" id="password-edit" type="password">
                                    </div>--%>
                                    <div class="col-md-6">
                                        <label>Contact Number:</label>
                                        <input class="form-control" id="contact-edit" type="text" data-name="Contact Number">
                                        <label id="error-contactnumber-edit" class="text-danger" style="display:none"></label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>Address:</label>
                                        <input class="form-control" id="address-edit" type="text" data-name="Address">
                                        <label id="error-address-edit" class="text-danger" style="display:none"></label>
                                    </div> 
                                </div>                      
                                <div class="row">
                                    <div class="col-md-6">
                                            <label>Gender</label>
                                            <select class="form-control" id="gender-edit" data-name="Gender">
                                                <option value="Male">Male</option>
                                                <option value="Female">Female</option>
                                            </select>
                                            <label id="error-gender-edit" class="text-danger" style="display:none"></label>
                                    </div>
                                    <div class="col-md-6">
                                        <label>Birthday:</label>
                                        <input class="form-control" id="birthday-edit" type="text" data-name="Birthday">
                                        <label id="error-birthday-edit" class="text-danger" style="display:none"></label>
                                        <%--<div class="form-group">
                                            <div class="input-group date" id="birthday">
                                                <input type="text" class="form-control" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                        </div>--%>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Religion:</label>
                                        <input class="form-control" id="religion-edit" type="text" data-name="Religion">
                                        <label id="error-religion-edit" class="text-danger" style="display:none"></label>
                                    </div>
                                    <div class="col-md-6">
                                        <label>Nationality:</label>
                                        <input class="form-control" id="nationality-edit" type="text" data-name="Nationality">
                                        <label id="error-nationality-edit" class="text-danger" style="display:none"></label>
                                    </div>
                                  </div>  
                                    <div class="row">
                                        <div class="col-md-6">
                                                <label>Birthplace:</label>
                                                <input class="form-control" id="birthplace-edit" type="text" data-name="Birthplace">
                                                <label id="error-birthplace-edit" class="text-danger" style="display:none"></label>
                                            </div>
                                            <div class="col-md-6">
                                                <label>Civil Status:</label>
                                                <select class="form-control" id="civilstatus-edit" data-name="Civil Status">
                                                    <option value="Single">Single</option>
                                                    <option value="Married">Married</option>
                                                    <option value="Widowed">Widowed</option>
                                                    <option value="Complicated">Widowed</option>
                                                </select>
                                                <label id="error-civilstatus-edit" class="text-danger" style="display:none"></label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Employees Status:</label>
                                                <select class="form-control" id="employeestatus-edit" data-name="Employee Status">
                                                    <option value="1">Hired</option>
                                                    <option value="2">Rejected</option>
                                                    <option value="3">Terminated</option>
                                                    <option value="4">Applicant</option>
                                                </select>
                                                <label id="error-employee-edit" class="text-danger" style="display:none"></label>
                                            </div>
                                            <div class="col-md-6">
                                                <label>Role:</label>
                                                <select class="form-control" id="role-edit" data-name="Employee Role">
                                                    <option value="1">Admin</option>
                                                    <option value="2">Supervisor</option>
                                                    <option value="3">Staff</option>
                                                    <option value="4">Employee</option>
                                                </select>
                                                <label id="error-role-edit" class="text-danger" style="display:none"></label>
                                            </div>
                                          </div> 
                                </div>                         
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" id="saveChanges">Modify Employee</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
            </div>
        </form>
    </div>
</div>
<%--End of modal--%>

<%--VIEW EMPLOYEE MODAL--%>

<!-- Modal -->
<div class="modal fade" id="view-modal" role="dialog">
    <div class="modal-dialog modal-lg">
        <!-- Modal content-->
        <form id="view">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Employee info</h4>
                    <a href="#" class="more-employee-info" target="_blank">Work related info →</a>
                </div>
                    <div class="modal-body">
                        <div class="row">
                          <div class="col-md-4"></div>  
                            <div class="col-md-4">   
                                <div class="container">
                                    <img class='img-responsive' src="Content/img/29-512.png">
                                        <%--<div class="avatar-upload">
                                            <div class="avatar-edit">
                                                <input type='file' id="imageUpload2" accept=".png, .jpg, .jpeg" />
                                                <label for="imageUpload"></label>
                                            </div>
                                            <div class="avatar-preview">
                                                <div id="imagePreview2" style="background-image: url(http://i.pravatar.cc/500?img=7);">
                                                </div>
                                            </div>
                                        </div>--%>
                                </div>  
                            </div>
                            <div class="col-md-4"></div>  
                            <div class="col-md-6">
                                <label>First Name:</label>
                                <input class="form-control" id="first-name-view" type="text">
                            </div>
                            <div class="col-md-6">
                                <label>Last Name:</label>
                                <input class="form-control" id="last-name-view" type="text">
                            </div>
                            <div class="col-md-6">
                                <label>Middle Initial:</label>
                                <input class="form-control" id="MI-view" type="text">
                            </div>
                            <div class="col-md-6">
                                <label>Email:</label>
                                <input class="form-control" id="email-view" type="text">
                            </div>
<%--                            <div class="col-md-6">
                                <label>Password:</label>
                                <input class="form-control" id="password-view" type="password">
                            </div>--%>
                            <div class="col-md-6">
                                <label>Contact Number:</label>
                                <input class="form-control" id="contact-view" type="text">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <label>Address:</label>
                                <input class="form-control" id="address-view" type="text">
                            </div> 
                        </div>                      
                        <div class="row">
                            <div class="col-md-6">
                                    <label>Gender</label>
                                    <select class="form-control" id="gender-view">
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                    </select> 
                            </div>
                        <div class="col-md-6">
                            <label>Birthday:</label>
                            <input class="form-control" id="birthday-view" type="text">
                            <%--<div class="form-group">
                                <div class="input-group date" id="birthday">
                                    <input type="text" class="form-control" />
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                            </div>--%>
                        </div>
                        <div class="col-md-6">
                            <label>Religion:</label>
                            <input class="form-control" id="religion-view" type="text">
                        </div>
                        <div class="col-md-6">
                            <label>Nationality:</label>
                            <input class="form-control" id="nationality-view" type="text">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                                <label>Birthplace:</label>
                                <input class="form-control" id="birthplace-view" type="text">
                            </div>
                            <div class="col-md-6">
                                <label>Civil Status:</label>
                                <select class="form-control" id="civilstatus-view">
                                    <option value="Single">Single</option>
                                    <option value="Married">Married</option>
                                    <option value="Widowed">Widowed</option>
                                    <option value="Complicated">Widowed</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label>Employees Status:</label>
                                <select class="form-control" id="employeestatus-view">
                                    <option value="1">Hired</option>
                                    <option value="2">Rejected</option>
                                    <option value="3">Terminated</option>
                                    <option value="4">Applicant</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label>Role:</label>
                                <select class="form-control" id="role-view">
                                    <option value="1">Admin</option>
                                    <option value="2">Supervisor</option>
                                    <option value="3">Staff</option>
                                    <option value="4">Employee</option>
                                </select>
                            </div>
                      </div>      
                </div>                         
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </form>
    </div>
</div>
<%--End of modal--%>

 


</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="Scripts/WebForms/employee.js"></script>

</asp:Content>