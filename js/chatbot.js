/**
 * CHON AI 챗봇
 * - CHON 서비스/기술/회사 정보를 기반으로 한 규칙 기반 챗봇
 * - 타이핑 애니메이션, 빠른 답변 버튼 등 UX 요소 포함
 */

(function () {
    'use strict';

    // ========== 지식 베이스 ==========
    const knowledgeBase = [
        {
            patterns: ['안녕', '하이', 'hello', 'hi', '반가워', '처음', '시작'],
            response: '안녕하세요. CHON AI 어시스턴트입니다.\nCHON의 DID 기술, 서비스, 투자 정보에 대해 안내해 드리겠습니다.',
            quickReplies: ['CHON이 뭔가요?', 'DID 기술이란?', '서비스 소개', '투자 문의']
        },
        {
            patterns: ['chon이', 'chon은', 'chon 회사', '촌이', '촌은', '회사 소개', '어떤 회사', '무슨 회사', '회사가'],
            response: 'CHON(촌)은 **인간 관계를 핵심으로 하는 차세대 탈중앙화 신원 인증(DID) 플랫폼**입니다.\n\n가족, 친구, 동료와의 관계망을 통해 진정한 신원을 증명하는 새로운 패러다임을 제시합니다.\n\n주소: 서울특별시 강남구 강남대로464 3층 309호\n이메일: ops@chon.ai',
            quickReplies: ['DID 기술이란?', 'Smart Genealogy', '투자 문의', 'CEO 소개']
        },
        {
            patterns: ['did', '탈중앙화', '신원인증', '신원 인증', '블록체인', '분산 신원', '자기 주권'],
            response: 'CHON DID는 **탈중앙화 신원 인증(Decentralized Identity)** 기술입니다.\n\n• 자기 주권 신원(SSI): 개인이 자신의 신원 정보를 직접 통제\n• 영지식 증명(ZKP): 개인정보 노출 없이 신원 검증\n• Web of Trust: 관계 기반 신뢰 네트워크\n• 블록체인 기반 위변조 불가 인증\n\n기존 중앙화 방식과 달리 제3자 없이 안전하게 신원을 증명할 수 있습니다.',
            quickReplies: ['Smart Genealogy', '앱 다운로드', '기술 상세 보기']
        },
        {
            patterns: ['smart genealogy', '스마트 족보', '족보', 'genealogy', '가족 네트워크', '가계도'],
            response: 'Smart Genealogy는 CHON의 핵심 서비스입니다.\n\n• 디지털 가족 관계망 구축\n• 블록체인 기반 가족 인증\n• 신뢰할 수 있는 관계 네트워크\n• 모바일 앱 중심의 간편한 사용성\n\n가족으로부터 시작하는 신원 인증으로 더 안전하고 신뢰할 수 있는 디지털 환경을 제안합니다.',
            quickReplies: ['앱 다운로드', 'DID 기술이란?', '파트너십 문의']
        },
        {
            patterns: ['앱', 'app', '다운로드', 'download', '모바일', '설치'],
            response: 'CHON 앱은 현재 출시 준비 중입니다.\n\n출시 예정 앱을 통해 다음 기능을 제공할 예정입니다:\n• 스마트 족보 생성 및 관리\n• DID 기반 신원 인증\n• 관계 네트워크 구축\n\n출시 알림은 Contact 페이지에서 신청하실 수 있습니다.',
            quickReplies: ['문의하기', 'CHON 서비스 보기']
        },
        {
            patterns: ['투자', '투자자', 'ir', '주식', '지분', '펀딩', '시리즈', '투자 유치', '투자 정보'],
            response: 'CHON 투자 정보를 찾고 계시는군요.\n\nCHON은 DID 기술 기반의 성장 가능성을 가진 블록체인 기업입니다.\n\n투자 설명서와 상세 IR 자료는 IR 페이지에서 확인하실 수 있습니다.\n직접 문의는 ops@chon.ai로 부탁드립니다.',
            quickReplies: ['IR 페이지로 이동', '문의하기', '회사 소개']
        },
        {
            patterns: ['ceo', '대표', '김', '대표이사', '창업자', '설립자'],
            response: 'CHON의 리더십과 비전은 CEO 페이지에서 확인하실 수 있습니다.\n\n탈중앙화 신원 인증 기술을 바탕으로 새로운 디지털 신원 체계를 구축하려는 방향을 소개하고 있습니다.',
            quickReplies: ['CEO 페이지로 이동', '회사 비전', 'CHON 소개']
        },
        {
            patterns: ['파트너', 'partner', '협력사', '제휴', '파트너십'],
            response: 'CHON은 다양한 기술, 리서치, 미디어 파트너와 협력하고 있습니다.\n\n• **한국IBM** - 기술 파트너\n• **커리어리서치** - 리서치 파트너\n• **에이나(ANA Inc.)** - 기술 파트너\n\n파트너십 문의는 Contact 페이지 또는 ops@chon.ai로 부탁드립니다.',
            quickReplies: ['문의하기', '서비스 소개']
        },
        {
            patterns: ['연락', '문의', '이메일', '전화', '주소', 'contact', '연락처'],
            response: 'CHON 문의는 아래 채널을 이용해 주세요.\n\n이메일: ops@chon.ai\n주소: 서울특별시 강남구 강남대로464 3층 309호\n\n또는 Contact 페이지의 문의 양식을 통해 접수하실 수 있습니다.',
            quickReplies: ['Contact 페이지로 이동', 'FAQ 보기']
        },
        {
            patterns: ['faq', '자주 묻는', '자주묻는', '질문'],
            response: '자주 묻는 질문은 Contact 페이지의 FAQ 섹션에서 확인하실 수 있습니다.\n\n원하시는 주제를 선택하거나 구체적으로 질문해 주세요.',
            quickReplies: ['DID란?', 'CHON 서비스', '투자 문의', '연락처']
        },
        {
            patterns: ['뉴스', 'news', '소식', '기사', '언론'],
            response: 'CHON의 최신 소식은 News 페이지에서 확인하실 수 있습니다.\n\n최근 주요 뉴스:\n• "가족으로 시작하는 블록체인"...촌, 교육 시장 공략 DID 대중화 나서 - 한국경제 (2024.01.16)',
            quickReplies: ['뉴스 페이지로 이동', 'CHON 소개']
        },
        {
            patterns: ['메타버스', '웹3', 'web3', 'web 3', '미래', '비전'],
            response: 'CHON은 메타버스와 Web3 시대의 신원 인프라를 구축합니다.\n\n디지털 환경에서도 오프라인처럼 신뢰할 수 있는 신원 인증이 필요합니다.\n\nCHON의 비전:\n• 관계 기반 신원 체계\n• 자기 주권 디지털 ID\n• 개인정보 보호 중심 설계\n• 글로벌 신뢰 네트워크',
            quickReplies: ['DID 기술이란?', 'Smart Genealogy', '투자 문의']
        },
        {
            patterns: ['감사', '고마워', '고맙', '도움이', '좋아', '훌륭'],
            response: '도움이 되었다니 다행입니다.\n\nCHON에 대해 더 궁금한 점이 있으시면 계속 질문해 주세요. 직접 상담은 ops@chon.ai로 문의하실 수 있습니다.',
            quickReplies: ['다른 질문하기', '문의하기']
        },
        {
            patterns: ['개인정보', '보안', '보호', '안전', '프라이버시', 'privacy'],
            response: 'CHON은 개인정보 보호를 최우선으로 설계합니다.\n\n• 영지식 증명(Zero-Knowledge Proof) 기술 적용\n• 탈중앙화 저장 구조\n• 개인 중심의 정보 통제\n• 투명한 개인정보 처리방침 공개\n\n자세한 내용은 개인정보 처리방침 페이지에서 확인하실 수 있습니다.',
            quickReplies: ['DID 기술이란?', '개인정보 처리방침']
        }
    ];

    const defaultResponse = {
        response: '질문을 정확히 이해하지 못했습니다.\n\n아래 주제 중 하나를 선택하시거나, 더 구체적으로 질문해 주세요.\n\n• CHON DID 기술\n• Smart Genealogy 서비스\n• 투자 및 IR 정보\n• 연락처 및 문의',
        quickReplies: ['CHON이 뭔가요?', 'DID 기술이란?', '서비스 소개', '문의하기']
    };

    // 페이지 이동 맵
    const pageLinks = {
        'IR 페이지로 이동': 'ir.html',
        'CEO 페이지로 이동': 'ceo.html',
        'Contact 페이지로 이동': 'contact.html#contact',
        '뉴스 페이지로 이동': 'news.html',
        'FAQ 보기': 'contact.html#faq',
        '기술 상세 보기': 'technology.html',
        'CHON 서비스 보기': 'service.html',
        '문의하기': 'contact.html',
        '앱 다운로드': 'service.html#download',
        '개인정보 처리방침': 'privacy-policy.html'
    };

    // ========== 유틸리티 ==========
    function getCurrentTime() {
        return new Date().toLocaleTimeString('ko-KR', { hour: '2-digit', minute: '2-digit' });
    }

    function findResponse(input) {
        const normalized = input.toLowerCase().replace(/[?？！!]/g, '').trim();
        for (const item of knowledgeBase) {
            for (const pattern of item.patterns) {
                if (normalized.includes(pattern.toLowerCase())) {
                    return item;
                }
            }
        }
        return defaultResponse;
    }

    // ========== DOM 생성 ==========
    function createChatbotUI() {
        // 플로팅 버튼
        const toggleBtn = document.createElement('button');
        toggleBtn.className = 'chatbot-toggle';
        toggleBtn.setAttribute('aria-label', 'AI 챗봇 열기');
        toggleBtn.innerHTML = `
            <i class="fas fa-comment-dots icon-chat"></i>
            <i class="fas fa-times icon-close"></i>
            <span class="chatbot-badge">1</span>
        `;

        // 챗봇 창
        const chatWindow = document.createElement('div');
        chatWindow.className = 'chatbot-window';
        chatWindow.setAttribute('role', 'dialog');
        chatWindow.setAttribute('aria-label', 'CHON AI 챗봇');
        chatWindow.innerHTML = `
            <div class="chatbot-header">
                <div class="chatbot-avatar">
                    <i class="fas fa-robot"></i>
                </div>
                <div class="chatbot-header-info">
                    <h4>CHON AI 어시스턴트</h4>
                    <span>온라인 · 보통 즉시 응답</span>
                </div>
                <div class="chatbot-header-actions">
                    <button id="chatbotMinimize" aria-label="챗봇 최소화" title="닫기">
                        <i class="fas fa-minus"></i>
                    </button>
                </div>
            </div>
            <div class="chatbot-messages" id="chatbotMessages" aria-live="polite" aria-atomic="false"></div>
            <div class="chatbot-input-area">
                <textarea
                    class="chatbot-input"
                    id="chatbotInput"
                    placeholder="메시지를 입력하세요..."
                    rows="1"
                    aria-label="메시지 입력"
                    maxlength="500"
                ></textarea>
                <button class="chatbot-send-btn" id="chatbotSend" aria-label="전송">
                    <i class="fas fa-paper-plane"></i>
                </button>
            </div>
            <div class="chatbot-footer-brand">
                Powered by <span>CHON AI</span>
            </div>
        `;

        document.body.appendChild(toggleBtn);
        document.body.appendChild(chatWindow);

        return { toggleBtn, chatWindow };
    }

    // ========== 메시지 렌더링 ==========
    function addMessage(container, role, text, quickReplies) {
        const msgEl = document.createElement('div');
        msgEl.className = `message ${role}`;

        // 텍스트에서 **bold** 처리
        const formatted = text
            .replace(/\*\*(.+?)\*\*/g, '<strong>$1</strong>')
            .replace(/\n/g, '<br>');

        if (role === 'bot') {
            msgEl.innerHTML = `
                <div class="message-avatar"><i class="fas fa-robot"></i></div>
                <div>
                    <div class="message-bubble">${formatted}</div>
                    <span class="message-time">${getCurrentTime()}</span>
                </div>
            `;
        } else {
            msgEl.innerHTML = `
                <div>
                    <div class="message-bubble">${formatted}</div>
                    <span class="message-time">${getCurrentTime()}</span>
                </div>
            `;
        }

        container.appendChild(msgEl);

        // 빠른 답변 버튼
        if (quickReplies && quickReplies.length > 0) {
            const qrContainer = document.createElement('div');
            qrContainer.className = 'quick-replies';
            quickReplies.forEach(qr => {
                const btn = document.createElement('button');
                btn.className = 'quick-reply-btn';
                btn.textContent = qr;
                btn.addEventListener('click', () => {
                    // 페이지 이동이 있는 경우
                    if (pageLinks[qr]) {
                        window.location.href = pageLinks[qr];
                        return;
                    }
                    handleUserMessage(qr, container, qrContainer.parentElement);
                    // 빠른 답변 버튼 제거
                    qrContainer.remove();
                });
                qrContainer.appendChild(btn);
            });
            container.appendChild(qrContainer);
        }

        container.scrollTop = container.scrollHeight;
    }

    function showTypingIndicator(container) {
        const indicator = document.createElement('div');
        indicator.className = 'typing-indicator message bot';
        indicator.id = 'typingIndicator';
        indicator.innerHTML = `
            <div class="message-avatar"><i class="fas fa-robot"></i></div>
            <div class="typing-bubble">
                <div class="typing-dot"></div>
                <div class="typing-dot"></div>
                <div class="typing-dot"></div>
            </div>
        `;
        container.appendChild(indicator);
        container.scrollTop = container.scrollHeight;
        return indicator;
    }

    // ========== 메시지 처리 ==========
    function handleUserMessage(text, messagesContainer, quickRepliesEl) {
        // 이전 빠른 답변 버튼 제거
        const existingQR = messagesContainer.querySelector('.quick-replies:last-child');
        if (existingQR) existingQR.remove();

        // 사용자 메시지 추가
        addMessage(messagesContainer, 'user', text);

        // 타이핑 인디케이터
        const typing = showTypingIndicator(messagesContainer);

        // 응답 생성 (약간의 딜레이로 자연스러운 UX)
        const delay = 600 + Math.random() * 600;
        setTimeout(() => {
            typing.remove();
            const result = findResponse(text);
            addMessage(messagesContainer, 'bot', result.response, result.quickReplies);
        }, delay);
    }

    // ========== 초기화 ==========
    function init() {
        const { toggleBtn, chatWindow } = createChatbotUI();
        const messagesContainer = document.getElementById('chatbotMessages');
        const inputEl = document.getElementById('chatbotInput');
        const sendBtn = document.getElementById('chatbotSend');
        const minimizeBtn = document.getElementById('chatbotMinimize');
        const badge = toggleBtn.querySelector('.chatbot-badge');

        let isOpen = false;

        // 환영 메시지 (즉시)
        setTimeout(() => {
            addMessage(
                messagesContainer,
                'bot',
                '안녕하세요. CHON AI 어시스턴트입니다.\nCHON의 DID 기술, 서비스, 투자 정보에 대해 안내해 드리겠습니다.',
                ['CHON이 뭔가요?', 'DID 기술이란?', '서비스 소개', '투자 문의']
            );
        }, 300);

        // 토글 버튼 클릭
        toggleBtn.addEventListener('click', () => {
            isOpen = !isOpen;
            toggleBtn.classList.toggle('open', isOpen);
            chatWindow.classList.toggle('open', isOpen);
            toggleBtn.setAttribute('aria-label', isOpen ? 'AI 챗봇 닫기' : 'AI 챗봇 열기');

            if (isOpen) {
                // 뱃지 제거
                if (badge) badge.remove();
                setTimeout(() => inputEl.focus(), 350);
            }
        });

        // 최소화 버튼
        minimizeBtn.addEventListener('click', () => {
            isOpen = false;
            toggleBtn.classList.remove('open');
            chatWindow.classList.remove('open');
        });

        // 전송 버튼
        sendBtn.addEventListener('click', () => {
            const text = inputEl.value.trim();
            if (!text) return;
            inputEl.value = '';
            inputEl.style.height = 'auto';
            handleUserMessage(text, messagesContainer);
        });

        // Enter 키 전송 (Shift+Enter는 줄바꿈)
        inputEl.addEventListener('keydown', (e) => {
            if (e.key === 'Enter' && !e.shiftKey) {
                e.preventDefault();
                const text = inputEl.value.trim();
                if (!text) return;
                inputEl.value = '';
                inputEl.style.height = 'auto';
                handleUserMessage(text, messagesContainer);
            }
        });

        // 입력창 자동 높이 조절
        inputEl.addEventListener('input', () => {
            inputEl.style.height = 'auto';
            inputEl.style.height = Math.min(inputEl.scrollHeight, 80) + 'px';
        });

        // ESC 키로 닫기
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape' && isOpen) {
                isOpen = false;
                toggleBtn.classList.remove('open');
                chatWindow.classList.remove('open');
            }
        });
    }

    // DOM 준비 후 초기화
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();
