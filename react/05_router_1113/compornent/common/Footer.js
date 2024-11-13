import './footer.css';

//페이지 상단 영역의 Footer 컴포넌트 정의
const Footer = function(){
    return(
        <footer className="footer"> {/* class => className */}
            <div>
                <a href="#">이용약관</a>
                <p>무단복제 시, 형사 처벌을 받을 수 있습니다. (70년이하의 징역 또는 10억 상당의 벌금이 부과될 수 있습니다.)</p>
            </div>
        </footer>
    );
}

//현재 컴포넌트 외부에서 사용가능하도록 처리
export default Footer;