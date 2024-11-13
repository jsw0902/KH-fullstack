import logo from './logo.svg';
import './App.css';
import Header from "./compornent/common/Header";
import Footer from "./compornent/common/Footer";
import MyPage from './compornent/member/MyPage';
import Main   from './compornent/Main';
import Login  from "./compornent/member/Login";
import Join   from "./compornent/member/Join";
import NoticeList from './compornent/notice/NoticeList';
import NoticeDetail from './compornent/notice/NoticeDetail';

//라우터 사용을 위한 import
import {Routes, Route, Link} from "react-router-dom";

function App() {
  return (
    <div className="App">
      {/* 
        라우터 : 포괄적으로는 경로를 설정한다는 의미를 가지고 있음.

        리액트는 SPA(Single Page Application)의 특징을 가지고 있음.
        App 컴포넌트가 리턴한 문법을 index.html 하나의 페이지에 표기.
        이 때, 사용자가 요청한 URL에 따라 동적으로 컴포넌트를 보여주기 위해
        라우터라는 기술이 필요.
      */}
      <Header/>
      <Routes>
        <Route path="/member/myPage"             element=<MyPage/> />
        <Route path="/"                          element=<Main/> />
        <Route path="/member/login"              element=<Login/> />
        <Route path="/member/join"               element=<Join/> />
        <Route path='/notice/list/:noticeType'   element=<NoticeList/> />
        <Route path='/notice/detail'             element=<NoticeDetail/> />
      </Routes>
      <Footer/>
    </div>
  );
}

export default App;
