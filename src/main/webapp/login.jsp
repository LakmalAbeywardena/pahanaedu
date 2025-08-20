<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PahanaEdu - Login</title>
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
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            position: relative;
        }

        .floating-elements {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            overflow: hidden;
        }

        .floating-circle {
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
            animation: float 6s ease-in-out infinite;
        }

        .floating-circle:nth-child(1) {
            width: 100px;
            height: 100px;
            top: 20%;
            left: 10%;
            animation-delay: 0s;
        }

        .floating-circle:nth-child(2) {
            width: 150px;
            height: 150px;
            top: 60%;
            right: 10%;
            animation-delay: 2s;
        }

        .floating-circle:nth-child(3) {
            width: 80px;
            height: 80px;
            bottom: 20%;
            left: 20%;
            animation-delay: 4s;
        }

        .floating-circle:nth-child(4) {
            width: 120px;
            height: 120px;
            top: 10%;
            right: 20%;
            animation-delay: 1s;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
        }

        .login-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(15px);
            border-radius: 25px;
            padding: 50px 40px;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
            position: relative;
            animation: slideIn 0.8s ease-out;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(30px) scale(0.95);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .logo {
            width: 70px;
            height: 70px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            border-radius: 50%;
            margin: 0 auto 25px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 28px;
            font-weight: bold;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        .login-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .login-title {
            color: #333;
            font-size: 2rem;
            margin-bottom: 8px;
            font-weight: 700;
        }

        .login-subtitle {
            color: #666;
            font-size: 1rem;
            line-height: 1.5;
        }

        .form-group {
            margin-bottom: 25px;
            position: relative;
        }

        .form-label {
            display: block;
            color: #555;
            font-weight: 500;
            margin-bottom: 8px;
            font-size: 0.95rem;
        }

        .form-input {
            width: 100%;
            padding: 15px 20px;
            border: 2px solid #e1e8ed;
            border-radius: 15px;
            font-size: 1rem;
            background: rgba(255, 255, 255, 0.9);
            transition: all 0.3s ease;
            outline: none;
        }

        .form-input:focus {
            border-color: #667eea;
            background: white;
            box-shadow: 0 0 20px rgba(102, 126, 234, 0.2);
            transform: translateY(-2px);
        }

        .form-input:focus + .input-icon {
            color: #667eea;
            transform: scale(1.1);
        }

        .input-wrapper {
            position: relative;
        }

        .input-icon {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #aaa;
            font-size: 1.2rem;
            transition: all 0.3s ease;
        }

        .login-btn {
            width: 100%;
            padding: 15px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            border: none;
            border-radius: 15px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            position: relative;
            overflow: hidden;
            margin-bottom: 20px;
        }

        .login-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 35px rgba(102, 126, 234, 0.4);
        }

        .login-btn:active {
            transform: translateY(-1px);
        }

        .error-message {
            background: rgba(255, 71, 87, 0.1);
            color: #ff4757;
            padding: 12px 15px;
            border-radius: 10px;
            border-left: 4px solid #ff4757;
            margin-bottom: 20px;
            font-size: 0.9rem;
            animation: shake 0.5s ease-in-out;
        }

        @keyframes shake {
            0%, 20%, 40%, 60%, 80% { transform: translateX(0); }
            10%, 30%, 50%, 70% { transform: translateX(-5px); }
            15%, 35%, 55%, 75% { transform: translateX(5px); }
        }

        .back-link {
            text-align: center;
            margin-top: 20px;
        }

        .back-link a {
            color: #667eea;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            font-size: 0.95rem;
        }

        .back-link a:hover {
            color: #764ba2;
            text-decoration: underline;
        }

        .remember-me {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 25px;
        }

        .checkbox-wrapper {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .checkbox-wrapper input[type="checkbox"] {
            width: 18px;
            height: 18px;
            accent-color: #667eea;
        }

        .checkbox-wrapper label {
            color: #666;
            font-size: 0.9rem;
            cursor: pointer;
        }

        .forgot-password {
            color: #667eea;
            text-decoration: none;
            font-size: 0.9rem;
            transition: all 0.3s ease;
        }

        .forgot-password:hover {
            color: #764ba2;
            text-decoration: underline;
        }

        /* Loading animation */
        .loading {
            pointer-events: none;
            opacity: 0.7;
        }

        .loading::after {
            content: '';
            position: absolute;
            width: 20px;
            height: 20px;
            border: 2px solid transparent;
            border-top: 2px solid white;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        @keyframes spin {
            0% { transform: translate(-50%, -50%) rotate(0deg); }
            100% { transform: translate(-50%, -50%) rotate(360deg); }
        }

        @media (max-width: 480px) {
            .login-container {
                margin: 20px;
                padding: 40px 30px;
            }

            .login-title {
                font-size: 1.7rem;
            }

            .form-input {
                padding: 12px 15px;
            }

            .login-btn {
                padding: 12px;
            }
        }

        /* Success message animation */
        .success-message {
            background: rgba(46, 204, 113, 0.1);
            color: #2ecc71;
            padding: 12px 15px;
            border-radius: 10px;
            border-left: 4px solid #2ecc71;
            margin-bottom: 20px;
            font-size: 0.9rem;
            animation: slideIn 0.5s ease-out;
        }
    </style>
</head>
<body>
<div class="floating-elements">
    <div class="floating-circle"></div>
    <div class="floating-circle"></div>
    <div class="floating-circle"></div>
    <div class="floating-circle"></div>
</div>

<div class="login-container">
    <div class="logo">PE</div>

    <div class="login-header">
        <h1 class="login-title">Welcome Back</h1>
        <p class="login-subtitle">Sign in to access your dashboard</p>
    </div>



    <form method="post" action="login" id="loginForm">
        <div class="form-group">
            <label for="username" class="form-label">Username</label>
            <div class="input-wrapper">
                <input type="text"
                       id="username"
                       name="username"
                       class="form-input"
                       placeholder="Enter your username"
                       required
                       autocomplete="username">
                <span class="input-icon">👤</span>
            </div>
        </div>

        <div class="form-group">
            <label for="password" class="form-label">Password</label>
            <div class="input-wrapper">
                <input type="password"
                       id="password"
                       name="password"
                       class="form-input"
                       placeholder="Enter your password"
                       required
                       autocomplete="current-password">
                <span class="input-icon" onclick="togglePassword()" style="cursor: pointer;">🔒</span>
            </div>
        </div>

        <div class="form-group">
            <label for="role" class="form-label">Role</label>
            <div class="input-wrapper">
                <select id="role"
                        name="role"
                        class="form-input"
                        required>
                    <option value="">Select your role</option>
                    <option value="admin">👑 Administrator</option>
                    <option value="user">👤 User</option>
                </select>





                <span class="input-icon">🎭</span>
            </div>
        </div>

        <div class="remember-me">
            <div class="checkbox-wrapper">
                <input type="checkbox" id="remember" name="remember">
                <label for="remember">Remember me</label>
            </div>
            <a href="#" class="forgot-password">Forgot Password?</a>
        </div>

        <button type="submit" class="login-btn" id="loginBtn">
            Sign In
        </button>
    </form>

    <div class="back-link">
        <a href="welcome.jsp">← Back to Welcome</a>
    </div>
</div>

<script>
    // Form validation and UX improvements
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.getElementById('loginForm');
        const loginBtn = document.getElementById('loginBtn');
        const inputs = document.querySelectorAll('.form-input');

        // Add focus animations to inputs
        inputs.forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.parentElement.style.transform = 'scale(1.02)';
            });

            input.addEventListener('blur', function() {
                this.parentElement.parentElement.style.transform = 'scale(1)';
            });

            // Real-time validation
            input.addEventListener('input', function() {
                validateField(this);
            });
        });

        // Form submission with loading state
        form.addEventListener('submit', function(e) {
            if (!validateForm()) {
                e.preventDefault();
                return;
            }

            // Add loading state
            loginBtn.classList.add('loading');
            loginBtn.textContent = 'Signing In...';

            // Simulate network delay for better UX
            setTimeout(() => {
                // Form will be submitted normally
            }, 500);
        });

        // Enter key handling
        document.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                form.dispatchEvent(new Event('submit'));
            }
        });
    });

    // Password toggle functionality
    function togglePassword() {
        const passwordInput = document.getElementById('password');
        const icon = passwordInput.nextElementSibling;

        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            icon.textContent = '👁️';
        } else {
            passwordInput.type = 'password';
            icon.textContent = '🔒';
        }
    }

    // Field validation
    function validateField(field) {
        const value = field.value.trim();

        if (field.name === 'username') {
            if (value.length < 3) {
                setFieldError(field, 'Username must be at least 3 characters');
                return false;
            } else {
                clearFieldError(field);
                return true;
            }
        }

        if (field.name === 'password') {
            if (value.length < 4) {
                setFieldError(field, 'Password must be at least 4 characters');
                return false;
            } else {
                clearFieldError(field);
                return true;
            }
        }

        if (field.name === 'role') {
            if (value === '') {
                setFieldError(field, 'Please select a role');
                return false;
            } else {
                clearFieldError(field);
                return true;
            }
        }

        return true;
    }

    // Form validation
    function validateForm() {
        const username = document.getElementById('username');
        const password = document.getElementById('password');
        const role = document.getElementById('role');

        let isValid = true;

        if (!validateField(username)) isValid = false;
        if (!validateField(password)) isValid = false;
        if (!validateField(role)) isValid = false;

        return isValid;
    }

    // Error handling functions
    function setFieldError(field, message) {
        clearFieldError(field);

        field.style.borderColor = '#ff4757';
        field.style.background = 'rgba(255, 71, 87, 0.05)';

        const errorDiv = document.createElement('div');
        errorDiv.className = 'field-error';
        errorDiv.style.cssText = 'color: #ff4757; font-size: 0.8rem; margin-top: 5px; animation: shake 0.3s ease-in-out;';
        errorDiv.textContent = message;

        field.parentElement.parentElement.appendChild(errorDiv);
    }

    function clearFieldError(field) {
        field.style.borderColor = '#e1e8ed';
        field.style.background = 'rgba(255, 255, 255, 0.9)';

        const existingError = field.parentElement.parentElement.querySelector('.field-error');
        if (existingError) {
            existingError.remove();
        }
    }

    // Add ripple effect to button
    document.querySelector('.login-btn').addEventListener('click', function(e) {
        const ripple = document.createElement('span');
        const rect = this.getBoundingClientRect();
        const size = Math.max(rect.width, rect.height);
        const x = e.clientX - rect.left - size / 2;
        const y = e.clientY - rect.top - size / 2;

        ripple.style.width = ripple.style.height = size + 'px';
        ripple.style.left = x + 'px';
        ripple.style.top = y + 'px';
        ripple.classList.add('ripple');

        this.appendChild(ripple);

        setTimeout(() => {
            ripple.remove();
        }, 600);
    });

    // Auto-focus username field
    window.addEventListener('load', () => {
        document.getElementById('username').focus();
    });





</script>

<style>
    .ripple {
        position: absolute;
        border-radius: 50%;
        background: rgba(255, 255, 255, 0.6);
        transform: scale(0);
        animation: ripple-animation 0.6s linear;
        pointer-events: none;
    }

    @keyframes ripple-animation {
        to {
            transform: scale(2);
            opacity: 0;
        }
    }
</style>
</body>
</html>