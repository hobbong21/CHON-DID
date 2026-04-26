const page = document.body.dataset.page || getCurrentPage();
const pageGroup = getPageGroup(page);

const navTarget = document.querySelector('[data-site-shell="nav"]');
const footerTarget = document.querySelector('[data-site-shell="footer"]');

if (navTarget) {
    navTarget.outerHTML = renderNavigation(pageGroup);
}

if (footerTarget) {
    footerTarget.outerHTML = renderFooter();
}

function getCurrentPage() {
    const path = window.location.pathname.split('/').pop();
    return path || 'index.html';
}

function getPageGroup(currentPage) {
    switch (currentPage) {
        case 'about':
        case 'about.html':
        case 'ceo':
        case 'ceo.html':
            return 'about';
        case 'technology':
        case 'technology.html':
            return 'technology';
        case 'service':
        case 'service.html':
            return 'service';
        case 'news':
        case 'news.html':
            return 'news';
        default:
            return '';
    }
}

function renderNavigation(currentGroup) {
    const aboutActive = currentGroup === 'about' ? ' class="active" aria-current="page"' : '';
    const technologyActive = currentGroup === 'technology' ? ' class="active" aria-current="page"' : '';
    const serviceActive = currentGroup === 'service' ? ' class="active" aria-current="page"' : '';
    const newsActive = currentGroup === 'news' ? ' class="active" aria-current="page"' : '';

    return `
    <nav class="navbar" role="navigation" aria-label="메인 네비게이션">
        <div class="container">
            <div class="nav-brand">
                <a href="index.html" title="CHON 홈페이지">
                    <img src="images/chon-logo.png" alt="CHON Logo">
                </a>
            </div>
            <ul class="nav-menu" id="navMenu" aria-label="메인 메뉴">
                <li class="dropdown">
                    <a href="about.html"${aboutActive}>About</a>
                    <ul class="dropdown-menu">
                        <li><a href="about.html#company">회사 소개</a></li>
                        <li><a href="ceo.html">CEO 메시지</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="technology.html"${technologyActive}>Technology</a>
                    <ul class="dropdown-menu">
                        <li><a href="technology.html#overview">CHON DID</a></li>
                        <li><a href="technology.html#healthcare">헬스케어</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="service.html"${serviceActive}>Service</a>
                    <ul class="dropdown-menu">
                        <li><a href="service.html#service">Smart Genealogy</a></li>
                        <li><a href="service.html#download">앱 다운로드</a></li>
                    </ul>
                </li>
                <li><a href="news.html"${newsActive}>News</a></li>
            </ul>
            <div class="nav-actions">
                <button class="lang-toggle" id="langToggle" aria-label="언어 전환 버튼" title="한국어/English 전환">
                    <i class="fas fa-globe" aria-hidden="true"></i>
                    <span>EN</span>
                </button>
                <button class="mobile-menu-toggle" title="메뉴 열기" aria-label="모바일 메뉴 열기" aria-expanded="false" aria-controls="navMenu">
                    <i class="fas fa-bars" aria-hidden="true"></i>
                </button>
            </div>
        </div>
    </nav>`;
}

function renderFooter() {
    const year = new Date().getFullYear();

    return `
    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-brand">
                    <div class="footer-brand-row">
                        <img src="images/chon-logo-new.png" alt="CHON Logo" class="footer-logo">
                        <div class="footer-company-info">
                            <p><strong>정보보안담당자:</strong> 김남율</p>
                            <p><strong>이메일:</strong> ops@chon.ai</p>
                            <p><strong>주소:</strong> 서울특별시 강남구 강남대로464 3층 309호</p>
                            <p><strong>사업자등록번호:</strong> 196-86-03544</p>
                        </div>
                    </div>
                </div>
                <div class="footer-links">
                    <div class="footer-column">
                        <h4>서비스</h4>
                        <ul>
                            <li><a href="technology.html">CHON DID</a></li>
                            <li><a href="service.html">Smart Genealogy</a></li>
                        </ul>
                    </div>
                    <div class="footer-column">
                        <h4>회사</h4>
                        <ul>
                            <li><a href="about.html">About</a></li>
                            <li><a href="ir.html">투자 정보</a></li>
                        </ul>
                    </div>
                    <div class="footer-column">
                        <h4>Contact</h4>
                        <ul>
                            <li><a href="contact.html">문의하기</a></li>
                            <li><a href="contact.html#faq">FAQ</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <div class="footer-legal">
                    <a href="privacy-policy.html">개인정보 처리방침</a>
                    <span class="separator">|</span>
                    <a href="#" onclick="alert('이용약관 페이지 준비 중입니다.')">이용약관</a>
                </div>
                <p class="copyright">&copy; ${year} CHON. All rights reserved.</p>
                <div class="footer-social">
                    <a href="#" target="_blank" rel="noopener noreferrer" aria-label="LinkedIn"><i class="fab fa-linkedin"></i></a>
                    <a href="#" target="_blank" rel="noopener noreferrer" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                    <a href="#" target="_blank" rel="noopener noreferrer" aria-label="GitHub"><i class="fab fa-github"></i></a>
                    <a href="#" target="_blank" rel="noopener noreferrer" aria-label="Medium"><i class="fab fa-medium"></i></a>
                </div>
            </div>
        </div>
    </footer>`;
}
