<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addproduct.aspx.cs" Inherits="myhome.addproduct" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Products — MyHome Interiors</title>
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
            max-width: 1200px;
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

        .form-card {
            background: var(--bg-card);
            padding: 36px 40px;
            border: 1px solid var(--border-warm);
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(60, 48, 38, 0.05);
            margin-bottom: 40px;
        }

        .form-card h2 {
            font-family: 'Cormorant Garamond', Georgia, serif;
            font-size: 24px;
            color: var(--text-heading);
            margin-bottom: 20px;
            border-bottom: 1px solid var(--border-warm);
            padding-bottom: 10px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .form-group.full-width {
            grid-column: 1 / -1;
        }

        .form-group label {
            font-size: 13.5px;
            font-weight: 600;
            color: var(--text-heading);
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 11px 15px;
            border: 1px solid var(--border-warm);
            border-radius: 8px;
            background-color: var(--surface-subtle);
            font-size: 14px;
            font-family: inherit;
            color: var(--text-heading);
            outline: none;
            transition: all 0.2s ease;
        }

        input[type="text"]:focus,
        textarea:focus {
            background-color: #ffffff;
            border-color: var(--border-focus);
            box-shadow: 0 0 0 3px rgba(180, 123, 72, 0.15);
        }

        textarea {
            height: 80px;
            resize: vertical;
        }

        input[type="file"] {
            width: 100%;
            padding: 9px 12px;
            border: 1px dashed var(--border-warm);
            background-color: var(--surface-subtle);
            border-radius: 8px;
            font-size: 13px;
            color: var(--text-muted);
            cursor: pointer;
            outline: none;
        }

        .btn-submit {
            padding: 13px 30px;
            background: linear-gradient(135deg, #b47b48 0%, #9c6838 100%);
            color: #ffffff;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.25s ease;
            box-shadow: 0 4px 14px rgba(180, 123, 72, 0.25);
            margin-top: 15px;
        }

        .btn-submit:hover {
            background: linear-gradient(135deg, #a36e3e 0%, #8b5b2e 100%);
            transform: translateY(-1px);
        }

        .table-card {
            background: var(--bg-card);
            border-radius: 16px;
            border: 1px solid var(--border-warm);
            box-shadow: 0 10px 30px rgba(60, 48, 38, 0.05);
            overflow: hidden;
        }

        .table-header {
            padding: 20px 28px;
            border-bottom: 1px solid var(--border-warm);
        }

        .table-header h2 {
            font-family: 'Cormorant Garamond', Georgia, serif;
            font-size: 24px;
            color: var(--text-heading);
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
            padding: 16px 20px;
            border-bottom: 1px solid var(--border-warm);
            white-space: nowrap;
        }

        .modern-grid td {
            padding: 16px 20px;
            border-bottom: 1px solid #f2ece4;
            color: var(--text-body);
            vertical-align: middle;
        }

        .modern-grid tr:hover td {
            background-color: #faf7f2;
        }

        .img-thumb {
            width: 48px;
            height: 48px;
            object-fit: cover;
            border-radius: 6px;
            border: 1px solid var(--border-warm);
        }

        .order-id-chip {
            font-family: 'Plus Jakarta Sans', monospace;
            font-weight: 600;
            color: var(--text-heading);
            background: #ede6dc;
            padding: 4px 8px;
            border-radius: 6px;
            font-size: 12px;
        }

        .modern-grid a {
            text-decoration: none;
            font-weight: 600;
            font-size: 12.5px;
            padding: 6px 12px;
            border-radius: 6px;
            display: inline-block;
            margin-right: 4px;
            transition: all 0.2s ease;
        }

        .modern-grid a[href*="Edit"] {
            background-color: #faf5ef;
            color: var(--primary-accent);
            border: 1px solid #ebd9c7;
        }

        .modern-grid a[href*="Edit"]:hover {
            background-color: var(--primary-accent);
            color: #ffffff;
        }

        .modern-grid a[href*="Update"] {
            background-color: #f1f8f4;
            color: var(--success-accent);
            border: 1px solid #c7e3d2;
        }

        .modern-grid a[href*="Update"]:hover {
            background-color: var(--success-accent);
            color: #ffffff;
        }

        .modern-grid a[href*="Cancel"],
        .modern-grid a[href*="Delete"] {
            background-color: #fcf2f0;
            color: var(--danger);
            border: 1px solid #f5cfc9;
        }

        .modern-grid a[href*="Cancel"]:hover,
        .modern-grid a[href*="Delete"]:hover {
            background-color: var(--danger);
            color: #ffffff;
        }

        @media (max-width: 768px) {
            .admin-nav {
                height: auto;
                padding: 16px 20px;
                flex-direction: column;
                gap: 12px;
            }

            .form-grid {
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
                <a href="admindash.aspx">Dashboard</a>
                <a href="addproduct.aspx" class="active">Add & Manage Products</a>
                <a href="mange_order.aspx">Orders</a>
                <a href="manage_users.aspx">Customers</a>
                <a href="adminlogin.aspx" class="btn-logout">Logout</a>
            </nav>
        </header>

        <main class="page-container">
            <div class="content-header">
                <h1>Showroom Catalog Management</h1>
                <p>Add new furniture items or modify/remove existing catalog products</p>
            </div>

            <div class="form-card">
                <h2>Add New Product</h2>
                <div class="form-grid">
                    <div class="form-group">
                        <label>Product Name</label>
                        <asp:TextBox ID="txtName" runat="server" placeholder="e.g. Oak Coffee Table" OnTextChanged="txtName_TextChanged"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>Category</label>
                        <asp:TextBox ID="txtCategory" runat="server" placeholder="e.g. Living Room, Bedroom"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>Price (₹)</label>
                        <asp:TextBox ID="txtPrice" runat="server" placeholder="e.g. 14500"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>Product Image</label>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </div>

                    <div class="form-group full-width">
                        <label>Description</label>
                        <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine" placeholder="Enter materials, wood finish, and dimensions..."></asp:TextBox>
                    </div>
                </div>

                <asp:Button ID="btnAdd" runat="server" Text="Add Product to Catalog" CssClass="btn-submit" OnClick="btnAdd_Click" />
            </div>

            <div class="table-card">
                <div class="table-header">
                    <h2>Existing Products List</h2>
                </div>

                <div class="table-wrapper">
                    <asp:GridView ID="GridView1" runat="server"
                        DataKeyNames="Product_Id"
                        AutoGenerateColumns="False"
                        CssClass="modern-grid"
                        GridLines="None"
                        OnRowEditing="GridView1_RowEditing"
                        OnRowCancelingEdit="GridView1_RowCancelingEdit"
                        OnRowUpdating="GridView1_RowUpdating"
                        OnRowDeleting="GridView1_RowDeleting">
                        <Columns>
                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <span class="order-id-chip">#<%# Eval("Product_Id") %></span>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Image">
                                <ItemTemplate>
                                    <asp:Image ID="imgProd" runat="server"
                                        ImageUrl='<%# string.IsNullOrEmpty(Eval("Product_Image").ToString()) ? "~/Product_images/default.jpg" : "~/" + Eval("Product_Image") %>'
                                        CssClass="img-thumb" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Product Name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditName" runat="server" Text='<%# Bind("Product_Name") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <strong><%# Eval("Product_Name") %></strong>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Category">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditCat" runat="server" Text='<%# Bind("Category") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <%# Eval("Category") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Price">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditPrice" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    ₹<%# Eval("Price") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:CommandField HeaderText="Actions" ShowEditButton="True" ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </main>

    </form>
</body>
</html>