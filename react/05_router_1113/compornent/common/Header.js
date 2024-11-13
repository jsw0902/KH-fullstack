import './header.css';

//라우터를 사용하기 위한 import
import { Link } from 'react-router-dom';

//state 사용을 위한 import
import { useState } from 'react';

const Header = function(){

    const [menuList, setmenuList] = useState([
        {menuNm : "공지사항", noticeType : 1},
        {menuNm : "1:1문의", noticeType : 2},
        {menuNm : "질문게시판", noticeType : 3}
    ]);

    return(
        <header className="header">
            <div>
                <div className="site-logo">
                    <Link to="/">KH-M-Class</Link>
                </div>
                <div className='menu-wrap'>
                    <ul>
                        {menuList.map(function(menu, index){
                            return <li key={"menu" + index}>
                                {/* 클릭한 게시글 종류에 따라, 각기 다른 게시글 조회할 수 있도록 파라미터 전달 */}
                                <Link to={"/notice/list/" + menu.noticeType}>
                                    {menu.menuNm}
                                </Link>
                            </li>
                        })}
                    </ul>
                </div>
                <div className="link-box">
                    <Link to="/member/login">로그인</Link>
                    <Link to="/member/join">회원가입</Link>
                    {/* 
                        라우터로 등록한 컴포넌트 호출 시, a 태그로 작성하면 화면 전환이 일어남
                        화면 전환 없이, 컴포넌트를 호출하기 위해, 라우터에서 제공하는 Link 태그 사용.
                    */}
                    <Link to='/member/myPage'>마이페이지</Link>
                </div>
            </div>
        </header>
    );
}

export default Header;