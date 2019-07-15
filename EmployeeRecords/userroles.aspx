<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="userroles.aspx.cs" Inherits="EmployeeRecords.userroles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="col-sm-10 text-left">
        <div class="grid-container col-md-11">
          <%--First Row--%>
          <div>
              <h1>User Roles</h1>
          </div>
           <%--Second row BUTTONS--%>
          <div>        
              <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#add-status-modal"  data-backdrop="static" data-keyboard="false">Add New Role</button>
          </div>
          <table class="table table-hover" id="tblStatus" >
            <thead>
            <tr> 
                <th>Role Name</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
                </thead>
                <tbody id="tbodyStatus">
                </tbody>
         </table>
    </div> 
<%-- ADD STATUS MODAL--%>
<!-- Modal -->
<div class="modal fade" id="add-status-modal" role="dialog">
    <div class="modal-dialog modal-md">
        <!-- Modal content-->
        <form id="add">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add Employee</h4>
                </div>
                <div class="modal-body">
                    <div class="row">     
                        <div class="col-md-12">
                            <label>Role Name:</label>
                            <input class="form-control" id="role-name" type="text" data-name="Role Name">
                            <label id="error-role-name" class="text-danger" style="display:none"></label>
                        </div>
                        <div class="col-md-12">
                            <label>Description:</label>
                            <input class="form-control" id="role-description" type="text" data-name="Role Description">
                        </div>
                    </div>
                    <div class="col-md-12">
                        <label class="text-primary">Permissions:</label><br>
                        <div style="overflow-x:auto;">
                            <table>
                                <tbody><tr>
                                    <th>Module Name</th>
                                    <th>View</th>
                                    <th>Create</th>
                                    <th>Modify</th>
                                    <th>Delete</th>
                                </tr>
                                <tr>
                                    <td>Dashboard</td>
                                    <td>
                                        <label class="containers">
                                            <input type="checkbox" class="dashboard" id="canViewDashboard" value="1">
                                            <span class="checkmark"></span>
                                        </label>
                                    </td>
                                    <td>
                                        <label class="containers">
                                            <input type="checkbox" class="dashboard" id="canCreateDashboard" value="2">
                                            <span class="checkmark"></span>
                                        </label>
                                    </td>
                                    <td>
                                        <label class="containers">
                                            <input type="checkbox" class="dashboard" id="canModifyDashboard" value="3">
                                            <span class="checkmark"></span>
                                        </label>
                                    </td>
                                    <td>
                                        <label class="containers">
                                            <input type="checkbox" class="dashboard" id="canDeleteDashboard" value="4">
                                            <span class="checkmark"></span>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Administrator</td>
                                    <td>
                                        <label class="containers">
                                            <input type="checkbox" class="dashboard" id="canViewAdmin" value="5">
                                            <span class="checkmark"></span>
                                        </label>
                                    </td>
                                    <td>
                                        <label class="containers">
                                            <input type="checkbox" class="dashboard" id="canCreateAdmin" value="6">
                                            <span class="checkmark"></span>
                                        </label>
                                    </td>
                                    <td>
                                        <label class="containers">
                                            <input type="checkbox" class="dashboard" id="canModifyAdmin" value="7">
                                            <span class="checkmark"></span>
                                        </label>
                                    </td>
                                    <td>
                                        <label class="containers">
                                            <input type="checkbox" class="dashboard" id="canDeleteAdmin" value="8">
                                            <span class="checkmark"></span>
                                        </label>
                                    </td>
                                </tr>
                                    <tr>
                                    <td>Employees</td>
                                    <td>
                                        <label class="containers">
                                            <input type="checkbox" class="dashboard" id="canViewEmployees" value="9">
                                            <span class="checkmark"></span>
                                        </label>
                                    </td>
                                    <td>
                                        <label class="containers">
                                            <input type="checkbox" class="dashboard" id="canCreateEmployees" value="10">
                                            <span class="checkmark"></span>
                                        </label>
                                    </td>
                                    <td>
                                        <label class="containers">
                                            <input type="checkbox" class="dashboard" id="canModifyEmployees" value="11">
                                            <span class="checkmark"></span>
                                        </label>
                                    </td>
                                    <td>
                                        <label class="containers">
                                            <input type="checkbox" class="dashboard" id="canDeleteEmployees" value="12">
                                            <span class="checkmark"></span>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Benefits</td>
                                    <td>
                                        <label class="containers">
                                            <input type="checkbox" class="dashboard" id="canViewBenefit" value="21">
                                            <span class="checkmark"></span>
                                        </label>
                                    </td>
                                    <td>
                                        <label class="containers">
                                            <input type="checkbox" class="dashboard" id="canCreateBenefit" value="22">
                                            <span class="checkmark"></span>
                                        </label>
                                    </td>
                                    <td>
                                        <label class="containers">
                                            <input type="checkbox" class="dashboard" id="canModifyBenefit" value="23">
                                            <span class="checkmark"></span>
                                        </label>
                                    </td>
                                    <td>
                                        <label class="containers">
                                            <input type="checkbox" class="dashboard" id="canDeleteBenefit" value="24">
                                            <span class="checkmark"></span>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Qualifications</td>
                                    <td>
                                        <label class="containers">
                                            <input type="checkbox" class="dashboard" id="canViewQualification" value="25">
                                            <span class="checkmark"></span>
                                        </label>
                                    </td>
                                    <td>
                                        <label class="containers">
                                            <input type="checkbox" class="dashboard" id="canCreateQualification" value="26">
                                            <span class="checkmark"></span>
                                        </label>
                                    </td>
                                    <td>
                                        <label class="containers">
                                            <input type="checkbox" class="dashboard" id="canModifyQualification" value="27">
                                            <span class="checkmark"></span>
                                        </label>
                                    </td>
                                    <td>
                                        <label class="containers">
                                            <input type="checkbox" class="dashboard" id="canDeleteQualification" value="28">
                                            <span class="checkmark"></span>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Reports</td>
                                    <td>
                                        <label class="containers">
                                            <input type="checkbox" class="dashboard" id="canViewReport" value="29">
                                            <span class="checkmark"></span>
                                        </label>
                                    </td>
                                    <td>
                                        <label class="containers">
                                            <input type="checkbox" class="dashboard" id="canCreateReport" value="30">
                                            <span class="checkmark"></span>
                                        </label>
                                    </td>
                                    <td>
                                        <label class="containers">
                                            <input type="checkbox" class="dashboard" id="canModifyReport" value="31">
                                            <span class="checkmark"></span>
                                        </label>
                                    </td>
                                    <td>
                                        <label class="containers">
                                            <input type="checkbox" class="dashboard" id="canDeleteReport" value="32">
                                            <span class="checkmark"></span>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>User Roles</td>
                                    <td>
                                        <label class="containers">
                                            <input type="checkbox" class="dashboard" id="canViewRole" value="45">
                                            <span class="checkmark"></span>
                                        </label>
                                    </td>
                                    <td>
                                        <label class="containers">
                                            <input type="checkbox" class="dashboard" id="canCreateRole" value="46">
                                            <span class="checkmark"></span>
                                        </label>
                                    </td>
                                    <td>
                                        <label class="containers">
                                            <input type="checkbox" class="dashboard" id="canModifyRole" value="47">
                                            <span class="checkmark"></span>
                                        </label>
                                    </td>
                                    <td>
                                        <label class="containers">
                                            <input type="checkbox" class="dashboard" id="canDeleteRole" value="48">
                                            <span class="checkmark"></span>
                                        </label>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                           </div>
                        </div>
                </div>                         
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="save">Add Role</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </form>
    </div>
</div>
<%--End of modal--%>





</div>
    <script src="scripts/jquery-3.4.1.js"></script>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>--%>
<script src="Scripts/WebForms/employee.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fastclick/1.0.6/fastclick.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/2.4.0/js/adminlte.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-sparklines/2.1.2/jquery.sparkline.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-slimScroll/1.3.8/jquery.slimscroll.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
</asp:Content>