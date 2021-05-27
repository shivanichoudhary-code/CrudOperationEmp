<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testing.aspx.cs" Inherits="TestEmployee.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table border="1">
                <tr>
                    <td> Name</td>
                    <td> <asp:TextBox ID="txtname" runat="server"></asp:TextBox> </td>
                </tr>
               
                <tr>
                    <td> Mobile_No</td>
                    <td> <asp:TextBox ID="txtmob" runat="server"></asp:TextBox> </td>
                </tr>

                <tr>
                    <td> Email_id</td>
                    <td> <asp:TextBox ID="txtemail" runat="server"></asp:TextBox> </td>
                </tr>

                <tr>
                    <td> Location</td>
                    <td> <asp:TextBox ID="txtloc" runat="server"></asp:TextBox> </td>

                </tr>
                <%--Button--%>
                <tr>
                    <td> </td>
                    <td> <asp:Button ID="btninsert" runat="server" Text="Submit" OnClick="btninsert_Click" /> </td>
                </tr>

                <%--search button and text field--%>

                <tr>
                    <td> </td>
                    <td><asp:TextBox ID="txtsearch" runat="server"></asp:TextBox>
                        <asp:Button ID="btnsearch" runat="server" Text="Search" OnClick="btnsearch_Click" /> </td>
                </tr>

                <%--label--%>
                 
                <tr>
                    <td></td>
                    <td><asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label> </td>
                </tr>
                
                <%--Grid View--%>

                <asp:GridView ID="grd" runat="server" AutoGenerateColumns="false" OnRowCommand="grd_RowCommand" >
                   <Columns>
                       <asp:TemplateField HeaderText="Employee's Name">
                           <ItemTemplate>
                               <%#Eval("name") %>
                           </ItemTemplate>
                       </asp:TemplateField>

                       <asp:TemplateField HeaderText="Employee's Email id">
                           <ItemTemplate>
                               <%#Eval("emailid") %>
                           </ItemTemplate>
                       </asp:TemplateField>

                       <asp:TemplateField HeaderText="Employee's Mobile Number">
                           <ItemTemplate>
                               <%#Eval("mobile_no") %>
                           </ItemTemplate>
                       </asp:TemplateField>

                       <asp:TemplateField HeaderText="Employee's location">
                           <ItemTemplate>
                               <%#Eval("loc") %>
                           </ItemTemplate>
                       </asp:TemplateField>

                       <%--delete button--%>

                       <asp:TemplateField >
                           <ItemTemplate>
                               <asp:LinkButton ID="btndel" runat="server" CommandArgument='<%#Eval("empid")%>' CommandName="cmddel" OnClientClick="Please Confirm...Do you want to delete!!!" Text="Delete"></asp:LinkButton>
                           </ItemTemplate>
                       </asp:TemplateField>

                       <%--edit button--%>

                        <asp:TemplateField >
                           <ItemTemplate>
                               
                               <asp:LinkButton ID="btnedit" runat="server" CommandArgument='<%#Eval("empid")%>' CommandName="cmdedit" Text="Edit"></asp:LinkButton>
                           </ItemTemplate>
                       </asp:TemplateField>

                   </Columns>
                </asp:GridView>

            </table>
        </div>
    </form>
</body>
</html>
