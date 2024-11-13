function UserComponent5() {
    return(
        <div>
            <hr/>
            <h3>다섯번째 컴포넌트(외부) 작성</h3>
        </div>
    );
}

function UserComponent6() {
    return(
        <div>
            <hr/>
            <h3>여섯번째 컴포넌트(외부) 작성</h3>
        </div>
    );
}
//여러개의 컴포넌트를 export할 때 중괄호 안에 나열.
export {UserComponent5, UserComponent6};