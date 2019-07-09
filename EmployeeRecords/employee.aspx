<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="employee.aspx.cs" Inherits="EmployeeRecords.employees" %>
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
        <li><a data-toggle="pill" href="#requirements">Files Requirements</a></li>
        <li><a data-toggle="pill" href="#qualifications">Attainments</a></li>
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
        <div id="requirements" class="tab-pane fade">
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
        <div id="qualifications" class="tab-pane fade">
              <h3>Menu 2</h3>
              <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
        </div>
        <div id="attendance" class="tab-pane fade">
              <h3>Menu 3</h3>
              <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
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
                                <option value="1">SSS</option>
                                <option value="2">BIR</option>
                                <option value="3">PhilHealth</option>
                                <option value="4">Pagibig</option>
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
                            <input class="form-control  input-lg" id="note" type="text" data-name="note">
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

<%-- Edit REQUIREMENT MODAL--%>
<!-- Modal -->
<div class="modal fade" id="edit-req-modal" role="dialog">
    <div class="modal-dialog modal-sm">
        <!-- Modal content-->
        <form id="editEmpReq">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Edit Requirement</h4>
                </div>
                <div class="modal-body">                   
                    <div class="row">
                        <div class="col-md-6">
                            <label>Requirement</label>
                            <select class="form-control" id="requirement-edit" data-name="Gender">
                                <option value="1">SSS</option>
                                <option value="2">BIR</option>
                                <option value="3">PhilHealth</option>
                                <option value="4">Pagibig</option>
                            </select>
                            <label id="error-requirement-edit" class="text-danger" style="display:none"></label>
                        </div>    
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label>File:</label>
                            <input class="form-control" id="path-edit" type="text" data-name="path">
                            <label id="error-path-view" class="text-danger" style="display:none"></label>
                        </div>
                    </div>  
                    <div class="row">
                        <div class="col-md-6">
                            <label>Note:</label>
                            <input class="form-control" id="note-edit" type="text" data-name="note">
                            <label id="error-note-view" class="text-danger" style="display:none"></label>
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








</div>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="Scripts/WebForms/employee.js"></script>
<script type="text/javascript">
    var id = parseInt(window.location.href.split('=')[1]);
    $(document).ready(function () {
        getEmployee(id);
        getEmpReq(id);
    });



</script>
</asp:Content>