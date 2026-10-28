<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminprod.aspx.cs" Inherits="myhome.admin.WebForm1" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Product — Admin Portal</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Google Font: Inter -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />

    <style type="text/css">
        :root {
            --bg-page: #f8fafc;
            --border-color: #e2e8f0;
            --text-main: #0f172a;
            --text-muted: #64748b;
            --primary: #2563eb;
            --primary-hover: #1d4ed8;
            --success: #10b981;
            --danger: #ef4444;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background-color: var(--bg-page);
            color: var(--text-main);
            -webkit-font-smoothing: antialiased;
            padding-bottom: 40px;
        }

        /* Top Navigation */
        .admin-nav {
            background-color: #1e293b;
            padding: 0 32px;
            height: 64px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .brand-wrap {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .brand-logo {
            font-size: 17px;
            font-weight: 700;
            color: #ffffff;
            text-decoration: none;
        }

        .badge-admin {
            background-color: #334155;
            color: #94a3b8;
            font-size: 11px;
            font-weight: 600;
            padding: 3px 8px;
            border-radius: 6px;
            text-transform: uppercase;
        }

        .nav-links {
            display: flex;
            gap: 8px;
            align-items: center;
        }

            .nav-links a {
                color: #94a3b8;
                text-decoration: none;
                font-size: 14px;
                font-weight: 500;
                padding: 8px 14px;
                border-radius: 6px;
                transition: all 0.15s ease;
            }

                .nav-links a:hover {
                    color: #ffffff;
                    background-color: rgba(255, 255, 255, 0.05);
                }

                .nav-links a.active {
                    color: #ffffff;
                    background-color: #334155;
                }

        .btn-logout {
            background-color: #ef4444 !important;
            color: #ffffff !important;
            font-weight: 600;
            margin-left: 12px;
        }

        /* Page Layout */
        .page-container {
            max-width: 800px;
            margin: 36px auto;
            padding: 0 20px;
        }

        .content-header {
            margin-bottom: 24px;
        }

            .content-header h1 {
                font-size: 24px;
                font-weight: 700;
                color: #0f172a;
            }

            .content-header p {
                color: var(--text-muted);
                font-size: 14px;
                margin-top: 4px;
            }

        /* Form Card */
        .form-card {
            background: #ffffff;
            border-radius: 12px;
            border: 1px solid var(--border-color);
            padding: 32px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
        }

        .status-msg {
            display: block;
            margin-bottom: 20px;
            font-size: 14px;
            font-weight: 600;
            color: var(--primary);
        }

        .form-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 16px;
        }

            .form-table td:first-child {
                width: 28%;
                font-size: 14px;
                font-weight: 600;
                color: #334155;
                vertical-align: middle;
            }

            .form-table td:last-child {
                width: 72%;
            }

        /* Controls */
        input[type="text"],
        select {
            width: 100%;
            padding: 10px 14px;
            border: 1px solid var(--border-color);
            border-radius: 8px;
            outline: none;
            font-size: 14px;
            font-family: inherit;
            color: #0f172a;
            background-color: #ffffff;
            transition: border-color 0.15s, box-shadow 0.15s;
        }

            input[type="text"]:focus,
            select:focus {
                border-color: var(--primary);
                box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.12);
            }

        input[type="file"] {
            width: 100%;
            padding: 8px 12px;
            border: 1px dashed var(--border-color);
            border-radius: 8px;
            background: #f8fafc;
            color: #475569;
            font-size: 13px;
            cursor: pointer;
        }

        /* Submit Button */
        #Button1 {
            background-color: var(--primary);
            color: #ffffff;
            border: none;
            padding: 11px 28px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.15s ease;
        }

            #Button1:hover {
                background-color: var(--primary-hover);
            }

        @media (max-width: 650px) {
            .admin-nav {
                height: auto;
                padding: 16px;
                flex-direction: column;
                gap: 12px;
            }

            .form-table td {
                display: block;
                width: 100% !important;
            }

                .form-table td:first-child {
                    padding-bottom: 6px;
                }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Top Navigation -->
        <header class="admin-nav">
            <div class="brand-wrap">
                <a href="dashboard.aspx" class="brand-logo">MyHome Interiors</a>
                <span class="badge-admin">Admin Portal</span>
            </div>

            <nav class="nav-links">
                <a href="dashboard.aspx">Dashboard</a>
                <a href="Product.aspx" class="active">Add Product</a>
                <a href="mange_order.aspx">Orders</a>
                <a href="adminlogin.aspx" class="btn-logout">Logout</a>
            </nav>
        </header>

        <main class="page-container">
            <div class="content-header">
                <h1>Add New Product</h1>
                <p>Add products to your catalog with specifications and images</p>
            </div>

            <div class="form-card">
                <asp:Label ID="Label2" runat="server" CssClass="status-msg"></asp:Label>

                <table class="form-table">
                    <tr>
                        <td>Company Name:</td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem>---Select---</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                        <td>Product Name:</td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter product name"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>Product Model:</td>
                        <td>
                            <asp:TextBox ID="TextBox3" runat="server" placeholder="Enter model number"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>Product Descrip:</td>
                        <td>
                            <asp:TextBox ID="TextBox4" runat="server" placeholder="Enter product description"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>Product Config:</td>
                        <td>
                            <asp:TextBox ID="TextBox5" runat="server" placeholder="Enter configuration/specs"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>Product Wight:</td>
                        <td>
                            <asp:TextBox ID="TextBox6" runat="server" placeholder="Enter weight"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>Product Image:</td>
                        <td>
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                        </td>
                    </tr>

                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="Add Product" OnClick="Button1_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </main>

    </form>
</body>
</html>
