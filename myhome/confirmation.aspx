<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="confirmation.aspx.cs" Inherits="myhome.confirmation" %>

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
        .section {
            padding-top: 30px;
            padding-bottom: 60px;
        }

        h1 {
            color: #3f352c;
            font-family: 'Fraunces', serif;
        }

        h2 {
            color: #3f352c;
            font-family: 'Fraunces', serif;
            font-size: 24px;
        }

        .step-track {
            margin-bottom: 30px;
        }

        table[border="1"]:first-of-type {
            width: 100% !important;
            border-collapse: collapse !important;
            border: 1px solid #e5ded3 !important;
            background: #fffdf9 !important;
            color: #3f352c !important;
            font-family: 'Work Sans', sans-serif !important;
            border-radius: 8px !important;
            overflow: hidden !important;
            margin: 25px 0 !important;
        }

        table[border="1"]:first-of-type td {
            padding: 14px 16px !important;
            border: 1px solid #e5ded3 !important;
            vertical-align: middle !important;
            font-size: 14px !important;
        }

        table[border="1"]:first-of-type tr:first-child td {
            background: #6b513b !important;
            color: #ffffff !important;
            border: 1px solid #6b513b !important;
        }

        table[border="1"]:first-of-type h3 {
            margin: 0 !important;
            color: #ffffff !important;
            font-family: 'Fraunces', serif !important;
            font-size: 20px !important;
            font-weight: 600 !important;
        }

        table[border="1"]:first-of-type td:first-child {
            width: 20% !important;
            font-weight: 500 !important;
        }

        table[border="1"]:first-of-type td:last-child span {
            display: inline-block !important;
            width: 100% !important;
            min-height: 20px !important;
            box-sizing: border-box !important;
            padding: 10px 12px !important;
            border: 1px solid #d8cbbb !important;
            border-radius: 6px !important;
            background: #f7f2e9 !important;
            color: #3f352c !important;
            font-family: 'Work Sans', sans-serif !important;
            font-size: 14px !important;
        }

        #GridView1 {
            width: 100% !important;
            margin: 25px 0 !important;
            border-collapse: collapse !important;
            background: #fffdf9 !important;
            color: #3f352c !important;
            font-family: 'Work Sans', sans-serif !important;
            border: 1px solid #e5ded3 !important;
        }

        #GridView1 th {
            padding: 15px 12px !important;
            background: #6b513b !important;
            color: #ffffff !important;
            text-align: left !important;
            font-size: 14px !important;
            font-weight: 600 !important;
            border: 1px solid #6b513b !important;
        }

        #GridView1 td {
            padding: 13px 12px !important;
            border: 1px solid #e5ded3 !important;
            vertical-align: middle !important;
            font-size: 14px !important;
        }

        #GridView1 tr:nth-child(even) {
            background: #f7f2e9 !important;
        }

        #GridView1 tr:hover {
            background: #efe7da !important;
        }

        #GridView1 img {
            width: 70px !important;
            height: 70px !important;
            object-fit: contain !important;
            border-radius: 6px !important;
        }

        table[border="1"]:last-of-type {
            width: 55% !important;
            margin: 25px 0 25px auto !important;
            border-collapse: collapse !important;
            background: #fffdf9 !important;
            border: 1px solid #e5ded3 !important;
            color: #3f352c !important;
            font-family: 'Work Sans', sans-serif !important;
        }

        table[border="1"]:last-of-type td {
            padding: 14px 16px !important;
            border: 1px solid #e5ded3 !important;
            vertical-align: middle !important;
            font-size: 14px !important;
        }

        table[border="1"]:last-of-type td:first-child {
            font-weight: 500 !important;
        }

        table[border="1"]:last-of-type tr:last-child {
            background: #f1e9dc !important;
        }

        #Button1 {
            display: inline-block !important;
            padding: 13px 32px !important;
            border: none !important;
            border-radius: 6px !important;
            background: #6b513b !important;
            color: #ffffff !important;
            font-family: 'Work Sans', sans-serif !important;
            font-size: 15px !important;
            font-weight: 600 !important;
            cursor: pointer !important;
            transition: background 0.2s ease !important;
        }

        #Button1:hover {
            background: #4d3929 !important;
        }

        @media screen and (max-width: 768px) {
            table[border="1"]:first-of-type,
            table[border="1"]:first-of-type tbody,
            table[border="1"]:first-of-type tr,
            table[border="1"]:first-of-type td {
                display: block !important;
                width: 100% !important;
                box-sizing: border-box !important;
            }

            table[border="1"]:first-of-type td:first-child {
                border-bottom: none !important;
                background: #fdfaf6 !important;
            }

            #GridView1 {
                display: block !important;
                overflow-x: auto !important;
                white-space: nowrap !important;
            }

            table[border="1"]:last-of-type {
                width: 100% !important;
            }

            #Button1 {
                width: 100% !important;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <svg xmlns="http://www.w3.org/2000/svg" style="display: none">
            <symbol id="icon-chair" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M16 8v24M48 8v40M16 32h32M16 40v16M16 40l-4 8M48 40h4l-2 8" />
            </symbol>
            <symbol id="icon-sofa" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M10 30v14a4 4 0 0 0 4 4h36a4 4 0 0 0 4-4V30" />
                <path d="M10 30v-6a4 4 0 0 1 4-4h4a4 4 0 0 1 4 4v6M42 30v-6a4 4 0 0 1 4-4h4a4 4 0 0 1 4 4v6" />
                <path d="M18 30h28v10H18z" />
                <path d="M10 44v8M54 44v8" />
            </symbol>
            <symbol id="icon-lamp" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M18 14 L46 14 L38 30 L26 30 Z" />
                <path d="M32 30v20M22 56h20" />
                <circle cx="32" cy="8" r="3" />
            </symbol>
            <symbol id="icon-table" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M6 18h52l-6 8H12z" />
                <path d="M16 26v28M48 26v28" />
            </symbol>
            <symbol id="icon-bed" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M8 34v20M8 34a4 4 0 0 1 4-4h40a4 4 0 0 1 4 4v6H8z" />
                <path d="M12 30V18a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v6M31 24v-6a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v12" />
                <path d="M56 40v14" />
            </symbol>
            <symbol id="icon-cart" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M8 10h6l6 30h28l6-20H18" />
                <circle cx="24" cy="50" r="3" />
                <circle cx="44" cy="50" r="3" />
            </symbol>
            <symbol id="icon-user" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <circle cx="32" cy="22" r="10" />
                <path d="M12 54c2-12 12-18 20-18s18 6 20 18" />
            </symbol>
            <symbol id="icon-menu" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round">
                <path d="M3 6h18M3 12h18M3 18h18" />
            </symbol>
            <symbol id="icon-close" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round">
                <path d="M5 5l14 14M19 5L5 19" />
            </symbol>
            <symbol id="icon-search" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round">
                <circle cx="10.5" cy="10.5" r="6.5" />
                <path d="M20 20l-5-5" />
            </symbol>
            <symbol id="icon-leaf" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M14 50C10 30 24 12 50 12c2 26-16 38-36 38z" />
                <path d="M14 50c6-10 16-20 30-30" />
            </symbol>
            <symbol id="icon-truck" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M4 16h30v26H4zM34 26h14l10 8v8H34z" />
                <circle cx="16" cy="46" r="4" />
                <circle cx="46" cy="46" r="4" />
            </symbol>
            <symbol id="icon-shield" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M32 6l22 8v16c0 16-10 26-22 28C20 56 10 46 10 30V14z" />
                <path d="M22 32l7 7 13-14" />
            </symbol>
            <symbol id="icon-swatch" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <rect x="8" y="8" width="20" height="20" rx="2" />
                <rect x="36" y="8" width="20" height="20" rx="2" />
                <rect x="8" y="36" width="20" height="20" rx="2" />
                <rect x="36" y="36" width="20" height="20" rx="2" />
            </symbol>
            <symbol id="icon-check" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                <circle cx="32" cy="32" r="26" />
                <path d="M20 33l8 8 16-18" />
            </symbol>
            <symbol id="icon-box" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M8 20l24-10 24 10-24 10z" />
                <path d="M8 20v26l24 10V30M56 20v26l-24 10" />
            </symbol>
            <symbol id="icon-hand" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M20 30V14a4 4 0 0 1 8 0v14M28 28V10a4 4 0 0 1 8 0v18M36 28V14a4 4 0 0 1 8 0v20" />
                <path d="M44 30v-8a4 4 0 0 1 8 0v20c0 10-8 18-18 18h-4c-8 0-12-4-16-10l-8-14a4 4 0 0 1 7-4l5 7" />
            </symbol>
        </svg>

        <header class="site-header">
            <div class="container header-row">
                <a href="index.aspx" class="logo">
                    <svg>
                        <use href="#icon-swatch" />
                    </svg>
                    MyHome Interiors</a>
                <nav class="main-nav">
                    <a href="index.aspx">Home</a>
                    <a href="catalog.aspx">Catalog</a>
                    <a href="about.aspx">About</a>
                    <a href="login.aspx">Login</a>
                    <a href="profile.aspx">Profile</a>
                </nav>
                <div class="header-actions">
                    <button type="button" class="icon-btn" aria-label="Search">
                        <svg>
                            <use href="#icon-search" />
                        </svg></button>
                    <a class="icon-btn" href="cart.aspx" aria-label="Cart">
                        <svg>
                            <use href="#icon-cart" />
                        </svg><span class="cart-count">0</span></a>
                    <a class="icon-btn" href="login.aspx" aria-label="Account">
                        <svg>
                            <use href="#icon-user" />
                        </svg></a>
                    <button type="button" class="nav-toggle icon-btn" aria-label="Menu">
                        <svg>
                            <use href="#icon-menu" />
                        </svg></button>
                </div>
            </div>
        </header>

        <main class="container section">
            <span class="eyebrow">Step 2 of 3</span>
            <h1 style="margin-bottom: 1rem">Order Confirmation</h1>
            <div class="step-track">
                <span class="step">Cart</span>
                <span>—</span>
                <span class="step active">Payment &amp; Delivery</span>
                <span>—</span>
                <span class="step">Confirmation</span>
            </div>

            <table border="1" cellpadding="10"
                cellspacing="0" width="100%">

                <tr>
                    <td colspan="2">
                        <h3>Order Information</h3>
                    </td>
                </tr>

                <tr>
                    <td>Order No:</td>
                    <td>
                        <asp:Label ID="lblOrderNo" runat="server"
                            Text="Generated after confirmation">
                        </asp:Label>
                    </td>
                </tr>

                <tr>
                    <td>Order Date:</td>
                    <td>
                        <asp:Label ID="lblOrderDate" runat="server"
                            Text="Generated after confirmation">
                        </asp:Label>
                    </td>
                </tr>

                <tr>
                    <td>Customer Name:</td>
                    <td>
                        <asp:Label ID="lblCustomerName" runat="server"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td>Email:</td>
                    <td>
                        <asp:Label ID="lblCustomerEmail" runat="server"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td>Mobile:</td>
                    <td>
                        <asp:Label ID="lblCustomerMobile" runat="server"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td>Delivery Address:</td>
                    <td>
                        <asp:Label ID="lblCustomerAddress" runat="server"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td>Payment Method:</td>
                    <td>
                        <asp:Label ID="lblPaymentMethod" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>

            <h2 style="margin-top: 2rem">Product Details</h2>

            <asp:GridView ID="GridView1" runat="server"
                AutoGenerateColumns="False"
                Width="100%"
                EmptyDataText="No products found" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">

                <Columns>

                    <asp:ImageField
                        DataImageUrlField="Product_Image"
                        HeaderText="Product Image">
                        <ControlStyle Width="70px" Height="70px" />
                    </asp:ImageField>

                    <asp:BoundField DataField="Product_Name"
                        HeaderText="Product Name" />

                    <asp:BoundField DataField="Price"
                        HeaderText="Price"
                        DataFormatString="₹{0:N2}" />

                    <asp:BoundField DataField="Quantity"
                        HeaderText="Quantity" />

                    <asp:BoundField DataField="Line_Total"
                        HeaderText="Total"
                        DataFormatString="₹{0:N2}" />

                </Columns>
            </asp:GridView>

            <table border="1" cellpadding="10" cellspacing="0"
                width="100%" style="margin-top: 20px">

                <tr>
                    <td>Sub Total:</td>
                    <td>₹<asp:Label ID="lblSubTotal" runat="server"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td>Delivery Charges:</td>
                    <td>₹<asp:Label ID="lblDelivery" runat="server"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td><b>Total Amount:</b></td>
                    <td>
                        <b>₹<asp:Label ID="lblTotalAmount" runat="server"></asp:Label></b>
                    </td>
                </tr>
            </table>

            <center style="margin-top: 2rem">

                <asp:Button ID="Button1" runat="server" Text="Place Orderd" OnClick="Button1_Click" />

            </center>

        </main>

        <footer class="site-footer">
            <div class="container">
                <div class="footer-grid">
                    <div>
                        <div class="logo" style="margin-bottom: 0.75rem">
                            <svg style="width: 24px; height: 24px">
                                <use href="#icon-swatch" />
                            </svg>
                            MyHome Interiors</div>
                        <p>Furniture designed for how people actually live, made from materials that get better with age.</p>
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