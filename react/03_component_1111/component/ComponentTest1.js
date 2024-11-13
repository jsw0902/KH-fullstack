// 외부 컴포넌트 작성
function UserComponent3() {
    return(
        <>
        {/* JSX는 하나의 루트 태그만이 존재하므로 임시 태그 생성 */}
        <div>
            <hr/>
            <h3>세번째 컴포넌트(외부) 작성</h3>
        </div>
        {/* UserComponent4 포함 */}
        <UserComponent4/>
        </>
        
    );
}
function UserComponent4() {
    return(
        <div>
            <hr/>
            <h3>네번째 컴포넌트(외부) 작성</h3>
        </div>
    );
}

//작성한 컴포넌트 App 컴포넌에서 사용할 수 있도록 지정.
export default UserComponent3;