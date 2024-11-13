
import { useLocation } from "react-router-dom";

function NoticeDetail(){
    let location = useLocation();
    let notice = location.state; //Link 태그의 state 속성을 이용해 전달한 객체 추출
    console.log(notice);

    return (
        <>
            <h1>게시글 상세보기 페이지</h1>


            <hr/>

            <ul>
                <li>번호 : {notice.noticeNo}</li>
                <li>제목 : {notice.noticeTitle}</li>
                <li>내용 : {notice.noticeContent}</li>
                <li>작성자 : {notice.noticeWriter}</li>
                <li>직상일 : {notice.noticeDate}</li>
            </ul>
        </>
    );
}

export default NoticeDetail;