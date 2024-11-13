import logo from './logo.svg';
import './App.css';

//외부에 작성된 컴포넌트를 사용하기 위한, import
import UserComponent3 from './component/ComponentTest1';

//export할 때, 중괄호 안에 나열된 컴포넌트는 import할때에도 동일한 형식으로 작성해야 한다.
import {UserComponent5, UserComponent6} from './component/ComponentTest2';

//state 사용하기 위한 import
import { useState } from 'react';

function App() {
  /*
    컴포넌트(Component) : 사용자에게 보여지는 UI 요소들을 구성하는 단위.
     - 재사용 가능한 단위로 분리.
  */ 

  const [str, setStr] = useState("hello React !");
  const [num, setNum] = useState(100);
  const [arr, setArr] = useState([1,2,3,4,5]);
  const [obj, setObj] = useState({name : "유저", age : 10, addr : "경기 부천"});


  return (
    <div className="App">
      <h1>컴포넌트 프로젝트</h1>

      <hr/>

      {/* 사용자 정의 컴포넌트 화면에 포함시키기 */}
      <UserComponent1/>
      <UserComponent2/>
      <UserComponent1/>
      <UserComponent2/>

      {/* 
        외부에서 작성된 컴포넌트 화면에 포함
        - import (컴포넌트를 사용할 파일에 작성)
        - export (컴포넌트가 작성된 파일에 작성)

        - 아래 UserComponent3은, UserComponent4을 포함하고 있으므로, 화면에 모두 출력된다.
        - 아래 UserComponent5,6은 독립적인 컴포넌트이므로, 각각 화면에 출력해주어야한다. 
      */}
      <UserComponent3/>
      <UserComponent5/>
      <UserComponent6/>

      {/*
        React는 하나의 화면에 여러개의 컴포넌트들을 조합한 형태
        컴포넌트들끼지 값을 공유해야할 때, 아래와 같이 속성=값 형태로 작성
      */}
      <UserComponent7 param1="UserComponent7에 전달한 문자열" param2="50"/>
      <UserComponent8 str={str} num={num}/>
      <UserComponent9 arr={arr} obj={obj}/>

      {/*
        컴포넌트에 전달한 state 변수 변경 시,
        정의된 setter 함수도 같이 전달하여 변경할 수 있다.
      */}
      <UserComponent10 obj={obj} setObj={setObj}/>
      <UserComponent11 arr={arr} setArr={setArr}/>
    </div>
  );
}

/* 
  - 사용자 정의 컴포넌트
  - 일반 함수와 다르게 첫 글자를 대문자로 작성.
  - App 컴포넌트와 동일하게, JSX를 리턴
*/
function UserComponent1() {
  return(
    <div>
      <hr/>
      <h3>첫번째 컴포넌트 생성</h3>
    </div>
  );
}

const UserComponent2 = function(){
  return(
    <div>
      <hr/>
      <h3>두번째 컴포넌트 생성</h3>
    </div>
  );
}
/*
  - 객체 형태 전달받은 값들이 출력됨.
*/
function UserComponent7(props) {
  //console.log(props);
  let param1 = props.param1;
  let param2 = props.param2;

  return(
    <div>
      <hr/>
      <h3>일곱번째 컴포넌트 생성</h3>
      <span>{param1}</span>
      <span>{param2}</span>
    </div>
  );
}

function UserComponent8(props) {
  let str = props.str;
  let num = props.num;
  return(
    <div>
      <hr/>
      <h3>여덟번째 컴포넌트 생성</h3>
      <span>{str}</span>
      <span>{num}</span>
    </div>
  );
}

function UserComponent9(props) {
  let arr = props.arr;
  let obj = props.obj;

  return(
    <div>
      <hr/>
      <h3>아홉번째 컴포넌트 생성</h3>
      <ul>
        {arr.map(function(item, index){
          return <li key={index}>{item}</li>
        })}
      </ul>
      <ul>
        <li>이름 : {obj.name}</li>
        <li>나이 : {obj.age}</li>
        <li>주소 : {obj.addr}</li>
      </ul>
    </div>
  );
}
function UserComponent10(props){
  let obj = props.obj;
  let setObj = props.setObj;

  function chgName(){
    obj.name = "장승원";

    let newObj = {...obj}; // 별도 주소를 가지는, 새로운 객체 생성
    setObj(newObj);        // state 변경 함수에, 새로운 객체 전달
  }
  return (
    <div>
      <hr/>
      <p>이름 : {obj.name}</p>
      <p>나이 : {obj.age}</p>
      <p>주소 : {obj.addr}</p>
      <button onClick={chgName}>이름 변경</button>
    </div>
  );
}

/*
  state 변수(배열)를 전달받고, 

  - 화면에 출력
  - 추가할 숫자 입력받아, 배열에 추가
  - 단 숫자 입력받을 때, input의 value는 state를 활용하여 작성
*/
function UserComponent11(props){
  
  const arr = props.arr;
  const setArr = props.setArr;
  const [addNum, setAddNum] = useState("20"); //숫자 입력 input 태그 value 속성값
  
  //input 입력 시, state 변경 함수 : chgValue
  function chgValue(e) {
    setAddNum(e.target.value);
  }

  //배열에 값 추가시, 동작 함수 : pushArr
  function pushArr() {
    /*
      배열 == state
      state 변경 시 == setState(변경 시 호출 함수)에 매개변수로 값을 전달.
      전달할 배열에, 값을 추가해서 전달.
      추가할 값 == input 태그에 입력한 값
      input 태그에 입력한 값 == state 변수
    */
   setArr([...arr, addNum]);
   setAddNum("");
  }
  return (
    <>
    <hr/>
    <ul>
      {arr.map(function(item, index){
      return <li key={index}>{item}</li>
      })}
    </ul>
    <div>
      <label htmlFor='addNum'>추가할 숫자 입력</label>
      <input type="text" id='addNum' value={addNum} onChange={chgValue}></input>
      <button onClick={pushArr}>배열에 값 추가</button>
    </div>
    </>
  );
}

export default App;
