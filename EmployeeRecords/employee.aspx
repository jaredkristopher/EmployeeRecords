﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="employee.aspx.cs" Inherits="EmployeeRecords.employees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="col-sm-10 text-left">
    <%--First Row--%>
    <div>
        <h1>Employee Info</h1>
    </div>
    <div class="row">  
        <div class="col-md-3">   
            <div class="container">
                <img class='img-responsive' src="Content/img/29-512.png">
            </div>  
        </div>
        <div class="col-md-4">
            <table class="table table-hover" id="tbl">
            <thead>
                <tr> 
                    
                </tr>
            </thead>
                <tbody id="tbody2">
                    <tr>
                        <th scope="row">Name</th>
                        <td id="full-name"></td>
                    </tr>
                    <tr>
                        <th scope="row">Email Address</th>
                        <td id="email-address"></td>
                    </tr>
                    <tr>
                        <th scope="row">Contact Number</th>
                        <td id="contact"></td>
                    </tr>
                    <tr>
                        <th scope="row">Role</th>
                        <td id="role"></td>
                    </tr>
                    <tr>
                        <th scope="row">Status</th>
                        <td id="status"></td>
                    </tr>
                    <tr>
                        <th scope="row">Date Hired</th>
                        <td id="date-hired"></td>
                    </tr>
                    <tr>
                        <th scope="row">Last Updated</th>
                        <td id="date-updated"></td>
                    </tr>
                    <tr>
                        <th scope="row">Account Active</th>
                        <td id="account-active"></td>
                    </tr>
                </tbody>
            </table>
        </div>                        
    </div>
    <br />
    <ul class="nav nav-pills">
        <li class="active"><a data-toggle="pill" href="#basic-info">Basic Info</a></li>
        <li><a data-toggle="pill" href="#requirements">Files and Requirements</a></li>
        <li><a data-toggle="pill" href="#attainments">Educational Attainments</a></li>
         <li><a data-toggle="pill" href="#qualifications">Qualifications</a></li>
        <li><a data-toggle="pill" href="#attendance">Attendance</a></li>
    </ul>
    <div class="tab-content">
        <div id="basic-info" class="tab-pane fade in active">
              <div class="row">  
                        </div>
                        <div class="row">
                            <div class="col-md-8">
                                <label>Address:</label>
                                <input class="form-control" id="address-view" type="text" disabled>
                            </div> 
                        </div>                      
                        <div class="row">
                            <div class="col-md-4">
                                    <label>Gender</label>
                                    <select class="form-control" id="gender-view" disabled>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                    </select> 
                            </div>
                        <div class="col-md-4">
                            <label>Birthday:</label>
                            <input class="form-control" id="birthday-view" type="text" disabled>
                        </div>  
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label>Nationality:</label>
                            <input class="form-control" id="nationality-view" type="text" disabled>
                        </div>
                        <div class="col-md-4">
                            <label>Religion:</label>
                            <input class="form-control" id="religion-view" type="text" disabled>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                                <label>Birthplace:</label>
                                <input class="form-control" id="birthplace-view" type="text" disabled>
                            </div>
                            <div class="col-md-4">
                                <label>Civil Status:</label>
                                <select class="form-control" id="civilstatus-view" disabled>
                                    <option value="Single">Single</option>
                                    <option value="Married">Married</option>
                                    <option value="Widowed">Widowed</option>
                                    <option value="Complicated">Widowed</option>
                                </select>
                            </div>
                      </div>
        </div>
        <div id="requirements" class="tab-pane fade col-md-8">
            <button type="button" class="btn btn-space" data-toggle="modal" data-target="#add-requirement"  data-backdrop="static" data-keyboard="false">Add Requirement</button>
            <table class="table table-hover" id="tblRequirements">
            <thead>
                <tr> 
                    <th>Benefit</th>
                    <th>Note</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody id="tbodyRequirements">

            </tbody>
        </table>
        </div>
        <div id="attainments" class="tab-pane fade  col-md-8">
            <button type="button" class="btn btn-space" data-toggle="modal" data-target="#add-attainment"  data-backdrop="static" data-keyboard="false">Add Attainment</button>
            <table class="table table-hover" id="tblAttainments">
            <thead>
                <tr> 
                    <th>Educational Attainment</th>
                    <th>Institute/School</th>
                    <th>Year Attended</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody id="tbodyAttainments">

            </tbody>
            </table>
        </div>
        <div id="qualifications" class="tab-pane fade  col-md-8">
            <button type="button" class="btn btn-space" data-toggle="modal" data-target="#add-experience"  data-backdrop="static" data-keyboard="false">Add Job Experience</button>
            <table class="table table-hover" id="tblExperiences">
            <thead>
                <tr> 
                    <th>Company Name</th>
                    <th>Position</th>
                    <th>Term</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody id="tbodyExperiences">

            </tbody>
            </table>
        </div>
        <div id="attendance" class="tab-pane fade">
              <h3>Menu 3</h3>
              <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
        </div>
    </div>
</div>

