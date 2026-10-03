<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="myhome.profile" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Profile — MyHome Interiors</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,500;9..144,600&family=Work+Sans:wght@400;500;600;700&family=Space+Mono&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
    <form id="form1" runat="server">

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


<header class="site-header">
  <div class="container header-row">
    <a href="index.aspx" class="logo"><svg><use href="#icon-swatch"/></svg> MyHome Interiors</a>
    <nav class="main-nav">
      <a href="index.aspx">Home</a>
      <a href="catalog.aspx">Catalog</a>
      <a href="about.aspx">About</a>
      <a href="login.aspx">Login</a>
      <a href="profile.aspx" class="active">Profile</a>
    </nav>
    <div class="header-actions">
      <button type="button" class="icon-btn" aria-label="Search"><svg><use href="#icon-search"/></svg></button>
      <a class="icon-btn" href="cart.aspx" aria-label="Cart"><svg><use href="#icon-cart"/></svg><span class="cart-count">0</span></a>
      <a class="icon-btn" href="login.aspx" aria-label="Account"><svg><use href="#icon-user"/></svg></a>
      <button type="button" class="nav-toggle icon-btn" aria-label="Menu"><svg><use href="#icon-menu"/></svg></button>
    </div>
  </div>
</header>


<main class="container section">
  <span class="eyebrow">Account</span>
  <h1 style="margin-bottom:1.5rem">My profile</h1>

  <div class="profile-layout">
    <aside class="profile-card">
      <div class="avatar">YP</div>
      <h3 style="margin-bottom:0.1rem">YUG Patel</h3>
      <p style="font-size:0.85rem; margin:0">Yug.patel@example.com</p>
      <ul class="profile-nav">
        <li><a href="#" class="active" data-tab="details">Account details</a></li>
        <li><a href="#" data-tab="orders">Order history</a></li>
        <li><a href="#" data-tab="addresses">Saved addresses</a></li>
        <li><a href="login.aspx">Sign out</a></li>
      </ul>
    </aside>

    <div>
      <section id="tab-details" class="form-panel wide" style="margin:0">
        <h3>Account details</h3>
        <div id="details-form">
          <div class="field-row">
            <div class="field"><label for="p-first">First name</label><input id="p-first" value="Riya" required></div>
            <div class="field"><label for="p-last">Last name</label><input id="p-last" value="Patel" required></div>
          </div>
          <div class="field"><label for="p-email">Email address</label><input id="p-email" type="email" value="riya.patel@example.com" required></div>
          <div class="field"><label for="p-phone">Phone number</label><input id="p-phone" value="+91 98765 43210"></div>
          <button type="button" class="btn btn-primary">Save changes</button>
        </div>
      </section>

      <section id="tab-orders" class="form-panel wide" style="margin:0; display:none">
        <h3>Order history</h3>
        <div class="order-row"><span>MHI-482913 · 2 items</span><span class="status-pill delivered">Delivered</span></div>
        <div class="order-row"><span>MHI-479220 · 1 item</span><span class="status-pill transit">In transit</span></div>
        <div class="order-row"><span>MHI-471005 · 3 items</span><span class="status-pill delivered">Delivered</span></div>
      </section>

      <section id="tab-addresses" class="form-panel wide" style="margin:0; display:none">
        <h3>Saved addresses</h3>
        <div class="order-row">
          <span>Home — 12 Silver Oak Society, Rajkot, Gujarat</span>
          <button type="button" class="btn-ghost">Edit</button>
        </div>
        <div class="order-row">
          <span>Office — Tower B, Race Course Road, Rajkot</span>
          <button type="button" class="btn-ghost">Edit</button>
        </div>
      </section>
    </div>
  </div>
</main>


<footer class="site-footer">
  <div class="container">
    <div class="footer-grid">
      <div>
        <div class="logo" style="margin-bottom:0.75rem"><svg style="width:24px;height:24px"><use href="#icon-swatch"/></svg> MyHome Interiors</div>
        <p>Furniture designed for how people actually live, made from materials that get better with age.</p>
      </div>
      <div><h4>Shop</h4><ul><li><a href="catalog.aspx">All furniture</a></li><li><a href="catalog.aspx?cat=sofas">Sofas</a></li><li><a href="catalog.aspx?cat=tables">Tables</a></li></ul></div>
      <div><h4>Account</h4><ul><li><a href="login.aspx">Sign in</a></li><li><a href="profile.aspx">My orders</a></li><li><a href="cart.aspx">Cart</a></li></ul></div>
      <div><h4>Company</h4><ul><li><a href="about.aspx">About us</a></li><li><a href="#">Contact</a></li><li><a href="#">Careers</a></li></ul></div>
    </div>
    <div class="footer-bottom">
      <span>© 2026 MyHome Interiors. All rights reserved.</span>
      <span>Rajkot, Gujarat · IN</span>
    </div>
  </div>
</footer>


<script src="js/script.js"></script>
<script src="js/profile.js"></script>

    </form>
</body>
</html>