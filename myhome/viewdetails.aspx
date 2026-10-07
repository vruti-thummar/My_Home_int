<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewdetails.aspx.cs" Inherits="myhome.viewdetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            background: #f6f1e8;
            color: #241f1b;
            font-family: Arial, sans-serif;
            overflow-x: hidden;
        }

        .site-header {
            height: 72px;
            border-bottom: 1px solid #ddd4c8;
            background: #f6f1e8;
            display: flex;
            align-items: center;
        }

        .header-inner {
            width: 80%;
            margin: auto;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .logo {
            font-family: Georgia, serif;
            font-size: 27px;
            font-weight: bold;
            color: #241f1b;
            text-decoration: none;
        }

        .nav-menu {
            display: flex;
            gap: 35px;
        }

        .nav-menu a {
            color: #625b54;
            text-decoration: none;
            font-size: 16px;
        }

        .nav-menu a:hover {
            color: #241f1b;
        }

        .details-container {
    width: 100%;
    margin: 70px 0 100px 0;
}

        .details-title {
            text-align: center;
            margin-bottom: 50px;
        }

        .details-title span {
            color: #4f6248;
            font-size: 13px;
            letter-spacing: 4px;
            font-weight: bold;
        }

        .details-title h1 {
            font-family: Georgia, serif;
            font-size: 46px;
            margin: 12px 0;
        }

        .details-box {
    display: flex;
    gap: 0;
    background: #fbf8f2;
    padding: 80px;
    width: 100%;
}

        .details-image {
    width: 50%;
    min-width: 0;
    height:50%;
}

.details-info {
    width: 50%;
    min-width: 0;
    padding: 70px 100px;
}
.details-image img {
    width: 100%;
    height: 700px;
    object-fit: cover;
    display: block;
}

        .details-category {
            color: #4f6248;
            font-size: 13px;
            letter-spacing: 3px;
            text-transform: uppercase;
            margin-bottom: 15px;
        }

        .details-info h2 {
            font-family: Georgia, serif;
            font-size: 38px;
            margin: 0 0 20px 0;
        }

        .details-price {
            font-size: 25px;
            font-weight: bold;
            margin-bottom: 25px;
        }

        .details-description {
            color: #706962;
            font-size: 16px;
            line-height: 1.8;
            margin-bottom: 30px;
        }

        .detail-row {
            padding: 15px 0;
            border-bottom: 1px solid #ddd4c8;
            font-size: 16px;
        }

        .detail-row b {
            display: inline-block;
            width: 130px;
            color: #241f1b;
        }


        /* COLOR OPTIONS */

        .color-section {
            margin-top: 25px;
            padding: 20px 0 5px 0;
        }

        .color-title {
            margin-bottom: 18px;
        }

        .color-title span {
            color: #4f6248;
            font-size: 12px;
            letter-spacing: 3px;
            font-weight: bold;
        }

        .color-title h2 {
            font-family: Georgia, serif;
            font-size: 25px;
            margin: 8px 0 0 0;
        }

        .color-options {
            display: flex;
            gap: 22px;
            align-items: center;
        }

        .color-item {
            text-align: center;
        }

        .color-circle {
            display: block;
            width: 35px;
            height: 35px;
            border-radius: 50%;
            border: 2px solid #d6cec3;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .color-circle:hover {
            transform: scale(1.15);
            border-color: #4f6248;
        }

        .color-item p {
            margin: 7px 0 0 0;
            color: #625b54;
            font-size: 12px;
        }


        .back-btn {
            display: inline-block;
            margin-top: 25px;
            padding: 13px 28px;
            background: #241f1b;
            color: white;
            text-decoration: none;
            width: 200px;
        } 
 
        .back-btn:hover { 
            background: #4f6248; 
            color: white; 
        } 
        .back-btn1 
        { 
 display: inline-block; 
 margin-top: 25px; 
 padding: 13px 28px; 
 background: #241f1b; 
 color: white; 
 text-decoration: none; 
 width:200px; 
 font-size:medium;
        } 
        .back-btn1:hover { 
    background: #4f6248; 
    color: white; 
} 
        /* PREMIUM SECTION BELOW PRODUCT BOX */

        .below-product {
            margin-top: 55px;
            padding: 50px;
            background: #fbf8f2;
            border: 1px solid #e1d9cf;
        }

        .below-title {
            text-align: center;
            margin-bottom: 38px;
        }

        .below-title span {
            color: #4f6248;
            font-size: 12px;
            letter-spacing: 4px;
            font-weight: bold;
        }

        .below-title h2 {
            font-family: Georgia, serif;
            font-size: 34px;
            margin: 12px 0 0 0;
            color: #241f1b;
        }

        .feature-boxes {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 22px;
        }

        .feature-card {
            background: #f6f1e8;
            padding: 30px 22px;
            text-align: center;
            border: 1px solid #e1d9cf;
            transition: all 0.3s ease;
        }

        .feature-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 12px 28px rgba(36, 31, 27, 0.10);
        }

        .feature-icon {
            font-size: 30px;
            margin-bottom: 12px;
            color: #4f6248;
        }

        .feature-card h3 {
            font-family: Georgia, serif;
            font-size: 21px;
            margin: 8px 0 12px 0;
        }

        .feature-card p {
            color: #706962;
            font-size: 14px;
            line-height: 1.7;
            margin: 0;
        }

        .review-mini {
            margin-top: 35px;
            padding: 28px;
            background: #241f1b;
            color: white;
            text-align: center;
        }

        .review-mini .stars {
            color: #d49b32;
            font-size: 21px;
            letter-spacing: 4px;
        }

        .review-mini p {
            margin: 12px 0 0 0;
            color: #eee6dc;
            font-size: 15px;
        }


        /* CUSTOMER REVIEWS */

        /* CUSTOMER REVIEWS */

