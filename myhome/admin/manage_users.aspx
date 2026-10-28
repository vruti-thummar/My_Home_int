<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manage_users.aspx.cs" Inherits="myhome.admin.manage_users" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Directory — MyHome Interiors</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Google Fonts: Cormorant Garamond & Plus Jakarta Sans -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,500;0,600;0,700;1,400&family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet" />

    <style type="text/css">
        :root {
            --bg-base: #f7f3ee;
            --bg-card: #ffffff;
            --surface-subtle: #fbf9f6;
            --border-warm: #e8ded2;
            --border-focus: #b47b48;
            --text-heading: #241e19;
            --text-body: #544b43;
            --text-muted: #8c8074;
            --primary-accent: #b47b48;
            --primary-hover: #9c6838;
            --nav-bg: #211b16;
            --danger: #b84a39;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            margin: 0;
            padding: 0;
            background-color: var(--bg-base);
            font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, sans-serif;
            color: var(--text-body);
            -webkit-font-smoothing: antialiased;
            min-height: 100vh;
        }

        /* Top Navigation */
        .admin-nav {
            background-color: var(--nav-bg);
            padding: 0 40px;
            height: 70px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-bottom: 1px solid rgba(255, 255, 255, 0.08);
            box-shadow: 0 4px 20px rgba(33, 27, 22, 0.08);
        }

        .brand-wrap {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .brand-logo {
            font-family: 'Cormorant Garamond', Georgia, serif;
            font-size: 24px;
            font-weight: 600;
            color: #f7f3ee;
            letter-spacing: 0.5px;
            text-decoration: none;
        }

        .brand-logo span {
            color: #d8a87b;
            font-style: italic;
        }

        .badge-admin {
            background-color: rgba(255, 255, 255, 0.08);
            color: #d1c4b7;
            font-size: 11px;
            font-weight: 600;
            padding: 4px 10px;
            border-radius: 20px;
            letter-spacing: 1px;
            text-transform: uppercase;
            border: 1px solid rgba(255, 255, 255, 0.12);
        }

        .nav-links {
            display: flex;
            gap: 6px;
            align-items: center;
        }

        .nav-links a {
            color: #b8aba0;
            text-decoration: none;
            font-size: 13.5px;
            font-weight: 500;
            padding: 8px 16px;
            border-radius: 6px;
            transition: all 0.2s ease;
            letter-spacing: 0.2px;
        }

        .nav-links a:hover {
            color: #ffffff;
            background-color: rgba(255, 255, 255, 0.06);
        }

        .nav-links a.active {
            color: #f7f3ee;
            background-color: rgba(180, 123, 72, 0.25);
            border: 1px solid rgba(180, 123, 72, 0.4);
        }

        .btn-logout {
            color: #f5b5ab !important;
            border: 1px solid rgba(239, 68, 68, 0.3) !important;
            margin-left: 10px;
        }

        .btn-logout:hover {
            background-color: var(--danger) !important;
            color: #ffffff !important;
            border-color: var(--danger) !important;
        }

        /* Container Layout */
        .page-container {
            max-width: 1240px;
            margin: 40px auto;
            padding: 0 24px 60px;
        }

        .content-header {
            margin-bottom: 28px;
        }

        .content-header h1 {
            font-family: 'Cormorant Garamond', Georgia, serif;
            font-size: 34px;
            font-weight: 600;
            color: var(--text-heading);
            letter-spacing: -0.5px;
        }

        .content-header p {
            color: var(--text-muted);
            font-size: 14.5px;
            margin-top: 4px;
        }

        /* Table Card Container */
        .table-card {
            background: var(--bg-card);
            border-radius: 16px;
            border: 1px solid var(--border-warm);
            box-shadow: 0 10px 30px rgba(60, 48, 38, 0.05);
            overflow: hidden;
        }

        .table-header {
            padding: 22px 28px;
            border-bottom: 1px solid var(--border-warm);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .table-header h2 {
            font-family: 'Cormorant Garamond', Georgia, serif;
            font-size: 22px;
            color: var(--text-heading);
        }

        .client-count {
            font-size: 13.5px;
            color: var(--text-muted);
            font-weight: 600;
        }

        .table-wrapper {
            width: 100%;
            overflow-x: auto;
        }

        /* Aesthetic GridView */
        .modern-grid {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
            font-size: 14px;
        }

        .modern-grid th {
            background-color: var(--surface-subtle);
            color: var(--text-muted);
            font-weight: 600;
            font-size: 11.5px;
            text-transform: uppercase;
            letter-spacing: 0.8px;
            padding: 16px 24px;
            border-bottom: 1px solid var(--border-warm);
            white-space: nowrap;
        }

        .modern-grid td {
            padding: 18px 24px;
            border-bottom: 1px solid #f2ece4;
            color: var(--text-body);
            vertical-align: middle;
        }

        .modern-grid tr:last-child td {
            border-bottom: none;
        }

        .modern-grid tr:hover td {
            background-color: #faf7f2;
        }

        .user-id-chip {
            font-family: 'Plus Jakarta Sans', monospace;
            font-weight: 600;
            color: var(--text-heading);
            background: #ede6dc;
            padding: 4px 10px;
            border-radius: 6px;
            font-size: 12.5px;
            display: inline-block;
        }

        .btn-delete {
            background-color: #fcf2f0;
            color: var(--danger);
            border: 1px solid #f5cfc9;
            text-decoration: none;
            font-weight: 600;
            font-size: 12.5px;
            padding: 6px 14px;
            border-radius: 6px;
            display: inline-block;
            transition: all 0.2s ease;
        }

        .btn-delete:hover {
            background-color: var(--danger);
            color: #ffffff;
            border-color: var(--danger);
        }

        @media (max-width: 820px) {
            .admin-nav {
                height: auto;
                padding: 16px 20px;
                flex-direction: column;
                gap: 12px;
            }
            .nav-links {
                flex-wrap: wrap;
                justify-content: center;
            }
            .content-header h1 {
                font-size: 28px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Top Navigation Bar -->
        <header class="admin-nav">
            <div class="brand-wrap">
                <a href="admindash.aspx" class="brand-logo">MyHome <span>Interiors</span></a>
                <span class="badge-admin">Admin Studio</span>
            </div>

            <nav class="nav-links">
                <a href="admindash.aspx">Dashboard</a>
                <a href="addproduct.aspx">Products</a>
                <a href="mange_order.aspx">Orders</a>
                <a href="manage_users.aspx" class="active">Customers</a>
                <a href="adminlogin.aspx" class="btn-logout">Logout</a>
            </nav>
        </header>

        <!-- Main Workspace -->
        <main class="page-container">
            <div class="content-header">
                <h1>Registered Customer Directory</h1>
                <p>View registered clients, monitor profiles, and manage customer accounts</p>
            </div>

            <!-- Table Card -->
            <div class="table-card">
                <div class="table-header">
                    <h2>Client Accounts</h2>
                    <span class="client-count">
                        Total Clients: <asp:Label ID="lblUserCount" runat="server" Text="0"></asp:Label>
                    </span>
                </div>

                <div class="table-wrapper">
                    <asp:GridView ID="gvUsers" runat="server" 
    AutoGenerateColumns="False" 
    DataKeyNames="Id"
    CssClass="modern-grid" 
    GridLines="None"
    OnRowDeleting="gvUsers_RowDeleting">
    <Columns>
        <asp:TemplateField HeaderText="User ID">
            <ItemTemplate>
                <span class="user-id-chip">#<%# Eval("Id") %></span>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Customer Name">
            <ItemTemplate>
                <strong style="color: var(--text-heading);"><%# Eval("Firstname") %></strong>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:BoundField DataField="Email" HeaderText="Email Address" />

        <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <asp:LinkButton ID="btnDelete" runat="server" 
                    CommandName="Delete" 
                    CssClass="btn-delete"
                    OnClientClick="return confirm('Are you sure you want to remove this customer account?');">
                    Remove
                </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
                </div>
            </div>
        </main>

    </form>
</body>
</html>