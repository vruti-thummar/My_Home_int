<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="myhome.checkout" %>


<!DOCTYPE html>
<html lang="en">
<head runat="server">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Checkout — MyHome Interiors</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,500;9..144,600&family=Work+Sans:wght@400;500;600;700&family=Space+Mono&display=swap" rel="stylesheet">

<link rel="stylesheet" href="css/style.css">

<style type="text/css">

/* Checkout Main Layout */

.checkout-content {
    padding-top: 30px;
    padding-bottom: 60px;
}

.checkout-title {
    margin-bottom: 20px;
    color: #3f352c;
    font-family: 'Fraunces', serif;
}

.step-track {
    margin-bottom: 30px;
}

/* Customer Details Table */

.checkout-table {
    width: 100%;
    border-collapse: collapse;
    margin: 25px 0;
    background: #fffdf9;
    border: 1px solid #e5ded3;
    color: #3f352c;
    font-family: 'Work Sans', sans-serif;
    border-radius: 8px;
    overflow: hidden;
}

.checkout-table td {
    padding: 15px;
    border: 1px solid #e5ded3;
    vertical-align: middle;
}

.checkout-table .table-heading {
    background: #6b513b;
    color: #ffffff;
    font-family: 'Fraunces', serif;
    font-size: 21px;
    font-weight: 600;
}

.checkout-table input[type="text"],
.checkout-table input[type="email"],
.checkout-table input[type="tel"],
.checkout-table textarea {
    width: 100%;
    box-sizing: border-box;
    padding: 11px 12px;
    border: 1px solid #d8cbbb;
    border-radius: 6px;
    background: #ffffff;
    color: #3f352c;
    font-family: 'Work Sans', sans-serif;
    font-size: 14px;
    outline: none;
}

.checkout-table input:focus,
.checkout-table textarea:focus {
    border-color: #8a6b4d;
    box-shadow: 0 0 0 3px rgba(138, 107, 77, 0.12);
}

/* Product GridView */

.checkout-grid {
    width: 100%;
    margin: 25px 0;
    border-collapse: collapse;
    background: #fffdf9;
    color: #3f352c;
    font-family: 'Work Sans', sans-serif;
}

.checkout-grid th {
    padding: 15px 12px;
    background: #6b513b;
    color: #ffffff;
    text-align: left;
    font-size: 14px;
    font-weight: 600;
    border: 1px solid #6b513b;
}

.checkout-grid td {
    padding: 13px 12px;
    border: 1px solid #e5ded3;
    vertical-align: middle;
}

.checkout-grid tr:nth-child(even) {
    background: #f7f2e9;
}

.checkout-grid tr:hover {
    background: #efe7da;
}

.checkout-grid img {
    width: 70px;
    height: 70px;
    object-fit: contain;
    border-radius: 6px;
}

/* Summary and Payment Table */

.checkout-summary {
    width: 55%;
    margin: 25px 0 25px auto;
    border-collapse: collapse;
    background: #fffdf9;
    border: 1px solid #e5ded3;
    color: #3f352c;
    font-family: 'Work Sans', sans-serif;
}

.checkout-summary td {
    padding: 14px 16px;
    border: 1px solid #e5ded3;
    vertical-align: middle;
}

.checkout-summary td:first-child {
    font-weight: 500;
}

.checkout-summary tr:last-child {
    background: #f1e9dc;
}

.checkout-summary select {
    width: 100%;
    max-width: 260px;
    padding: 10px;
    border: 1px solid #d8cbbb;
    border-radius: 6px;
    background: #ffffff;
    color: #3f352c;
    font-family: 'Work Sans', sans-serif;
}

.payment-status {
    color: #6b513b;
    font-weight: 600;
}

/* Confirmation Button */

.checkout-button {
    display: block;
    margin: 25px 0 10px auto;
    padding: 13px 28px;
    border: none;
    border-radius: 6px;
    background: #6b513b;
    color: #ffffff;
    font-family: 'Work Sans', sans-serif;
    font-size: 15px;
    font-weight: 600;
    cursor: pointer;
    transition: background 0.2s ease;
}

.checkout-button:hover {
    background: #4d3929;
}

/* Mobile Responsive */

@media screen and (max-width: 768px) {

    .checkout-table,
    .checkout-table tbody,
    .checkout-table tr,
    .checkout-table td {
        display: block;
        width: 100%;
        box-sizing: border-box;
    }

    .checkout-table td {
        border-bottom: none;
    }

    .checkout-table tr:last-child td:last-child {
        border-bottom: 1px solid #e5ded3;
    }

    .checkout-grid {
        display: block;
        overflow-x: auto;
        white-space: nowrap;
    }

    .checkout-summary {
        width: 100%;
    }

    .checkout-button {
        width: 100%;
    }
}

</style>
</head>

<body>
<form id="form1" runat="server">

<!-- SVG ICONS -->

