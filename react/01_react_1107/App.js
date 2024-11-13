import logo from './logo.svg';
import './App.css';
//useState를 사용하기 위한 import
import React, {useEffect, useState} from 'react';

/*
  React : 페이스북에서 발표한, 사용자 인터페이스(프론트엔드) 라이브러리.
    - SPA(Single Page Application) : 하나의 페이지를 랜더링하고, 페이지 내부 영역만 변경되는 애플리케이션 
    - 페이지 내부의 각 영역을 컴포넌트라는 단위로 쪼개어 상태를 관리한다.

/* 1) 스타일 지정
  - 상단에 App.css를 import 하고 있으므로, 해당 파일에 CSS 작성
  - 자바스크립트 영역에서 객체 형태의 스타일을 정의하고, 태그에 적용하는 방법
*/

let style1 = { color : 'red', fontSize : '30px'}; //기존 -로 연결된 CSS 속성 -> 카멜 표기법으로 작성

//2) 데이터 바인딩
let strTest = "서버에서 응답한 데이터";

/*3) JSX (Javascript Xml, or JavaScript Extension) : 자바스크립트를 확장한 문법
  - JSX는 단 하나의 후트 태그만이 존재할 수 있다.
  - JSX 문법에서 자바스크립트 표현식을 작성할때는 중괄호 {}를 이용한다.
  - JSX 문법 내부에서 if, for문은 표현식이 아니므로 사용이 불가능하다.
  - 기존 class 속성은 className으로 작성하고, <lable htmlFor="id">문자열<lable>
*/
let htmlTag1 = <div style={{color : 'red', backgroundColor : 'blue'}}>JSX로 생성 </div>;
let htmlTag2 = <div style={{color : 'blue', backgroundColor : 'red'}}>
                  <span>JSX로 생성한 문자열2</span>
                  <ul>
                    <li>목록1</li>
                    <li>목록2</li>
                    <li>목록3</li>
                  </ul>
              </div>;


let arrTest = [1, "str", true, {how : "just do it"}, [1,2,3]];

// 구조 분해 할당
let [test1, test2, test3] = [1, "test", true];


function App() {

  /*
      4) state : 상태 관리 기법

      [표현식]
      let [변수명, 데이터 변경 시 호출할 함수명] = useState(초기값);

      - React Hook > useState 함수를 이용해서, 유동적인 데이터의 상태를 관리한다.
  */
 
  let [str1, setStr1] = useState("state 문자열1");
  function updateStr1(){
    let updStr = "state 변경 문자열~~~~~~~";

    setStr1(updStr); //useState 사용 시, 반환된 함수로 state 변수의 값을 변경한다.

    //console.log(str1); //기존 문자열이 출력됨.
  }

  useEffect(function(){
    console.log('useEffect : ' + str1);
  }, [str1])

  let [num, setNum] = useState(10);
  function updateNum(){
    setNum(200);
  }

  let [testArr, setTestArr] = useState([1,2,3,4,5]);



  function updateArr1(){
    testArr[2] = 100;
    setTestArr(testArr); //배열은 주소값을 가지고 있는 객체. 내부 요소 값이 변경된것이지 배열의 주소는 동일하므로, state가 변경된 상태를 인지하지 못하고 있다.

    //해결방법) 독립적인 메모리 주소값을 가진 새로운 배열을 매개변수로 전달해주면 된다.
  }
  function updateArr2(){
    let newArr = new Array(); //새로운 배열 생성

    //새로운 배열에 state 배열 요소값을 직접 복사
    for(let i=0; i<testArr.length; i++){
      newArr[i] = testArr[i];
    }

    newArr[2] = 100;
    setTestArr(newArr);
  }
  function updateArr3(){
    let newArr = [...testArr]; //전개 연산자를 통한 깊은 복사
    newArr[3] = 9;
    setTestArr(newArr);

  }
  function updateArr4(){
    let newArr = [...testArr];
    newArr.push(6); //배열 마지막 요소로 추가
    newArr.push(7);
    setTestArr(newArr);
  }
  function updateArr5(){
    let newArr = [...testArr, 8, 9]; //복사하면서 전달한 요소값을 배열의 요소로 추가
    setTestArr(newArr);
  }

  //객체 State
  let [userObj, setUserObj] = useState({name : "카리나", age : 20, addr : "경기 부천시"});

  function updateObj1(){
    userObj.name = "장승원";
    setUserObj(userObj);
  }

  function updateObj2(){
    let newObj = {...userObj};
    newObj.name = "윈터";
    setUserObj(newObj);
  }
  function updateObj3(){
    let newObj = {...userObj, addr : "서울 강남", hobby : "필라테스"}; //기존에 존재하는 속성 == 수정, 가존에 없는 속성 == 추가
    setUserObj(newObj);
  }
  return (
    <div className="App">
      <div className="black-nav">React Start !</div>
      <div style={style1}>style Test</div>
      <h5>{strTest
          //자바스크립트 표현식 작성 구문이므로, //주석 작성 가능
        }</h5>

        <hr/>
        <hr></hr>

        {htmlTag1}
        {htmlTag2 == "a" ? "true" : "false"}

        <br></br><br></br>

        <span>{str1}</span><br/>
        <p>{str1}</p><br/>
        <a>{str1}</a><br/>
        <div>{str1}</div><br/>
        <label>{str1}</label><br/>

        <button onClick={updateStr1}>State 문자열 변경</button>

        <br/><br/>

        num 값 : {num} <br/>
        <button onClick={updateNum}>State Number 변경</button>

        <br/><br/>

        배열 : 
        <ul>
          {testArr.map(function(item, index){
            return <li key={index}>{item}</li>
          })}
        </ul>
        <br/>
        <button onClick={updateArr1}>State 배열 변경1</button><br/>
        <button onClick={updateArr2}>State 배열 변경2</button><br/>
        <button onClick={updateArr3}>State 배열 변경3</button><br/>
        <button onClick={updateArr4}>State 배열 변경4</button><br/>
        <button onClick={updateArr5}>State 배열 변경5</button><br/>

        <br/><br/>

        객체 : 
        <ul>
          {Object.entries(userObj).map(function([key, value]){
              return <li key={key}> {key} : {value}</li>;
          })}
        </ul>

        <button onClick={updateObj1}>State 객체 변경 1</button><br/>
        <button onClick={updateObj2}>State 객체 변경 2</button><br/>
        <button onClick={updateObj3}>State 객체 변경 3</button><br/>
    </div>
  );
}

export default App;
