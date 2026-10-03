<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addproduct.aspx.cs" Inherits="myhome.addproduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
    body {
        margin: 0;
        padding: 0;
        background: #f5f0e8;
        font-family: Arial, sans-serif;
        color: #2b2622;
    }

    .product-grid {
        width: 100%;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .product-grid center {
        width: 500px;
        background: #fffaf5;
        padding: 35px 45px;
        border: 1px solid #ddd3c5;
        border-radius: 6px;
        box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        box-sizing: border-box;
    }

    .product-grid center::before {
        content: "Add New Product";
        display: block;
        font-size: 30px;
        font-weight: bold;
        margin-bottom: 30px;
        font-family: Georgia, serif;
    }

    input[type="text"],
    textarea {
        width: 100%;
        box-sizing: border-box;
        padding: 13px;
        margin-top: 8px;
        border: 1px solid #cfc5b7;
        border-radius: 3px;
        background: white;
        font-size: 16px;
        outline: none;
    }

    input[type="text"]:focus,
    textarea:focus {
        border-color: #9b7948;
    }

    textarea {
        height: 100px;
        resize: vertical;
    }

    input[type="file"] {
        width: 100%;
        padding: 10px;
        margin-top: 8px;
        box-sizing: border-box;
        border: 1px solid #cfc5b7;
        background: white;
        border-radius: 3px;
    }

    input[type="submit"] {
        width: 100%;
        padding: 15px;
        background: #211c18;
        color: white;
        border: none;
        border-radius: 3px;
        font-size: 17px;
        font-weight: bold;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background: #3a332d;
    }
</style>
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