<svg xmlns="http://www.w3.org/2000/svg" style="display:none">
  <symbol id="icon-chair" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M16 8v24M48 8v40M16 32h32M16 40v16M16 40l-4 8M48 40h4l-2 8"/></symbol>
  <symbol id="icon-sofa" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M10 30v14a4 4 0 0 0 4 4h36a4 4 0 0 0 4-4V30"/><path d="M10 30v-6a4 4 0 0 1 4-4h4a4 4 0 0 1 4 4v6M42 30v-6a4 4 0 0 1 4-4h4a4 4 0 0 1 4 4v6"/><path d="M18 30h28v10H18z"/><path d="M10 44v8M54 44v8"/></symbol>
  <symbol id="icon-lamp" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M18 14 L46 14 L38 30 L26 30 Z"/><path d="M32 30v20M22 56h20"/><circle cx="32" cy="8" r="3"/></symbol>
  <symbol id="icon-table" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M6 18h52l-6 8H12z"/><path d="M16 26v28M48 26v28"/></symbol>
  <symbol id="icon-bed" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M8 34v20M8 34a4 4 0 0 1 4-4h40a4 4 0 0 1 4 4v6H8z"/><path d="M12 30V18a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v6M31 24v-6a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v12"/><path d="M56 40v14"/></symbol>
  <symbol id="icon-cart" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M8 10h6l6 30h28l6-20H18"/><circle cx="24" cy="50" r="3"/><circle cx="44" cy="50" r="3"/></symbol>
  <symbol id="icon-user" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="32" cy="22" r="10"/><path d="M12 54c2-12 12-18 20-18s18 6 20 18"/></symbol>
  <symbol id="icon-menu" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"><path d="M3 6h18M3 12h18M3 18h18"/></symbol>
  <symbol id="icon-close" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"><path d="M5 5l14 14M19 5L5 19"/></symbol>
  <symbol id="icon-search" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"><circle cx="10.5" cy="10.5" r="6.5"/><path d="M20 20l-5-5"/></symbol>
  <symbol id="icon-leaf" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M14 50C10 30 24 12 50 12c2 26-16 38-36 38z"/><path d="M14 50c6-10 16-20 30-30"/></symbol>
  <symbol id="icon-truck" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 16h30v26H4zM34 26h14l10 8v8H34z"/><circle cx="16" cy="46" r="4"/><circle cx="46" cy="46" r="4"/></symbol>
  <symbol id="icon-shield" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M32 6l22 8v16c0 16-10 26-22 28C20 56 10 46 10 30V14z"/><path d="M22 32l7 7 13-14"/></symbol>
  <symbol id="icon-swatch" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="8" y="8" width="20" height="20" rx="2"/><rect x="36" y="8" width="20" height="20" rx="2"/><rect x="8" y="36" width="20" height="20" rx="2"/><rect x="36" y="36" width="20" height="20" rx="2"/></symbol>
  <symbol id="icon-check" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><circle cx="32" cy="32" r="26"/><path d="M20 33l8 8 16-18"/></symbol>
  <symbol id="icon-box" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M8 20l24-10 24 10-24 10z"/><path d="M8 20v26l24 10V30M56 20v26l-24 10"/></symbol>
  <symbol id="icon-hand" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20 30V14a4 4 0 0 1 8 0v14M28 28V10a4 4 0 0 1 8 0v18M36 28V14a4 4 0 0 1 8 0v20"/><path d="M44 30v-8a4 4 0 0 1 8 0v20c0 10-8 18-18 18h-4c-8 0-12-4-16-10l-8-14a4 4 0 0 1 7-4l5 7"/></symbol>
</svg>

<!-- HEADER: KEEPING YOUR ORIGINAL HEADER -->

<header class="site-header">
  <div class="container header-row">
    <a href="index.aspx" class="logo">
      <svg><use href="#icon-swatch"/></svg>
      MyHome Interiors
    </a>

    <nav class="main-nav">
      <a href="index.aspx">Home</a>
      <a href="catalog.aspx">Catalog</a>
      <a href="about.aspx">About</a>
      <a href="login.aspx">Login</a>
      <a href="profile.aspx">Profile</a>
    </nav>

    <div class="header-actions">
      <button type="button" class="icon-btn" aria-label="Search">
        <svg><use href="#icon-search"/></svg>
      </button>

      <a class="icon-btn" href="cart.aspx" aria-label="Cart">
        <svg><use href="#icon-cart"/></svg>
        <span class="cart-count">0</span>
      </a>

      <a class="icon-btn" href="login.aspx" aria-label="Account">
        <svg><use href="#icon-user"/></svg>
      </a>

      <button type="button" class="nav-toggle icon-btn" aria-label="Menu">
        <svg><use href="#icon-menu"/></svg>
      </button>
    </div>
  </div>
</header>

<!-- CHECKOUT CONTENT -->

