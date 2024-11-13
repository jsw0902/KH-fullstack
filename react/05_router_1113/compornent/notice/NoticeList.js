
//전달 파라미터 추출을 위한 import
import { useParams, Link } from "react-router-dom";

import { useState } from "react";


function NoticeList(){
    //Header에서 Link를 이용해 전달한 파라미터(noticeType)을 꺼내는 방법
    let params = useParams();

    //서버에서 noticeType별 조회해온 게시글 리스트
    let [noticeList, setNoticeList] = useState([
        {noticeNo : 1, noticeTitle : "게시글 제목1", noticeContent : "게시글 내용1", noticeWriter : "유저1", noticeDate : "24/11/13"},
        {noticeNo : 2, noticeTitle : "게시글 제목2", noticeContent : "게시글 내용2", noticeWriter : "유저2", noticeDate : "24/11/12"},
        {noticeNo : 3, noticeTitle : "게시글 제목3", noticeContent : "게시글 내용3", noticeWriter : "유저3", noticeDate : "24/11/11"},
        {noticeNo : 4, noticeTitle : "게시글 제목4", noticeContent : "게시글 내용4", noticeWriter : "유저4", noticeDate : "24/11/10"},
        {noticeNo : 5, noticeTitle : "게시글 제목5", noticeContent : "게시글 내용5", noticeWriter : "유저5", noticeDate : "24/10/9"}
    ]);
    
    return(
        <div>
            <table border="1">
                <thead>
                    <th>번호</th>
                    <th>제목</th>
                    <th>내용</th>
                </thead>
                <tbody>
                    {noticeList.map(function(notice, idx){
                        return <Notice key={"notice"+idx} notice={notice}/>
                    })}
                </tbody>
            </table>
        </div>
    );
}

function Notice(props){
    let notice = props.notice;
    return (
        <tr>
            {/* 객체 전달 1) Link 태그 state 속성 이용*/}
            <td><Link to="/notice/detail" state={notice}>{notice.noticeNo}</Link></td>
            <td>{notice.noticeTitle}</td>
            <td>{notice.noticeContent}</td>
        </tr>
    );

}
export default NoticeList;