.review-section {
    margin-top: 45px;
    padding: 55px 0;
    border-top: 1px solid #ddd4c8;
}

.review-title {
    text-align: center;
    margin-bottom: 35px;
}

.review-title span {
    color: #4f6248;
    font-size: 12px;
    letter-spacing: 4px;
    font-weight: bold;
}

.review-title h2 {
    font-family: Georgia, serif;
    font-size: 34px;
    margin: 10px 0 0 0;
    color: #241f1b;
}


/* RATING BOX */

.review-summary {
    width: 650px;
    max-width: 100%;
    margin: 0 auto 35px auto;
    padding: 28px 35px;
    background: #fbf8f2;
    border: 1px solid #e1d9cf;
    box-sizing: border-box;
}

.review-rating {
    text-align: center;
    margin-bottom: 22px;
}

.review-rating strong {
    display: block;
    font-family: Georgia, serif;
    font-size: 44px;
    color: #241f1b;
}

.review-rating p {
    margin: 8px 0 0 0;
    color: #77716b;
    font-size: 13px;
}

.review-stars {
    color: #d49b32;
    letter-spacing: 4px;
    font-size: 18px;
    margin: 8px 0;
}


/* RATING BAR */

.review-line {
    display: flex;
    align-items: center;
    gap: 12px;
    margin: 12px 0;
    color: #625b54;
    font-size: 13px;
}

.review-line span {
    width: 35px;
}

.review-bar {
    flex: 1;
    height: 8px;
    background: #e2ddd5;
    border-radius: 10px;
    overflow: hidden;
}

.review-fill {
    height: 100%;
    background: #4f6248;
    border-radius: 10px;
}


/* REVIEW CARDS */

.reviews {
    width: 100%;
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 22px;
    margin-top: 30px;
}

.review-card {
    min-height: 190px;
    background: #fbf8f2;
    padding: 25px;
    border: 1px solid #e1d9cf;
    box-sizing: border-box;
    transition: all 0.3s ease;

}

.review-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 22px rgba(36,31,27,0.08);
}

.review-card .review-stars {
    margin: 0 0 12px 0;
    font-size: 16px;
}

.review-card h3 {
    font-family: Georgia, serif;
    font-size: 19px;
    margin: 0 0 10px 0;
    color: #241f1b;
}

.review-card p {
    color: #706962;
    font-size: 14px;
    line-height: 1.7;
    margin: 0;
}


/* MOBILE */

