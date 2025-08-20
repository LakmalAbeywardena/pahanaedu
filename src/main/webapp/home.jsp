   <!DOCTYPE html>
          <html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PahanaEdu - Dashboard</title>
    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        min-height: 100vh;
        color: #333;
      }

      /* Navigation Bar */
      .navbar {
        background: rgba(255, 255, 255, 0.95);
        backdrop-filter: blur(10px);
        padding: 1rem 2rem;
        box-shadow: 0 2px 20px rgba(0, 0, 0, 0.1);
        position: sticky;
        top: 0;
        z-index: 1000;
      }

      .nav-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        max-width: 1200px;
        margin: 0 auto;
      }

      .logo {
        display: flex;
        align-items: center;
        font-size: 1.5rem;
        font-weight: bold;
        color: #667eea;
      }

      .logo-icon {
        width: 40px;
        height: 40px;
        background: linear-gradient(135deg, #667eea, #764ba2);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        margin-right: 10px;
        font-size: 1.2rem;
      }

      .nav-links {
        display: flex;
        list-style: none;
        gap: 2rem;
        align-items: center;
      }

      .nav-links a {
        text-decoration: none;
        color: #333;
        font-weight: 500;
        padding: 0.5rem 1rem;
        border-radius: 20px;
        transition: all 0.3s ease;
        position: relative;
      }

      .nav-links a:hover {
        background: rgba(102, 126, 234, 0.1);
        color: #667eea;
        transform: translateY(-2px);
      }

      .user-info {
        display: flex;
        align-items: center;
        gap: 1rem;
      }

      .user-avatar {
        width: 35px;
        height: 35px;
        background: linear-gradient(135deg, #667eea, #764ba2);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        font-weight: bold;
      }

      .logout-btn {
        background: #ff4757;
        color: white;
        border: none;
        padding: 0.5rem 1rem;
        border-radius: 20px;
        cursor: pointer;
        font-weight: 500;
        transition: all 0.3s ease;
      }

      .logout-btn:hover {
        background: #ff3742;
        transform: translateY(-2px);
      }

      /* Main Content */
      .main-content {
        max-width: 1200px;
        margin: 2rem auto;
        padding: 0 2rem;
      }

      .welcome-section {
        background: rgba(255, 255, 255, 0.95);
        backdrop-filter: blur(10px);
        border-radius: 20px;
        padding: 2rem;
        margin-bottom: 2rem;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        text-align: center;
      }

      .welcome-title {
        font-size: 2.5rem;
        margin-bottom: 0.5rem;
        color: #333;
      }

      .welcome-subtitle {
        font-size: 1.2rem;
        color: #666;
        margin-bottom: 1rem;
      }

      /* Dashboard Cards */
      .dashboard-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 2rem;
        margin-top: 2rem;
      }

      .dashboard-card {
        background: rgba(255, 255, 255, 0.95);
        backdrop-filter: blur(10px);
        border-radius: 20px;
        padding: 2rem;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease;
        text-align: center;
        cursor: pointer;
      }

      .dashboard-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
      }

      .card-icon {
        width: 80px;
        height: 80px;
        margin: 0 auto 1rem;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 2rem;
        color: white;
        margin-bottom: 1.5rem;
      }

      .card-icon.customers {
        background: linear-gradient(135deg, #667eea, #764ba2);
      }

      .card-icon.items {
        background: linear-gradient(135deg, #f093fb, #f5576c);
      }

      .card-icon.bills {
        background: linear-gradient(135deg, #4facfe, #00f2fe);
      }

      .card-title {
        font-size: 1.5rem;
        font-weight: bold;
        margin-bottom: 0.5rem;
        color: #333;
      }

      .card-description {
        color: #666;
        line-height: 1.6;
        margin-bottom: 1.5rem;
      }

      .card-btn {
        display: inline-block;
        padding: 0.75rem 2rem;
        background: linear-gradient(135deg, #667eea, #764ba2);
        color: white;
        text-decoration: none;
        border-radius: 25px;
        font-weight: 500;
        transition: all 0.3s ease;
      }

      .card-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
      }

      /* Stats Section */
      .stats-section {
        background: rgba(255, 255, 255, 0.95);
        backdrop-filter: blur(10px);
        border-radius: 20px;
        padding: 2rem;
        margin: 2rem 0;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      }

      .stats-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 2rem;
        margin-top: 1rem;
      }

      .stat-item {
        text-align: center;
        padding: 1rem;
        background: rgba(102, 126, 234, 0.1);
        border-radius: 15px;
      }

      .stat-number {
        font-size: 2.5rem;
        font-weight: bold;
        color: #667eea;
        margin-bottom: 0.5rem;
      }

      .stat-label {
        color: #666;
        font-weight: 500;
      }

      /* Mobile Responsiveness */
      @media (max-width: 768px) {
        .navbar {
          padding: 1rem;
        }

        .nav-container {
          flex-direction: column;
          gap: 1rem;
        }

        .nav-links {
          flex-direction: column;
          gap: 1rem;
        }

        .main-content {
          padding: 0 1rem;
          margin: 1rem auto;
        }

        .welcome-title {
          font-size: 2rem;
        }

        .dashboard-grid {
          grid-template-columns: 1fr;
          gap: 1rem;
        }

        .dashboard-card {
          padding: 1.5rem;
        }
      }

      /* Animations */
      @keyframes fadeInUp {
        from {
          opacity: 0;
          transform: translateY(30px);
        }
        to {
          opacity: 1;
          transform: translateY(0);
        }
      }

      .dashboard-card {
        animation: fadeInUp 0.6s ease forwards;
      }

      .dashboard-card:nth-child(1) { animation-delay: 0.1s; }
      .dashboard-card:nth-child(2) { animation-delay: 0.2s; }
      .dashboard-card:nth-child(3) { animation-delay: 0.3s; }
    </style>
  </head>
  <body>
  <!-- Navigation Bar -->
  <nav class="navbar">
    <div class="nav-container">
      <div class="logo">
        <div class="logo-icon">PE</div>
        PahanaEdu
      </div>

      <ul class="nav-links">
        <li><a href="home">🏠 Home</a></li>
        <li><a href="CustomerServlet">👥 Customers</a></li>
        <li><a href="ItemServlet">📦 Items</a></li>
        <li><a href="BillServlet">💰 Billing</a></li>
      </ul>

      <div class="user-info">
        <div class="user-avatar">
          <%= ((String) request.getAttribute("username")).substring(0, 1).toUpperCase() %>
        </div>
        <span>Welcome, <%= request.getAttribute("username") %>!</span>
        <form method="post" style="display: inline;">
          <input type="hidden" name="action" value="logout">
          <button type="submit" class="logout-btn">Logout</button>
        </form>
      </div>
    </div>
  </nav>

  <!-- Main Content -->
  <div class="main-content">
    <!-- Welcome Section -->
    <section class="welcome-section">
      <h1 class="welcome-title">Welcome to Your Dashboard</h1>
      <p class="welcome-subtitle">Manage your educational platform efficiently</p>
    </section>

    <!-- Dashboard Cards -->
    <div class="dashboard-grid">
      <div class="dashboard-card" onclick="location.href='CustomerServlet'">
        <div class="card-icon customers">👥</div>
        <h3 class="card-title">Customer Management</h3>
        <p class="card-description">
          Add, edit, and manage customer information.
          Track customer details and their service usage.
        </p>
        <a href="CustomerServlet" class="card-btn">Manage Customers</a>
      </div>

      <div class="dashboard-card" onclick="location.href='ItemServlet'">
        <div class="card-icon items">📦</div>
        <h3 class="card-title">Item Management</h3>
        <p class="card-description">
          Control your inventory. Add new items,
          update pricing, and manage product descriptions.
        </p>
        <a href="ItemServlet" class="card-btn">Manage Items</a>
      </div>

      <div class="dashboard-card" onclick="location.href='BillServlet'">
        <div class="card-icon bills">💰</div>
        <h3 class="card-title">Billing System</h3>
        <p class="card-description">
          Generate bills and calculate charges.
          Handle customer billing efficiently.
        </p>
        <a href="BillServlet" class="card-btn">Generate Bills</a>
      </div>
    </div>

    <!-- Stats Section -->
    <section class="stats-section">
      <h2 style="text-align: center; margin-bottom: 1rem; color: #333;">Quick Stats</h2>
      <div class="stats-grid">
        <div class="stat-item">
          <div class="stat-number">150+</div>
          <div class="stat-label">Total Customers</div>
        </div>
        <div class="stat-item">
          <div class="stat-number">89</div>
          <div class="stat-label">Active Items</div>
        </div>
        <div class="stat-item">
          <div class="stat-number">1,247</div>
          <div class="stat-label">Bills Generated</div>
        </div>
        <div class="stat-item">
          <div class="stat-number">98.5%</div>
          <div class="stat-label">Success Rate</div>
        </div>
      </div>
    </section>
  </div>

  <script>
    // Add smooth scrolling and interactive effects
    document.addEventListener('DOMContentLoaded', function() {
      // Add click effects to cards
      const cards = document.querySelectorAll('.dashboard-card');
      cards.forEach(card => {
        card.addEventListener('mouseenter', function() {
          this.style.transform = 'translateY(-10px) scale(1.02)';
        });

        card.addEventListener('mouseleave', function() {
          this.style.transform = 'translateY(0) scale(1)';
        });
      });

      // Add loading animation to stats
      const statNumbers = document.querySelectorAll('.stat-number');
      statNumbers.forEach(stat => {
        const finalValue = stat.textContent;
        stat.textContent = '0';

        // Simple counter animation
        setTimeout(() => {
          stat.textContent = finalValue;
        }, 500);
      });

      // Mobile menu toggle (if needed)
      const navbar = document.querySelector('.navbar');
      let lastScroll = 0;

      window.addEventListener('scroll', () => {
        const currentScroll = window.pageYOffset;

        if (currentScroll <= 0) {
          navbar.style.boxShadow = '0 2px 20px rgba(0,0,0,0.1)';
          return;
        }

        if (currentScroll > lastScroll && currentScroll > 100) {
          // Scrolling down
          navbar.style.transform = 'translateY(-100%)';
        } else {
          // Scrolling up
          navbar.style.transform = 'translateY(0)';
        }

        lastScroll = currentScroll;
      });
    });

    // Add ripple effect to buttons
    function createRipple(event) {
      const button = event.currentTarget;
      const circle = document.createElement("span");
      const diameter = Math.max(button.clientWidth, button.clientHeight);
      const radius = diameter / 2;

      circle.style.width = circle.style.height = `${diameter}px`;
      circle.style.left = `${event.clientX - button.offsetLeft - radius}px`;
      circle.style.top = `${event.clientY - button.offsetTop - radius}px`;
      circle.classList.add("ripple");

      const ripple = button.getElementsByClassName("ripple")[0];
      if (ripple) {
        ripple.remove();
      }

      button.appendChild(circle);
    }

    // Add ripple effect to all buttons
    document.querySelectorAll('.card-btn, .logout-btn').forEach(btn => {
      btn.addEventListener('click', createRipple);
    });
  </script>

  <style>
    .ripple {
      position: absolute;
      border-radius: 50%;
      transform: scale(0);
      animation: ripple 600ms linear;
      background-color: rgba(255, 255, 255, 0.6);
    }

    @keyframes ripple {
      to {
        transform: scale(4);
        opacity: 0;
      }
    }

    .navbar {
      transition: transform 0.3s ease;
    }
  </style>
  </body>
  </html>