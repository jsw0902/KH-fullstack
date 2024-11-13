import './header.css';


//페이지 상단 영역의 Header 컴포넌트 정의
const Header = function(){
    return(
        <header className="header"> {/* class => className */}
            <div>
                <div className="site-logo">
                    <a href="#">KH-M-Class</a>
                </div>
                <div className="link-box">
                    <a href="#">로그인</a>
                    <a href="#">회원가입</a>
                </div>
            </div>
        </header>
    );
}

//현재 컴포넌트 외부에서 사용가능하도록 처리
export default Header;