@media (max-width: 768px) {

    .review-section {
        padding: 40px 0;
    }

    .review-summary {
        width: 100%;
        padding: 25px 20px;
    }

    .reviews {
        grid-template-columns: 1fr;
        gap: 15px;
    }

    .review-card {
        min-height: auto;
         padding: 80px;
    }
}


        /* FOOTER */

        .site-footer {
            background: #241f1b;
            color: #eee6dc;
            padding: 55px 0 25px 0;
        }

        .footer-inner {
            width: 80%;
            margin: auto;
            display: flex;
            justify-content: space-between;
            gap: 50px;
        }

        .footer-column {
            width: 33%;
        }

        .footer-column h3 {
            font-family: Georgia, serif;
            font-size: 23px;
            margin-top: 0;
        }

        .footer-column p {
            color: #cfc6bb;
            line-height: 1.7;
        }

        .footer-column a {
            display: block;
            color: #cfc6bb;
            text-decoration: none;
            margin: 10px 0;
        }

        .footer-column a:hover {
            color: white;
        }

        .footer-bottom {
            width: 80%;
            margin: 35px auto 0 auto;
            padding-top: 20px;
            border-top: 1px solid #4b4540;
            text-align: center;
            color: #aaa198;
            font-size: 13px;
        }


        @media (max-width: 768px) {

            .nav-menu {
                display: none;
            }

            .details-box {
                flex-direction: column;
            }

            .details-image,
            .details-info {
                width: 100%;
            }

            .feature-boxes {
                grid-template-columns: 1fr;
            }

            .reviews {
                grid-template-columns: 1fr;
            }

            .color-options {
                flex-wrap: wrap;
            }

            .footer-inner {
                flex-direction: column;
            }

            .footer-column {
                width: 100%;
            }
        }

    </style>

    <title>View Product - MyHome Interiors</title>

</head>

<body>

<form id="form1" runat="server">

    <!-- HEADER -->

    <header class="site-header">

        <div class="header-inner">

            <a href="index.aspx" class="logo">
                MyHome Interiors
            </a>

            <nav class="nav-menu">

                <a href="index.aspx">Home</a>
                <a href="catalog.aspx">Catalog</a>
                <a href="about.aspx">About</a>
                <a href="login.aspx">Login</a>
                <a href="profile.aspx">Profile</a>

            </nav>

        </div>

    </header>


    <!-- PRODUCT DETAILS -->

    <div class="details-container">

        <div class="details-title">

            <span>PRODUCT DETAILS</span>

            <h1>View Product</h1>

        </div>


