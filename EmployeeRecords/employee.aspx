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
                    <th scope="row">Date hired</th>
                    <td id="hired-view"></td>
                </tr>
                <tr>
                    <th scope="row">Email Address</th>
                    <td>Jared@yahoo.com</td>
                </tr>
                <tr>
                    <th scope="row">Contact Number</th>
                    <td>0923423535</td>
                </tr>
            </tbody>
            </table>
            </div>                        
        </div>    
        <ul class="nav nav-tabs">
          <li class="active"><a href="/basic">Basic Info</a></li>
          <li><a href="#">Files Requirements</a></li>
          <li><a href="#">Qualifications</a></li>
          <li><a href="#">Attendance</a></li>
        </ul>  
                </div>                         
        



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="Scripts/WebForms/employee.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        find(parseInt(window.location.href.split('=')[1]));
    });
</script>
</asp:Content>