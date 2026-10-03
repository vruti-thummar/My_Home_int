<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="myhome.index" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MyHome Interiors — Furniture for a life well-lived</title>
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
      <a href="index.aspx" class="active">Home</a>
      <a href="catalog.aspx">Catalog</a>
      <a href="about.aspx">About</a>
      <a href="login.aspx">Login</a>
      <a href="profile.aspx">Profile</a>
    </nav>
    <div class="header-actions">
      <button type="button" class="icon-btn" aria-label="Search"><svg><use href="#icon-search"/></svg></button>
      <a class="icon-btn" href="cart.aspx" aria-label="Cart"><svg><use href="#icon-cart"/></svg><span class="cart-count">0</span></a>
      <a class="icon-btn" href="login.aspx" aria-label="Account"><svg><use href="#icon-user"/></svg></a>
      <button type="button" class="nav-toggle icon-btn" aria-label="Menu"><svg><use href="#icon-menu"/></svg></button>
    </div>
  </div>
</header>

<main>
  <section class="hero container">
    <div class="hero-copy">
      <span class="eyebrow">New Autumn Collection</span>
      <h1>Furniture that knows the shape of a room.</h1>
      <p class="lede">Hand-finished pieces in solid oak, linen and brass — designed in-house, delivered to your door, built to outlast the trend cycle.</p>
      <div class="hero-actions">
        <a href="catalog.aspx" class="btn btn-primary">Shop the catalog</a>
        <a href="about.aspx" class="btn btn-outline">Our story</a>
      </div>
    </div>
    <div class="hero-art">
      <svg viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round" style="color:var(--ink)"><use href="#icon-sofa"/></svg>
    </div>
  </section>

  <section class="section container">
    <div class="section-head">
      <div>
        <span class="eyebrow">Browse</span>
        <h2>Shop by category</h2>
      </div>
    </div>
    <div class="cat-grid">
      <a class="cat-card" href="catalog.aspx?cat=seating"><svg><use href="#icon-chair"/></svg><span>SEATING</span></a>
      <a class="cat-card" href="catalog.aspx?cat=sofas"><svg><use href="#icon-sofa"/></svg><span>SOFAS</span></a>
      <a class="cat-card" href="catalog.aspx?cat=tables"><svg><use href="#icon-table"/></svg><span>TABLES</span></a>
      <a class="cat-card" href="catalog.aspx?cat=bedroom"><svg><use href="#icon-bed"/></svg><span>BEDROOM</span></a>
      <a class="cat-card" href="catalog.aspx?cat=lighting"><svg><use href="#icon-lamp"/></svg><span>LIGHTING</span></a>
    </div>
  </section>

  <section class="section container">
    <div class="section-head">
      <div>
        <span class="eyebrow">Featured</span>
        <h2>Best-selling pieces</h2>
      </div>
      <a href="catalog.aspx" class="btn-ghost">View full catalog →</a>
    </div>
    <div class="product-grid" id="featured-grid"></div>
  </section>

  <section class="section container">
    <div class="value-grid">
      <div class="value-card"><svg><use href="#icon-hand"/></svg><h3>Hand-finished</h3><p>Every piece is joined and finished by craftspeople, not a conveyor belt.</p></div>
      <div class="value-card"><svg><use href="#icon-truck"/></svg><h3>White-glove delivery</h3><p>We assemble and place the piece exactly where you want it.</p></div>
      <div class="value-card"><svg><use href="#icon-shield"/></svg><h3>10-year warranty</h3><p>Frames and joinery are covered for a decade, no fine print.</p></div>
      <div class="value-card"><svg><use href="#icon-leaf"/></svg><h3>Responsibly sourced</h3><p>FSC-certified timber and low-VOC finishes throughout.</p></div>
    </div>
  </section>
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
<script src="js/products.js"></script>
<script>
  renderProductGrid(document.getElementById('featured-grid'), PRODUCTS.filter(function(p){ return p.featured; }));
</script>

    </form>
</body>
</html>