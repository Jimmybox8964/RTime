<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file ="menu.jsp" %>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>北護修Time - 校園修繕平台首頁</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* --- 全局設定 --- */
        :root {
            --primary-blue: #0e3c6b;
            --secondary-blue: #154a82;
            --accent-yellow: #fccb06;
            --text-dark: #333;
            --text-light: #fff;
            --bg-light: #f4f7f9;
            --success-green: #28a745;
            --warning-yellow: #ffc107;
            --pending-orange: #ff9800; /* For "處理中" status */
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif, 'Noto Sans TC', 'Microsoft JhengHei';
        }

        body {
            background-color: var(--bg-light);
            color: var(--text-dark);
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        ul {
            list-style: none;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* --- Header 導航欄 --- */
        header {
            background-color: #fff;
            padding: 15px 0;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        }

        .nav-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo-group {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            line-height: 1.2;
        }
        
        .logo {
            display: flex;
            align-items: center;
            font-size: 24px;
            font-weight: bold;
            color: var(--primary-blue);
        }

        .logo i {
            color: var(--accent-yellow);
            margin-right: 10px;
            font-size: 28px;
        }
        
        .logo-subtext {
            font-size: 16px;
            font-weight: normal;
            color: #666;
            margin-left: 38px; /* Align with "北護修Time" text */
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 25px;
        }

        .nav-links a {
            font-weight: 500;
            color: var(--primary-blue);
        }

        .btn-login {
            background-color: var(--primary-blue);
            color: #fff !important;
            padding: 10px 20px;
            border-radius: 5px;
            font-weight: bold;
        }

        /* --- Hero 區塊 (主視覺) --- */
        .hero-section {
            background-color: var(--primary-blue);
            color: var(--text-light);
            text-align: center;
            padding: 60px 0;
        }

        .hero-title {
            font-size: 3rem;
            margin-bottom: 30px;
        }

        .hero-actions {
            display: flex;
            justify-content: center;
            gap: 20px;
            max-width: 900px;
            margin: 0 auto;
        }

        .btn-submit {
            background-color: var(--accent-yellow);
            color: var(--primary-blue);
            font-size: 1.2rem;
            font-weight: bold;
            padding: 15px 40px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            flex: 1;
            max-width: 300px;
        }

        .search-bar-container {
            flex: 2;
            position: relative;
            max-width: 500px;
        }

        .search-bar-container i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #aaa;
            font-size: 1.2rem;
        }

        .search-input {
            width: 100%;
            padding: 15px 15px 15px 50px;
            font-size: 1.1rem;
            border: none;
            border-radius: 8px;
            outline: none;
        }

        /* --- 統計數據條 --- */
        .stats-bar {
            background-color: var(--secondary-blue);
            color: var(--text-light);
            padding: 30px 0;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            text-align: center;
        }

        .stat-item {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .stat-icon {
            font-size: 2.5rem;
            margin-bottom: 10px;
            opacity: 0.8;
        }

        .stat-number {
            font-size: 2rem;
            font-weight: bold;
        }

        .stat-label {
            font-size: 0.9rem;
            opacity: 0.9;
        }

        /* --- 主要內容區 --- */
        .main-content {
            padding: 50px 0;
            display: grid;
            grid-template-columns: 2fr 3fr; /* 左側佔2份，右側佔3份 */
            gap: 40px;
            align-items: start;
        }

        /* 左側內容 */
        .left-column {
            display: flex;
            flex-direction: column;
            gap: 30px; /* Space between categories and announcements */
        }

        .quick-categories {
            display: grid;
            grid-template-columns: repeat(2, 1fr); /* 圖片上是2x2 */
            gap: 15px;
        }

        .category-btn {
            background: #fff;
            border: 1px solid #eee;
            border-radius: 10px;
            padding: 20px 10px;
            text-align: center;
            cursor: pointer;
            transition: box-shadow 0.3s;
        }

        .category-btn:hover {
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .category-icon {
            font-size: 2.5rem; /* Larger icons as per image */
            margin-bottom: 10px;
        }
        /* 為不同類別加上特定顏色 */
        .cat-power .category-icon { color: #ffc107; } /* 電力故障 */
        .cat-plumbing .category-icon { color: #0dcaf0; } /* 漏水/管線 */
        .cat-wifi .category-icon { color: #6610f2; } /* 網路異常 */
        .cat-dorm .category-icon { color: #fd7e14; } /* 宿舍設備 */

        .category-label {
            font-weight: 600;
            color: var(--text-dark);
            font-size: 1.1rem; /* Larger label font */
        }

        .announcement-box {
            background-color: #fcebeb; /* Light red/orange background as in image */
            border: 1px solid #e0b4b4; /* Slightly darker border */
            border-radius: 10px;
            padding: 25px;
            display: flex;
            align-items: flex-start;
            gap: 15px;
        }
        
        .announcement-icon {
            font-size: 1.8rem;
            color: #d9534f; /* Red icon color */
        }

        .announcement-content {
            flex-grow: 1;
        }

        .announcement-title {
            font-size: 1.2rem;
            font-weight: bold;
            margin-bottom: 10px;
            color: #d9534f; /* Red title color */
        }

        .announcement-text {
            font-size: 0.95rem;
            line-height: 1.6;
            color: #555;
        }

        /* 右側內容 (最新維修狀態) */
        .right-column {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            padding: 30px;
        }

        .status-title {
            font-size: 1.3rem;
            font-weight: bold;
            margin-bottom: 25px;
            color: var(--text-dark);
        }

        .status-list {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .status-item {
            display: flex;
            align-items: center;
            padding-bottom: 20px;
            border-bottom: 1px solid #eee;
        }

        .status-item:last-child {
            border-bottom: none;
            padding-bottom: 0;
        }

        .item-icon {
            width: 40px;
            height: 40px;
            background-color: #f0f2f5;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            color: var(--secondary-blue);
        }

        .item-details {
            flex-grow: 1;
            font-weight: 500;
        }

        .status-badge {
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: bold;
        }

        .badge-fixed {
            background-color: #d4edda;
            color: var(--success-green);
        }

        .badge-pending {
            background-color: #fff3cd; /* Yellow for "處理中" */
            color: var(--pending-orange);
        }
        
        .badge-fixed-orange { /* Used for the orange "已修復" in the image */
            background-color: #fff3cd;
            color: var(--warning-yellow);
        }


        /* --- Footer --- */
        footer {
            background-color: var(--primary-blue);
            color: var(--text-light);
            padding: 20px 0;
            text-align: center;
            margin-top: 50px; /* Add some space above footer */
        }

        .footer-links {
            display: flex;
            justify-content: center;
            gap: 30px;
            font-weight: 500;
        }

        /* --- 響應式調整 (簡單範例) --- */
        @media (max-width: 768px) {
            .hero-title { font-size: 2rem; }
            .hero-actions { flex-direction: column; }
            .btn-submit, .search-bar-container { max-width: 100%; }
            .stats-grid { grid-template-columns: repeat(2, 1fr); }
            .main-content { 
                grid-template-columns: 1fr; 
                gap: 30px; /* Adjust gap for single column */
            }
            .nav-links a:not(.btn-login) { display: none; } /* 手機版隱藏部分連結 */
            .logo-subtext { margin-left: 0; text-align: center; width: 100%;}
            .logo-group { align-items: center; }
            .quick-categories { grid-template-columns: 1fr; } /* Single column for categories on mobile */
        }
    </style>
</head>
<body>
   
    <section class="hero-section">
        <div class="container">
            <h1 style="color: #FFFFFF;">校園設施有問題？我們來解決。           
            </h1>
            <br>
            <div class="hero-actions">
                <button class="btn-submit">立即新增報修</button>
                <div class="search-bar-container">
                    <i class="fas fa-search"></i>
                    <input type="text" class="search-input" placeholder="輸入單號查詢進度...">
                </div>
            </div>
        </div>
    </section>

    <section class="stats-bar">
        <div class="container stats-grid">
            <div class="stat-item">
                <i class="far fa-calendar-alt stat-icon"></i>
                <div class="stat-number">12</div>
                <div class="stat-label">今日新增</div>
            </div>
            <div class="stat-item">
                <i class="fas fa-history stat-icon"></i>
                <div class="stat-number">8</div>
                <div class="stat-label">處理中</div>
            </div>
            <div class="stat-item">
                <i class="fas fa-tools stat-icon"></i>
                <div class="stat-number">1240</div>
                <div class="stat-label">本學期已修復</div>
            </div>
            <div class="stat-item">
                <i class="far fa-smile stat-icon"></i>
                <div class="stat-number">98%</div>
                <div class="stat-label">滿意度</div>
            </div>
        </div>
    </section>

    <main class="container main-content">
        
        <div class="left-column">
            <div class="quick-categories">
                <div class="category-btn cat-power">
                    <i class="fas fa-bolt category-icon"></i>
                    <div class="category-label">電力故障</div>
                </div>
                <div class="category-btn cat-plumbing">
                    <i class="fas fa-faucet category-icon"></i> <div class="category-label">漏水/管線</div>
                </div>
                <div class="category-btn cat-wifi">
                    <i class="fas fa-wifi category-icon"></i>
                    <div class="category-label">網路異常</div>
                </div>
                <div class="category-btn cat-dorm">
                    <i class="fas fa-bed category-icon"></i>
                    <div class="category-label">宿舍設備</div>
                </div>
            </div>

            <div class="announcement-box">
                <i class="fas fa-bullhorn announcement-icon"></i>
                <div class="announcement-content">
                    <h3 class="announcement-title">重要維修公告</h3>
                    <p class="announcement-text">
                        【中央圖】校園新聞維修相配公告，重要維修公告。
                    </p>
                </div>
            </div>
        </div>

        <div class="right-column">
            <h3 class="status-title">最新報修動態</h3>
            <ul class="status-list">
                <li class="status-item">
                    <div class="item-icon">
                        <i class="fas fa-building"></i>
                    </div>
                    <div class="item-details">圖書館 3F 冷氣滴水</div>
                    <span class="status-badge badge-fixed">已修復</span>
                </li>
                <li class="status-item">
                    <div class="item-icon">
                        <i class="fas fa-temperature-low"></i>
                    </div>
                    <div class="item-details">圖書館 3F 冷氣滴水</div>
                    <span class="status-badge badge-fixed-orange">已修復</span>
                </li>
                <li class="status-item">
                    <div class="item-icon">
                        <i class="fas fa-door-open"></i>
                    </div>
                    <div class="item-details">圖書館 3F 冷氣滴水</div>
                    <span class="status-badge badge-pending">已修復</span> </li>
                <li class="status-item">
                    <div class="item-icon">
                        <i class="fas fa-landmark"></i>
                    </div>
                    <div class="item-details">圖書館 3F 冷氣滴水</div>
                    <span class="status-badge badge-fixed">已修復</span>
                </li>
                <li class="status-item">
                    <div class="item-icon">
                        <i class="fas fa-building"></i>
                    </div>
                    <div class="item-details">圖書館 3F 冷氣滴水</div>
                    <span class="status-badge badge-fixed">已修復</span>
                </li>
            </ul>
        </div>
    </main>

    <footer>
        <div class="container footer-links">
            <a href="#">關於我們</a>
            <a href="#">報修流程</a>
            <a href="#">聯絡我們</a>
        </div>
    </footer>

</body>
</html>