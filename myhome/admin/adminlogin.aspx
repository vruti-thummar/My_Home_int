<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="myhome.admin.adminlogin" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login — MyHome Interiors</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,500;9..144,600&family=Work+Sans:wght@400;500;600&display=swap" rel="stylesheet" />

    <style type="text/css">
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Work Sans', sans-serif;
            background-color: #f7f3ed;
            color: #3f352c;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .login-card {
            background: #ffffff;
            border: 1px solid #e5ded3;
            border-radius: 10px;
            padding: 40px 30px;
            width: 100%;
            max-width: 420px;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.06);
            text-align: center;
        }

        .login-card h1 {
            font-family: 'Fraunces', serif;
            font-size: 26px;
            color: #3f352c;
            margin-bottom: 8px;
        }

        .login-card p {
            color: #7a6e65;
            font-size: 14px;
            margin-bottom: 25px;
        }

        .form-group {
            text-align: left;
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-size: 13px;
            font-weight: 500;
            margin-bottom: 6px;
            color: #3f352c;
        }

        .form-control {
            width: 100%;
            padding: 11px 12px;
            border: 1px solid #d8cbbb;
            border-radius: 6px;
            background: #fffdf9;
            font-family: 'Work Sans', sans-serif;
            font-size: 14px;
            color: #3f352c;
            outline: none;
        }

        .form-control:focus {
            border-color: #8a6b4d;
            box-shadow: 0 0 0 2px rgba(138, 107, 77, 0.15);
        }

        .btn-login {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 6px;
            background: #6b513b;
            color: #ffffff;
            font-family: 'Work Sans', sans-serif;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.2s ease;
            margin-top: 10px;
        }

        .btn-login:hover {
            background: #4d3929;
        }

        .error-msg {
            color: #c0392b;
            font-size: 13px;
            margin-top: 15px;
            display: block;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-card">
            <h1>Admin Panel</h1>
            <p>Sign in to manage orders & products</p>

            <div class="form-group">
                <label>Admin Username / Email</label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Enter username"></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Password</label>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter password"></asp:TextBox>
            </div>

            <asp:Button ID="btnLogin" runat="server" Text="Sign In" CssClass="btn-login" OnClick="btnLogin_Click" />

            <asp:Label ID="lblError" runat="server" CssClass="error-msg"></asp:Label>
        </div>
    </form>
</body>
</html>