<main class="container section checkout-content">

    <span class="eyebrow">Step 2 of 3</span>

    <h1 class="checkout-title">Checkout</h1>

    <div class="step-track">
        <span class="step">Cart</span>
        <span>—</span>
        <span class="step active">Payment &amp; Delivery</span>
        <span>—</span>
        <span class="step">Confirmation</span>
    </div>

    <!-- CUSTOMER DETAILS -->

    <table class="checkout-table">
        <tr>
            <td colspan="4" class="table-heading">
                Customer Details
            </td>
        </tr>

        <tr>
            <td>Customer Name:</td>
            <td>
                <asp:TextBox ID="txtCustomerName" runat="server"
                    placeholder="Enter Customer Name">
                </asp:TextBox>
            </td>

            <td>Email:</td>
            <td>
                <asp:TextBox ID="txtCustomerEmail" runat="server"
                    TextMode="Email"
                    placeholder="Enter Email">
                </asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>Mobile:</td>
            <td>
                <asp:TextBox ID="txtCustomerMobile" runat="server"
                    TextMode="Phone"
                    placeholder="Enter Mobile Number">
                </asp:TextBox>
            </td>

            <td>Delivery Address:</td>
            <td>
                <asp:TextBox ID="txtCustomerAddress" runat="server"
                    TextMode="MultiLine"
                    Rows="3"
                    placeholder="Enter Delivery Address">
                </asp:TextBox>
            </td>
        </tr>
    </table>

    <!-- PRODUCT GRIDVIEW -->

    <asp:GridView ID="GridView1" runat="server"
        CssClass="checkout-grid"
        AutoGenerateColumns="False"
        Width="100%"
        EmptyDataText="No products found"
        GridLines="None">

        <Columns>

            <asp:ImageField
                DataImageUrlField="Product_Image"
                HeaderText="Product Image">
                <ControlStyle Width="70px" Height="70px" />
            </asp:ImageField>

            <asp:BoundField
                DataField="Product_Name"
                HeaderText="Product Name" />

            <asp:BoundField
                DataField="Price"
                HeaderText="Price"
                DataFormatString="₹{0:N2}" />

            <asp:BoundField
                DataField="Quantity"
                HeaderText="Quantity" />

            <asp:BoundField
                DataField="Line_Total"
                HeaderText="Total"
                DataFormatString="₹{0:N2}" />

        </Columns>
    </asp:GridView>

    <!-- TOTAL AND PAYMENT DETAILS -->

    <table class="checkout-summary">

        <tr>
            <td>Sub Total:</td>
            <td>
                <asp:Label ID="lblSubTotal" runat="server"></asp:Label>
            </td>
        </tr>

        <tr>
            <td>Delivery Charges:</td>
            <td>
                <asp:Label ID="lblDelivery" runat="server"
                    Text="₹0.00"></asp:Label>
            </td>
        </tr>

        <tr>
            <td><b>Total Amount:</b></td>
            <td>
                <asp:Label ID="lblTotalAmount" runat="server"
                    Font-Bold="true"></asp:Label>
            </td>
        </tr>

        <tr>
            <td>Payment Method:</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem Value="">--- Select Method ---</asp:ListItem>
                    <asp:ListItem>Cash On Delivery</asp:ListItem>
                    <asp:ListItem>Online Payment</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>

        <tr>
            <td>Payment Status:</td>
            <td>
                <asp:Label ID="lblPaymentStatus" runat="server"
                    CssClass="payment-status"></asp:Label>
            </td>
        </tr>

    </table>

    <asp:Button ID="Button1" runat="server"
        Text="Confirmation Order"
        CssClass="checkout-button"
        OnClick="Button1_Click" />

</main>

<!-- FOOTER: KEEPING YOUR ORIGINAL FOOTER -->

<footer class="site-footer">
  <div class="container">
    <div class="footer-grid">

      <div>
        <div class="logo" style="margin-bottom:0.75rem">
          <svg style="width:24px;height:24px">
            <use href="#icon-swatch"/>
          </svg>
          MyHome Interiors
        </div>
        <p>
          Furniture designed for how people actually live,
          made from materials that get better with age.
        </p>
      </div>

      <div>
        <h4>Shop</h4>
        <ul>
          <li><a href="catalog.aspx">All furniture</a></li>
          <li><a href="catalog.aspx?cat=sofas">Sofas</a></li>
          <li><a href="catalog.aspx?cat=tables">Tables</a></li>
        </ul>
      </div>

      <div>
        <h4>Account</h4>
        <ul>
          <li><a href="login.aspx">Sign in</a></li>
          <li><a href="profile.aspx">My orders</a></li>
          <li><a href="cart.aspx">Cart</a></li>
        </ul>
      </div>

      <div>
        <h4>Company</h4>
        <ul>
          <li><a href="about.aspx">About us</a></li>
          <li><a href="#">Contact</a></li>
          <li><a href="#">Careers</a></li>
        </ul>
      </div>

    </div>

    <div class="footer-bottom">
      <span>© 2026 MyHome Interiors. All rights reserved.</span>
      <span>Rajkot, Gujarat · IN</span>
    </div>
  </div>
</footer>

<script src="js/script.js"></script>
<script src="js/products.js"></script>
<script src="js/checkout.js"></script>

</form>
</body>
</html>