<asp:DataList ID="DataList1" runat="server"
    RepeatDirection="Horizontal"
    Width="100%"
    OnSelectedIndexChanged="DataList1_SelectedIndexChanged"
    OnItemCommand="DataList1_ItemCommand">
            <ItemTemplate>

                <div class="details-box">

                    <div class="details-image">

                        <asp:Image ID="Image1"
                            runat="server"
                            ImageUrl='<%# Eval("Product_Image") %>' />

                    </div>


                    <div class="details-info">

                        <div class="details-category">
                            <%# Eval("Category") %>
                        </div>


                        <h2>
                            <%# Eval("Product_Name") %>
                        </h2>


                        <div class="details-price">
                            ₹<%# Eval("Price", "{0:0.00}") %></div>


                        <p class="details-description">
                            <%# Eval("Description") %>
                        </p>


                        <div class="detail-row">

                            <b>Product ID</b>

                            <%# Eval("Product_Id") %>

                        </div>


                        <div class="detail-row">

                            <b>Category</b>

                            <%# Eval("Category") %>

                        </div>


                        <!-- COLOR OPTIONS -->

                        <div class="color-section">

                            <div class="color-title">

                                <span>AVAILABLE COLORS</span>

                                <h2>Choose Your Color</h2>

                            </div>


                            <div class="color-options">

                                <div class="color-item">

                                    <span class="color-circle"
                                        style="background:#e8dfd0;">
                                    </span>

                                    <p>Beige</p>

                                </div>


                                <div class="color-item">

                                    <span class="color-circle"
                                        style="background:#8b6f58;">
                                    </span>

                                    <p>Brown</p>

                                </div>


                                <div class="color-item">

                                    <span class="color-circle"
                                        style="background:#d8d1c5;">
                                    </span>

                                    <p>Cream</p>

                                </div>


                                <div class="color-item">

                                    <span class="color-circle"
                                        style="background:#4f5148;">
                                    </span>

                                    <p>Olive</p>

                                </div>


                                <div class="color-item">

                                    <span class="color-circle"
                                        style="background:#2f2c29;">
                                    </span>

                                    <p>Black</p>

                                </div>

                            </div>

                        </div>


                        <a href="catalog.aspx" class="back-btn">
                            ← Back to Catalog
                        </a>

                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Button ID="Button1" runat="server"
    CssClass="back-btn1"
    Text="Add to Cart"
    CommandName="AddToCart"
    CommandArgument='<%# Eval("Product_Id") %>' />
                    </div>

                </div>

            </ItemTemplate>

        </asp:DataList>



        <!-- PREMIUM SECTION BELOW PRODUCT BOX -->

        <div class="below-product">

            <div class="below-title">

                <span>WHY CHOOSE THIS PRODUCTan>WHY CHOOSE THIS PRODUCT</span>

                <h2>Designed for Beautiful Living</h2>

            </div>


            <div class="feature-boxes">

                <div class="feature-card">

                    <div class="feature-icon">
                        ✦
                    </div>

                    <h3>Premium Quality</h3>

                    <p>
                        Carefully crafted with high-quality
                        materials for long-lasting comfort.
                    </p>

                </div>


                <div class="feature-card">

                    <div class="feature-icon">
                        ⌂
                    </div>

                    <h3>Elegant Design</h3>

                    <p>
                        A timeless design that adds beauty
                        and style to your home.
                    </p>

                </div>


                <div class="feature-card">

                    <div class="feature-icon">
                        ✓
                    </div>

                    <h3>Made for Comfort</h3>

                    <p>
                        Designed to give you a comfortable
                        and relaxing everyday experience.
                    </p>

                </div>

            </div>


            <div class="review-mini">

                <div class="stars">
                    ★★★★★
                </div>

                <p>
                    “Beautiful design, excellent quality and very comfortable.”
                </p>

            </div>

        </div>



        <!-- CUSTOMER REVIEWS -->

        <div class="review-section">

            <div class="review-title">

                <span>CUSTOMER REVIEWS</span>

                <h2>What Our Customers Say</h2>

            </div>


            <div class="review-summary">

                <div class="review-rating">

                    <strong>4.8</strong>

                    <div class="review-stars">
                        ★★★★★
                    </div>

                    <p>
                        Based on 24 reviews
                    </p>

                </div>


                <div class="review-line">

                    <span>5 ★</span>

                    <div class="review-bar">

                        <div class="review-fill"
                            style="width:90%;">
                        </div>

                    </div>

                </div>


                <div class="review-line">

                    <span>4 ★</span>

                    <div class="review-bar">

                        <div class="review-fill"
                            style="width:65%;">
                        </div>

                    </div>

                </div>

            </div>


            <div class="reviews">

                <div class="review-card">

                    <div class="review-stars">
                        ★★★★★
                    </div>

                    <h3>Priya Patel</h3>

                    <p>
                        Beautiful furniture and very comfortable.
                        The quality is excellent and the design
                        looks perfect in my living room.
                    </p>

                </div>


                <div class="review-card">

                    <div class="review-stars">
                        ★★★★★
                    </div>

                    <h3>Rahul Shah</h3>

                    <p>
                        Really happy with the product.
                        The finishing is beautiful and the product
                        looks exactly like the pictures.
                    </p>

                </div>


                <div class="review-card">

                    <div class="review-stars">
                        ★★★★☆
                    </div>

                    <h3>Neha Patel</h3>

                    <p>
                        Good quality product with a stylish design.
                        It is comfortable and looks great at home.
                    </p>

                </div>

            </div>

        </div>

    </div>



    <!-- FOOTER -->

    <footer class="site-footer">

        <div class="footer-inner">

            <div class="footer-column">

                <h3>
                    MyHome Interiors
                </h3>

                <p>
                    Beautiful furniture for comfortable
                    and stylish living spaces.
                </p>

            </div>


            <div class="footer-column">

                <h3>
                    Quick Links
                </h3>

                <a href="index.aspx">Home</a>
                <a href="catalog.aspx">Catalog</a>
                <a href="about.aspx">About</a>
                <a href="login.aspx">Login</a>

            </div>


            <div class="footer-column">

                <h3>
                    Contact
                </h3>

                <p>
                    Email: info@myhome.com
                </p>

                <p>
                    Phone: +91 98765 43210
                </p>

            </div>

        </div>


        <div class="footer-bottom">

            © 2026 MyHome Interiors. All Rights Reserved.

        </div>

    </footer>

</form>

</body>
</html>