<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addproduct.aspx.cs" Inherits="myhome.addproduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        

<div class="product-grid">


   
        
           <center>
            Product Name:
<asp:TextBox ID="txtName" runat="server"></asp:TextBox>
<br /><br />

Category:
<asp:TextBox ID="txtCategory" runat="server"></asp:TextBox>
<br /><br />

Price:
<asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
<br /><br />

Product Image:
<asp:FileUpload ID="FileUpload1" runat="server" />
<br />
<br />Description:
<asp:TextBox ID="TextBox4" runat="server"
    TextMode="MultiLine"></asp:TextBox>
<br /><br />

<asp:Button ID="btnAdd" runat="server"
    Text="Add Product" OnClick="btnAdd_Click" />
<br /><br />


            </center>
        </div>
    </form>
</body>
</html>
