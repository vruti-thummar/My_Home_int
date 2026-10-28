<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="catalog.aspx.cs" Inherits="myhome.catalog" %>


<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catalog — MyHome Interiors</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,500;9..144,600&family=Work+Sans:wght@400;500;600;700&family=Space+Mono&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">

    <style>
        .product-viewdetails a {
            color: #241f1b;
            font-size: 16px;
            font-weight: 500;
            text-decoration: none;
            transition: color 0.2s ease;
        }

            .product-viewdetails a:hover {
                color: #4f6248;
                text-decoration: underline;
            }

        .category-menu {
            width: 100%;
            text-align: center;
            margin: 10px 0 30px 0;
            padding: 10px;
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 10px;
        }

        .category-link {
            display: inline-block;
            color: #4f6248;
            font-size: 15px;
            font-weight: 500;
            letter-spacing: 0.5px;
            text-decoration: none;
            padding: 8px 22px;
            border: 1px solid #4f6248;
            border-radius: 30px;
            background: transparent;
            transition: all 0.25s ease;
            cursor: pointer;
        }

            .category-link:hover {
                color: #ffffff;
                background: #4f6248;
                text-decoration: none;
                transform: translateY(-2px);
                box-shadow: 0 4px 12px rgba(79, 98, 72, 0.25);
            }

            .category-link:active {
                transform: translateY(0);
            }

        .catalog-heading {
            text-align: center;
            margin: 20px auto 10px auto;
            max-width: 750px;
        }

            .catalog-heading .eyebrow {
                display: inline-block;
                color: #4f6248;
                font-size: 13px;
                font-weight: 600;
                letter-spacing: 4px;
                text-transform: uppercase;
                margin-bottom: 10px;
            }

            .catalog-heading h1 {
                margin: 0;
                color: #241f1b;
                font-size: 42px;
                font-weight: 600;
                letter-spacing: -1px;
            }

                .catalog-heading h1::after {
                    content: "";
                    display: block;
                    width: 55px;
                    height: 3px;
                    background: #4f6248;
                    margin: 14px auto 16px auto;
                    border-radius: 10px;
                }

            .catalog-heading p {
                max-width: 600px;
                margin: auto;
                color: #77706a;
                font-size: 16px;
                line-height: 1.6;
            }

        .product-card {
            background: #ffffff;
            border-radius: 8px;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            height: 100%;
        }

        .product-image {
            width: 100%;
            height: 320px;
            overflow: hidden;
            border-radius: 6px;
            background-color: #f7f7f7;
        }

            .product-image img {
                width: 100% !important;
                height: 100% !important;
                object-fit: cover;
                display: block;
                transition: transform 0.3s ease;
            }

                .product-image img:hover {
                    transform: scale(1.03);
                }

        .product-info {
            padding: 16px 8px;
            display: flex;
            flex-direction: column;
            flex-grow: 1;
        }

            .product-info .eyebrow {
                color: #8c857b;
                font-size: 12px;
                text-transform: uppercase;
                letter-spacing: 1px;
                margin-bottom: 4px;
            }

            .product-info h3 {
                margin: 0 0 8px 0;
                font-size: 20px;
                color: #241f1b;
            }

        .product-price {
            font-size: 18px;
            font-weight: 600;
            color: #4f6248;
            margin-bottom: 8px;
        }

        .product-description {
            font-size: 14px;
            color: #666;
            line-height: 1.5;
            margin-bottom: 12px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- SVG Icons -->
        <svg xmlns="http://www.w3.org/2000/svg" style="display: none">
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
            <symbol id="icon-search" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round">
                <circle cx="10.5" cy="10.5" r="6.5" />
                <path d="M20 20l-5-5" />
            </symbol>
            <symbol id="icon-swatch" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <rect x="8" y="8" width="20" height="20" rx="2" />
                <rect x="36" y="8" width="20" height="20" rx="2" />
                <rect x="8" y="36" width="20" height="20" rx="2" />
                <rect x="36" y="36" width="20" height="20" rx="2" />
            </symbol>
        </svg>

        <!-- Site Header -->
        <header class="site-header">
            <div class="container header-row">
                <a href="index.aspx" class="logo">
                    <svg>
                        <use href="#icon-swatch" />
                    </svg>
                    MyHome Interiors
                </a>
                <nav class="main-nav">
                    <a href="index.aspx">Home</a>
                    <a href="catalog.aspx" class="active">Catalog</a>
                    <a href="about.aspx">About</a>
                    <a href="login.aspx">Login</a>
                    <a href="profile.aspx">Profile</a>
                </nav>
                <div class="header-actions">
                    <button type="button" class="icon-btn" aria-label="Search">
                        <svg>
                            <use href="#icon-search" />
                        </svg>
                    </button>
                    <a class="icon-btn" href="cart.aspx" aria-label="Cart">
                        <svg>
                            <use href="#icon-cart" />
                        </svg>
                        <span class="cart-count">0</span>
                    </a>
                    <a class="icon-btn" href="login.aspx" aria-label="Account">
                        <svg>
                            <use href="#icon-user" />
                        </svg>
                    </a>
                    <button type="button" class="nav-toggle icon-btn" aria-label="Menu">
                        <svg>
                            <use href="#icon-menu" />
                        </svg>
                    </button>
                </div>
            </div>
        </header>

        <!-- Heading Section -->
        <main class="container">
            <div class="catalog-heading">
                <span class="eyebrow">Shop</span>
                <h1>Furniture Catalog</h1>
                <p>Browse every piece in the current collection. Select a category below to filter.</p>
            </div>

            <!-- Category Filters -->
            <!-- Category Filters -->
            <div class="category-menu">
                <a href="catalog.aspx" class="category-link">All</a>
                <a href="catalog.aspx?cat=1" class="category-link">Sofa</a>
                <a href="catalog.aspx?cat=2" class="category-link">Bedroom</a>
                <a href="catalog.aspx?cat=3" class="category-link">Dining Table</a>
                <a href="catalog.aspx?cat=4" class="category-link">Swing</a>
                <a href="catalog.aspx?cat=5" class="category-link">Chandelier</a>
            </div>
            <!-- Product Grid -->
            <asp:DataList ID="DataList1" runat="server"
                RepeatDirection="Horizontal"
                RepeatColumns="3"
                RepeatLayout="Table"
                CellPadding="10"
                CellSpacing="15"
                Width="100%"
                OnItemCommand="DataList1_ItemCommand">

                <ItemStyle VerticalAlign="Top" Width="33.33%" />

                <ItemTemplate>
                    <div class="product-card">
                        <div class="product-image">
                            <asp:Image ID="Image1" runat="server"
                                AlternateText='<%# Eval("Product_Name") %>'
                                ImageUrl='<%# Eval("Product_Image") %>' />
                        </div>

                        <div class="product-info">
                            <div class="eyebrow"><%# Eval("Category") %></div>
                            <h3><%# Eval("Product_Name") %></h3>
                            <div class="product-price">₹<%# Eval("Price", "{0:0.00}") %></div>
                            <p class="product-description"><%# Eval("Description") %></p>

                            <p class="product-viewdetails">
                                <asp:HyperLink ID="HyperLink1" runat="server"
                                    NavigateUrl='<%# "viewdetails.aspx?pid=" + Eval("Product_Id") %>'>
                                    View Details
                                </asp:HyperLink>
                            </p>

                            <asp:Button ID="btnAddCart" runat="server"
                                Text="Add to Cart"
                                CssClass="btn btn-primary"
                                CommandName="AddToCart"
                                CommandArgument='<%# Eval("Product_Id") %>' />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </main>

        <!-- Footer -->
        <footer class="site-footer">
            <div class="container">
                <div class="footer-grid">
                    <div>
                        <div class="logo" style="margin-bottom: 0.75rem">
                            <svg style="width: 24px; height: 24px">
                                <use href="#icon-swatch" />
                            </svg>
                            MyHome Interiors
                        </div>
                        <p>Furniture designed for how people actually live, made from materials that get better with age.</p>
                    </div>
                    <div>
                        <h4>Shop</h4>
                        <ul>
                            <li><a href="catalog.aspx">All furniture</a></li>
                            <li><a href="catalog.aspx?cat=1">Sofas</a></li>
                            <li><a href="catalog.aspx?cat=3">Tables</a></li>
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
    </form>
</body>
</html>
