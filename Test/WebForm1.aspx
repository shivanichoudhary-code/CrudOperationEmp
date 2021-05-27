<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Test.WebForm1" %>

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
                    <td> Name:</td>
                    <td><asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td> Email Id:</td>
                    <td><asp:TextBox ID="txtemail" runat="server"></asp:TextBox></td>
                </tr>

                <tr>
                    <td> Age:</td>
                    <td><asp:TextBox ID="txtage" runat="server"></asp:TextBox></td>
                </tr>

                <tr>
                    <td> Salary:</td>
                    <td><asp:TextBox ID="txtsal" runat="server"></asp:TextBox></td>
                </tr>

                <tr>
                    <td></td>
                    <td><asp:Button ID="btninsert" runat="server" Text="Submit" OnClick="btninsert_Click"/></td>
               </tr>
               
                

                    
                



            </table>



        </div>
    </form>
</body>
</html>
