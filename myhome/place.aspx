<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="place.aspx.cs" Inherits="myhome.place" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Order Confirmed — MyHome Interiors</title>
    
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,500;0,600;0,700;1,400&family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="css/style.css" />

    <style type="text/css">
        :root {
            --bg-base: #f7f3ee;
            --bg-card: #ffffff;
            --border-warm: #e8ded2;
            --text-heading: #241e19;
            --text-body: #544b43;
            --text-muted: #8c8074;
            --primary-accent: #b47b48;
            --success-color: #2e6b4f;
        }

        body {
            background-color: var(--bg-base);
            font-family: 'Plus Jakarta Sans', sans-serif;
            color: var(--text-body);
            margin: 0;
            padding: 0;
        }

        .success-wrapper {
            max-width: 620px;
            margin: 60px auto 80px;
            padding: 0 20px;
        }

        .success-card {
            background: var(--bg-card);
            border: 1px solid var(--border-warm);
            border-radius: 16px;
            padding: 48px 40px;
            text-align: center;
            box-shadow: 0 10px 30px rgba(60, 48, 38, 0.05);
        }

        .icon-circle {
            width: 76px;
            height: 76px;
            margin: 0 auto 24px;
            background-color: #eaf5ee;
            border: 2px solid #c7e3d2;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--success-color);
        }

        .icon-circle svg {
            width: 38px;
            height: 38px;
        }

        .success-card h1 {
            font-family: 'Cormorant Garamond', Georgia, serif;
            font-size: 36px;
            font-weight: 600;
            color: var(--text-heading);
            margin: 0 0 10px;
        }

        .success-card p {
            font-size: 15px;
            color: var(--text-muted);
            margin: 0 0 28px;
            line-height: 1.6;
        }

        /* Order Details Box */
        .order-meta-box {
            background: #fffaf5;
            border: 1px solid var(--border-warm);
            border-radius: 12px;
            padding: 20px 24px;
            margin-bottom: 32px;
            text-align: left;
        }

        .meta-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 0;
            border-bottom: 1px dashed var(--border-warm);
            font-size: 14.5px;
        }

        .meta-row:last-child {
            border-bottom: none;
            padding-bottom: 0;
        }

        .meta-row:first-child {
            padding-top: 0;
        }

        .meta-label {
            color: var(--text-muted);
            font-weight: 500;
        }

        .meta-value {
            font-weight: 700;
            color: var(--text-heading);
        }

        /* Action Buttons */
        .btn-group {
            display: flex;
            gap: 14px;
            justify-content: center;
        }

        .btn-secondary {
            flex: 1;
            padding: 13px 20px;
            background-color: #ffffff;
            color: var(--text-body);
            border: 1px solid var(--border-warm);
            border-radius: 8px;
            font-family: inherit;
            font-size: 14px;
            font-weight: 600;
            text-decoration: none;
            text-align: center;
            transition: all 0.2s ease;
        }

        .btn-secondary:hover {
            background-color: #faf7f2;
            color: var(--text-heading);
        }

        .btn-primary {
            flex: 1.2;
            padding: 13px 22px;
            background: linear-gradient(135deg, #b47b48 0%, #9c6838 100%);
            color: #ffffff;
            border: none;
            border-radius: 8px;
            font-family: inherit;
            font-size: 14px;
            font-weight: 600;
            text-decoration: none;
            text-align: center;
            transition: all 0.2s ease;
            box-shadow: 0 4px 14px rgba(180, 123, 72, 0.25);
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #a36e3e 0%, #8b5b2e 100%);
            transform: translateY(-1px);
        }

        @media (max-width: 520px) {
            .success-card {
                padding: 32px 20px;
            }
            .btn-group {
                flex-direction: column-reverse;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <main class="success-wrapper">
            <div class="success-card">
                <div class="icon-circle">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M20 6L9 17l-5-5"></path>
                    </svg>
                </div>

                <h1>Thank you for your order!</h1>
                <p>We've received your request and are preparing your bespoke artisanal furniture piece.</p>

                <div class="order-meta-box">
                    <div class="meta-row">
                        <span class="meta-label">Order Number:</span>
                        <span class="meta-value">#<asp:Label ID="lblOrderId" runat="server" Text="000"></asp:Label></span>
                    </div>
                    <div class="meta-row">
                        <span class="meta-label">Payment Method:</span>
                        <span class="meta-value"><asp:Label ID="lblPayMethod" runat="server" Text="Cash on Delivery"></asp:Label></span>
                    </div>
                    <div class="meta-row">
                        <span class="meta-label">Total Amount Paid:</span>
                        <span class="meta-value" style="color: var(--primary-accent);">₹<asp:Label ID="lblTotal" runat="server" Text="0.00"></asp:Label></span>
                    </div>
                </div>

                <div class="btn-group">
                    <a href="catalog.aspx" class="btn-secondary">Continue Shopping</a>
                    <a href="profile.aspx" class="btn-primary">View My Orders</a>
                </div>
            </div>
        </main>

    </form>
</body>
</html>