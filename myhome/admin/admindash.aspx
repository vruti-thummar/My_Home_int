<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admindash.aspx.cs" Inherits="myhome.admin.admindash" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Executive Dashboard — MyHome Interiors</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

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
            --success-accent: #2e6b4f;
            --warning-accent: #c07d2b;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, sans-serif;
            background-color: var(--bg-base);
            color: var(--text-body);
            -webkit-font-smoothing: antialiased;
            min-height: 100vh;
        }

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

        .page-container {
            max-width: 1260px;
            margin: 40px auto;
            padding: 0 24px 60px;
        }

        .content-header {
            margin-bottom: 32px;
        }

        .content-header h1 {
            font-family: 'Cormorant Garamond', Georgia, serif;
            font-size: 34px;
            font-weight: 600;
            color: var(--text-heading);
            letter-spacing: -0.4px;
        }

        .content-header p {
            color: var(--text-muted);
            font-size: 14.5px;
            margin-top: 4px;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 22px;
            margin-bottom: 36px;
        }

        .stat-card {
            background: var(--bg-card);
            border: 1px solid var(--border-warm);
            border-radius: 16px;
            padding: 24px 26px;
            box-shadow: 0 10px 25px rgba(60, 48, 38, 0.04);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .stat-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 14px 30px rgba(60, 48, 38, 0.07);
        }

        .stat-title {
            font-size: 12px;
            font-weight: 600;
            color: var(--text-muted);
            text-transform: uppercase;
            letter-spacing: 0.8px;
        }

        .stat-value {
            font-family: 'Cormorant Garamond', Georgia, serif;
            font-size: 38px;
            font-weight: 700;
            color: var(--text-heading);
            margin-top: 10px;
            letter-spacing: -0.5px;
            line-height: 1;
        }

        .stat-card.revenue .stat-value {
            color: var(--primary-accent);
        }

        .stat-card.highlight .stat-value {
            color: var(--warning-accent);
        }

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
            background-color: #ffffff;
        }

        .table-header h2 {
            font-family: 'Cormorant Garamond', Georgia, serif;
            font-size: 22px;
            font-weight: 600;
            color: var(--text-heading);
            letter-spacing: -0.2px;
        }

        .table-header a {
            color: var(--primary-accent);
            text-decoration: none;
            font-size: 13.5px;
            font-weight: 600;
            transition: color 0.15s ease;
        }

        .table-header a:hover {
            color: var(--primary-hover);
            text-decoration: underline;
        }

        .table-wrapper {
            width: 100%;
            overflow-x: auto;
        }

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

        .order-id-chip {
            font-family: 'Plus Jakarta Sans', monospace;
            font-weight: 600;
            color: var(--text-heading);
            background: #ede6dc;
            padding: 4px 10px;
            border-radius: 6px;
            font-size: 12.5px;
            display: inline-block;
        }

        .badge-status {
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            display: inline-block;
            letter-spacing: 0.2px;
            background-color: #fdf5ea;
            color: #a46820;
            border: 1px solid #f2ddbe;
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

            .stats-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <header class="admin-nav">
            <div class="brand-wrap">
                <a href="admindash.aspx" class="brand-logo">MyHome <span>Interiors</span></a>
                <span class="badge-admin">Admin Studio</span>
            </div>

            <nav class="nav-links">
                <a href="admindash.aspx" class="active">Dashboard</a>
                <a href="addproduct.aspx">Add Product</a>
                <a href="mange_order.aspx">Orders</a>
                <a href="manage_users.aspx">Customers</a>
                <a href="adminlogin.aspx" class="btn-logout">Logout</a>
            </nav>
        </header>

        <main class="page-container">
            <div class="content-header">
                <h1>Executive Overview</h1>
                <p>Live storefront statistics, daily sales velocity, and recent transactions</p>
            </div>

            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-title">Total Orders</div>
                    <div class="stat-value">
                        <asp:Label ID="lblTotalOrders" runat="server" Text="0"></asp:Label>
                    </div>
                </div>

                <div class="stat-card highlight">
                    <div class="stat-title">Today's Orders</div>
                    <div class="stat-value">
                        <asp:Label ID="lblTodayOrders" runat="server" Text="0"></asp:Label>
                    </div>
                </div>

                <div class="stat-card">
                    <div class="stat-title">Registered Clients</div>
                    <div class="stat-value">
                        <asp:Label ID="lblTotalUsers" runat="server" Text="0"></asp:Label>
                    </div>
                </div>

                <div class="stat-card highlight">
                    <div class="stat-title">Pending Orders</div>
                    <div class="stat-value">
                        <asp:Label ID="lblPendingOrders" runat="server" Text="0"></asp:Label>
                    </div>
                </div>

                <div class="stat-card revenue">
                    <div class="stat-title">Total Revenue</div>
                    <div class="stat-value">
                        <asp:Label ID="lblTotalRevenue" runat="server" Text="₹0"></asp:Label>
                    </div>
                </div>

                <div class="stat-card">
                    <div class="stat-title">Showroom Catalog</div>
                    <div class="stat-value">
                        <asp:Label ID="lblTotalProducts" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
            </div>

            <div class="table-card">
                <div class="table-header">
                    <h2>Recent 5 Client Orders</h2>
                    <a href="mange_order.aspx">View All Orders &rarr;</a>
                </div>

                <div class="table-wrapper">
                    <asp:GridView ID="gvRecentOrders" runat="server"
                        AutoGenerateColumns="False"
                        CssClass="modern-grid"
                        GridLines="None">
                        <Columns>
                            <asp:TemplateField HeaderText="Order ID">
                                <ItemTemplate>
                                    <span class="order-id-chip">#<%# Eval("order_id") %></span>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="User_Name" HeaderText="Client Name" />

                            <asp:TemplateField HeaderText="Placed Date">
                                <ItemTemplate>
                                    <%# Eval("order_Date", "{0:dd MMM yyyy}") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Amount">
                                <ItemTemplate>
                                    <strong style="color: var(--text-heading);">₹<%# Eval("order_total_amount") %></strong>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="order_payment_method" HeaderText="Payment Method" />

                            <asp:TemplateField HeaderText="Payment Status">
                                <ItemTemplate>
                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("order_payment_status") %>' CssClass="badge-status"></asp:Label>
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