<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="NewTest.WebForm1" %>

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
                    <td> Name : </td>
                    <td> <asp:TextBox ID="txtname" runat="server"></asp:TextBox> </td>
                    <asp:RequiredFieldValidator ID="rfvname" runat="server" ControlToValidate="txtname" Display="None" ErrorMessage="Please,Enter your name"></asp:RequiredFieldValidator>
                </tr>

                 <tr>
                    <td> City : </td>
                    <td> <asp:TextBox ID="txtcity" runat="server"></asp:TextBox> </td>
                    <asp:RequiredFieldValidator ID="rfvcity" runat="server" ControlToValidate="txtcity" Display="None" ErrorMessage="Please,Enter your city"></asp:RequiredFieldValidator>

                </tr>

                 <tr>
                    <td> Mobile No. : </td>
                    <td> <asp:TextBox ID="txtmob" runat="server"></asp:TextBox> </td>
                    <asp:RequiredFieldValidator ID="rfvmob" runat="server" ControlToValidate="txtmob" Display="None" ErrorMessage="Please,Enter your mobile number"></asp:RequiredFieldValidator>

                </tr>

                 <tr>
                    <td>  </td>
                    <td> <asp:Button ID="btninsert" runat="server" Text="Insert" OnClick="btninsert_Click" /> </td>
                  
                 </tr>

              <%--  <tr>
                    <td> </td>
                    <td> <asp:Button ID="btnshow" runat="server" Text="Get_Data" OnClick="btnshow_Click" /> </td>
                </tr>--%>


                   <%-- For pop-up box--%>
                <asp:ValidationSummary ID="pu" runat="server" ShowMessageBox="true" ShowSummary="false" />
                 
                   <%--for grid view--%>
                <asp:GridView ID="grd" runat="server" OnRowCommand="grd_RowCommand" AutoGenerateColumns="false" >
                    <Columns>
                        <asp:TemplateField HeaderText="Customer Name">
                            <ItemTemplate>
                                <%#Eval("name") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Customer City">
                            <ItemTemplate>
                                <%#Eval("city") %>
                            </ItemTemplate>
                        </asp:TemplateField>
 
                        <asp:TemplateField HeaderText="Customer Mobile No.">
                            <ItemTemplate>
                                <%#Eval("mobile_no") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="btndel" runat="server" Text="Delete" CommandArgument='<%#Eval("id") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>


                    </Columns>
                </asp:GridView>


            </table>
        </div>
    </form>
</body>
</html>
