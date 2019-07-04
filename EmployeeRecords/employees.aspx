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
              <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Add New Employee</button>
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
                                        <input type="search" class="" placeholder="" aria-controls="myTable">
                                    </label></th>        
                    </tr>
                </thead>
            </table>
        <table class="table table-hover" id="tbl">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Profile Picture</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Contact</th>
                    <th>Address</th>
                    <th>Gender</th>
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
 
 
 <!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <form id="add">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add New Employee</h4>
                </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-6">
                                <label>First Name:</label>
                                <input class="form-control" id="first-name" type="text">
                            </div>
                            <div class="col-md-6">
                                <label>Last Name:</label>
                                <input class="form-control" id="last-name" type="text"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Middle Initial:</label>
                                <input class="form-control" id="MI" type="text">
                            </div>
                            <div class="col-md-6">
                                <label>Contact Number:</label>
                                <input class="form-control" id="contact" type="text">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Email:</label>
                                <input class="form-control" id="email" type="text">
                            </div>
                            <div class="col-md-6">
                                <label>Password:</label>
                                <input class="form-control" id="password" type="password">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <label>Address:</label>
                                <input class="form-control" id="address" type="text">
                            </div>
                            <div class="col-md-6">
                                <label>Birthday:</label>
                                <input class="form-control" id="birthday" type="text">
                            </div>
                            <div class="col-md-6">
                                <label>Gender:</label>
                                <select class="form-control" id="gender">
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label>Religion:</label>
                                <input class="form-control" id="religion" type="text">
                            </div>
                            <div class="col-md-6">
                                <label>Nationality:</label>
                                <input class="form-control" id="nationality" type="text">
                            </div>
                            <div class="col-md-6">
                                <label>Birthplace:</label>
                                <input class="form-control" id="birthplace" type="text">
                            </div>
                            <div class="col-md-6">
                                <label>Civil Status:</label>
                                <select class="form-control" id="civilstatus">
                                    <option value="Single">Single</option>
                                    <option value="Married">Married</option>
                                    <option value="Widowed">Widowed</option>
                                    <option value="Single Mom">Single Mom</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label>Employees Status:</label>
                                <select class="form-control" id="employeestatus">
                                    <option value="1">Hired</option>
                                    <option value="2">Rejected</option>
                                    <option value="3">Terminated</option>
                                    <option value="4">Applicant</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label>Role:</label>
                                <select class="form-control" id="role">
                                    <option value="1">Admin</option>
                                    <option value="2">Supervisor</option>
                                    <option value="3">Staff</option>
                                    <option value="4">Employee</option>
                                </select>
                            </div>
                        </div>       
                    </div>                         
                    <div class="modal-footer">
                     <button type="button" class="btn btn-default" data-dismiss="modal" id="save" value="Submit">Add</button>
                     <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%--End of modal--%>

<div class="modal fade" id="view-modal" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">View Employee Info</h4>
            </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <label>First Name:</label>
                            <input class="form-control" id="first-name-view" type="text">
                        </div>
                        <div class="col-md-6">
                            <label>Last Name:</label>
                            <input class="form-control" id="last-name-view" type="text"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label>Middle Initial:</label>
                            <input class="form-control" id="MI-view" type="text">
                        </div>
                        <div class="col-md-6">
                            <label>Contact Number:</label>
                            <input class="form-control" id="contact-view" type="text">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label>Email:</label>
                            <input class="form-control" id="email-view" type="text">
                        </div>
                        <div class="col-md-6">
                            <label>Password:</label>
                            <input class="form-control" id="password-view" type="password">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label>Address:</label>
                            <input class="form-control" id="address-view" type="text">
                        </div>
                        <div class="col-md-6">
                            <label>Birthday:</label>
                            <input class="form-control" id="birthday-view" type="text">
                        </div>
                        <div class="col-md-6">
                            <label>Gender:</label>
                            <select class="form-control" id="gender-view">
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label>Religion:</label>
                            <input class="form-control" id="religion-view" type="text">
                        </div>
                        <div class="col-md-6">
                            <label>Nationality:</label>
                            <input class="form-control" id="nationality-view" type="text">
                        </div>
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
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="save" value="Submit">Add</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
<%--End of modal--%>
 
<!-- Modal -->
<div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog modal-lg">
        <!-- Modal content-->
        <form id="add2">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Detailed</h4>
                </div>
                <div class="modal-body">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" id="btnsave2" value="Submit" onclick="SubmitData()" >Add</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="Scripts/WebForms/employee.js"></script>
</asp:Content>