<%-- ADD REQUIREMENT MODAL--%>
<!-- Modal -->
<div class="modal fade" id="add-requirement" role="dialog">
    <div class="modal-dialog modal-xs">
        <!-- Modal content-->
        <form id="add-req">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add Requirement</h4>
                </div>
                <div class="modal-body">                   
                    <div class="row">
                        <div class="col-md-12">
                            <label>Requirement</label>
                            <select class="form-control" id="requirement" data-name="Gender">
                                <%--<option value="1">SSS</option>
                                <option value="2">BIR</option>
                                <option value="3">PhilHealth</option>
                                <option value="4">Pagibig</option>--%>
                            </select>
                            <label id="error-gender" class="text-danger" style="display:none"></label>
                        </div>    
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label>File:</label>
                            <input class="form-control" id="path" type="text" data-name="path">
                            <label id="error-path" class="text-danger" style="display:none"></label>
                        </div>
                    </div>  
                    <div class="row">
                        <div class="col-md-12">
                            <label>Note:</label>
                            <input class="form-control" id="note" type="text" data-name="note">
                            <label id="error-note" class="text-danger" style="display:none"></label>
                        </div>
                    </div>  
                </div>                         
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="save-requirement" >Add Requirement</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </form>
    </div>
</div>
<%--End of modal--%>

<%-- EDIT REQUIREMENT MODAL--%>
<!-- Modal -->
<div class="modal fade" id="edit-req-modal" role="dialog">
    <div class="modal-dialog modal-xs">
        <!-- Modal content-->
        <form id="edit-req">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Edit Requirement</h4>
                </div>
                <div class="modal-body">                   
                    <div class="row">
                        <div class="col-md-12">
                            <label>Requirement</label>
                            <select class="form-control" id="requirement-edit">
<%--                                <option value="1">SSS</option>
                                <option value="2">BIR</option>
                                <option value="3">PhilHealth</option>
                                <option value="4">Pagibig</option>--%>
                            </select>
                            <label id="error-gender-edit" class="text-danger" style="display:none"></label>
                        </div>    
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label>File:</label>
                            <input class="form-control" id="path-edit" type="text" data-name="path">
                            <label id="error-path-edit" class="text-danger" style="display:none"></label>
                        </div>
                    </div>  
                    <div class="row">
                        <div class="col-md-12">
                            <label>Note:</label>
                            <input class="form-control" id="note-edit" type="text" data-name="note">
                            <label id="error-note-edit" class="text-danger" style="display:none"></label>
                        </div>
                    </div>  
                </div>                         
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="update-requirement" >Update Requirement</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </form>
    </div>
</div>
<%--End of modal--%>


<%-- ADD ATTAINMENT MODAL--%>
<!-- Modal -->
<div class="modal fade" id="add-attainment" role="dialog">
    <div class="modal-dialog modal-xs">
        <!-- Modal content-->
        <form id="add-att">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add Attainment</h4>
                </div>
                <div class="modal-body">                   
                    <div class="row">
                        <div class="col-md-12">
                            <label>Attainment</label>
                            <select class="form-control" id="attainment" data-name="Attainment">
                                <option value="1">Tertiary</option>
                                <option value="2">Secondary</option>
                                <option value="3">Primary</option>
                            </select>
                        </div>    
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label>Year Started</label>
                            <input class="form-control" id="yearattended" type="text" data-name="yearAttended">
                            <label id="error-yearattended" class="text-danger" style="display:none"></label>
                        </div>
                        <div class="col-md-6">
                            <label>Year Ended</label>
                            <input class="form-control" id="yearended" type="text" data-name="path">
                            <label id="error-yearended" class="text-danger" style="display:none"></label>
                        </div>
                    </div>  
                    <div class="row">
                        <div class="col-md-12">
                            <label>School:</label>
                            <input class="form-control" id="school" type="text" data-name="note">
                            <label id="error-school" class="text-danger" style="display:none"></label>
                        </div>
                    </div>  
                </div>                         
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="save-attainment" >Add Attainment</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </form>
    </div>
</div>
<%--End of modal--%>

<%-- ADD EXPERIENCE MODAL--%>
<!-- Modal -->
<div class="modal fade" id="add-experience" role="dialog">
    <div class="modal-dialog modal-xs">
        <!-- Modal content-->
        <form id="add-exp">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add Experience</h4>
                </div>
                <div class="modal-body">                   
                    <div class="row">
                        <div class="col-md-12">
                            <label>Company Name:</label>
                            <input class="form-control" id="companyname" type="text" data-name="Company Name">
                            <label id="error-companyname" class="text-danger" style="display:none"></label>
                        </div>    
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label>Position:</label>
                            <input class="form-control" id="jobposition" type="text" data-name="Position">
                            <label id="error-jobposition" class="text-danger" style="display:none"></label>
                        </div>
                    </div> 
                    <div class="row">
                        <div class="col-md-6">
                            <label>Year Started</label>
                            <input class="form-control" id="yearstarted" type="text" data-name="Year Started">
                            <label id="error-yearstarted" class="text-danger" style="display:none"></label>
                        </div>
                        <div class="col-md-6">
                            <label>Year Ended</label>
                            <input class="form-control" id="yearendedexp" type="text" data-name="path">
                            <label id="error-yearendedexp" class="text-danger" style="display:none"></label>
                        </div>
                    </div>   
                </div>                         
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="save-experience" >Add Experience</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </form>
    </div>
</div>
<%--End of modal--%>


    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="Scripts/WebForms/employee.js"></script>
<script type="text/javascript">
    var id = parseInt(window.location.href.split('=')[1]);

    $(document).ready(function () {
        getEmployee(id);
        getEmpReq(id);
        getRequirements();
        getEmpAtt(id);
        getEmpJobExp(id);
    });
</script>


</asp:Content>