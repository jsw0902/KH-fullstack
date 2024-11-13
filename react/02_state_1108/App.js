import logo from './logo.svg';
import './App.css';
//React Hook - state를 사용하기 위한 import
import React, {useState} from 'react';

function App() {



  //기존 회원 리스트 생성
  let [userList, setUserList] = useState([
    {name : "오해원", age : 17, addr : "주소1"},
    {name : "신류진", age : 30, addr : "주소2"},
    {name : "이영지", age : 56, addr : "주소3"}
  ]);

  // 회원 정보 등록 (JS)
  function regUser0(){
    //입력한 데이터 변수에 저장
    let nameInput = document.getElementById("name");
    let ageInput = document.getElementById("age");
    let addrInput = document.getElementById("addr");

    //입력값 변수에 저장
    let nameVal = nameInput.value;
    let ageVal = ageInput.value;
    let addrVal = addrInput.value;

    //tr 태그 생성
    let trEl = document.createElement("tr");

    //td 태그(name) 생성
    let tdEl1 = document.createElement("td");
    let tdTxtNd1 = document.createTextNode(nameVal);
    tdEl1.append(tdTxtNd1); //<td>입력이름</td>

    //td 태그(age) 생성
    let tdEl2 = document.createElement("td");
    let tdTxtNd2 = document.createTextNode(ageVal);
    tdEl2.append(tdTxtNd2); //<td>입력나이</td>

    //td 태그(addr) 생성
    let tdEl3 = document.createElement("td");
    let tdTxtNd3 = document.createTextNode(addrVal);
    tdEl3.append(tdTxtNd3); //<td>입력주소</td>

    //td 태그(분류) 생성
    let tdEl4 = document.createElement("td");
    let gbTxt = "";

    if(ageVal < 20){
      gbTxt = "급식";

    }else if(ageVal <40){
      gbTxt = "청년";

    }else{
      gbTxt = "노인";

    }
    let tdTxtNd4 = document.createTextNode(gbTxt);
    tdEl4.append(tdTxtNd4); 

    //tr 태그에, 4개의 td 태그 추가
    trEl.append(tdEl1);
    trEl.append(tdEl2);
    trEl.append(tdEl3);
    trEl.append(tdEl4);

    //tbody 태그에, tr 태그 추가
    document.getElementsByTagName("tbody")[0].append(trEl);
  } 


  //회원 정보 등록(State-1)
  function regUser1(){
    //입력 요소 객체 획득
    let nameInput = document.getElementById("name");
    let ageInput = document.getElementById("age");
    let addrInput = document.getElementById("addr");

    //입력 요소 입력값 추출
    let nameVal = nameInput.value;
    let ageVal = ageInput.value;
    let addrVal = addrInput.value;

    //userList == 객체 배열에 추가할 객체 생성
    let newUser = {name : nameVal, age : ageVal, addr : addrVal};
    
    let newUserList = [...userList]; //전개 연산자를 활용하여, 깊은 복사
    newUserList.push(newUser);

    //새로운 객체 배열을 전달하므로써 화면 재랜더링
    setUserList(newUserList);
  }

  //회원 정보 등록 state - 2
  function regUser2(){
    let nameInput = document.getElementById("name");
    let ageInput = document.getElementById("age");
    let addrInput = document.getElementById("addr");

    let nameVal = nameInput.value;
    let ageVal = ageInput.value;
    let addrVal = addrInput.value;

    //userList 객체 배열에 추가할, 객체를 생성
    let newUser = {name : nameVal, age : ageVal, addr : addrVal};
    let newUserList = [...userList, newUser]; //깊은 복사하며, 전달한 객체 추가
    setUserList(newUserList);

    //등록 후, 기존 입력값 초기화
    nameInput.value = '';
    ageInput.value = '';
    addrInput.value = '';
  }


  //회원 정보 등록 State - 3
  let [name, setName] = useState("");
  let [age, setAge] = useState(10);
  let [addr, setAddr] = useState("");

  function updName(e){
    let nameVal = e.target.value;
    setName(nameVal);
  }
  function updAge(e){
    let ageVal = e.target.value;
    setAge(ageVal);
  }
  function updAddr(e){
    let addrVal = e.target.value;
    setAddr(addrVal);
  }

  function regUser3(){
    //기존 객체 배열 깊은 복사하며, 객체 추가(속성명과 값을 가지고 있는 변수명이 일치할 때, 객체의 형태를 아래와 같이 작성할 수 있다)
    let newUserList = [...userList, {name, age, addr}];

    //등록
    setUserList(newUserList);

    //기존값 초기화
    setName("");
    setAge(10);
    setAddr("");
  }

  return (
    <div className="App">
      <table border="1">
        <thead>
          <th>이름</th>
          <th>나이</th>
          <th>주소</th>
          <th>분류</th>
          <th>삭제-1</th>
          <th>삭제-2</th>
        </thead>
        <tbody>
          { //회원 리스트 출력
             userList.map(function(item, index){
               
               /*
                 splice : 원본 배열에 영향을 미치는 함수

                 배열에서의 수정 : 배열.splice(수정하고 싶은 인덱스번호, 1, 수정할 데이터)
                 배열에서의 추가 : 배열.splice(추가하고 싶은 인덱스번호, 0, 추가할 데이터)
                 배열에서의 삭제 : 배열.splice(삭제하고 싶은 인덱스번호, 삭제할 요소 갯수)
               */ 
              function delUser1(){
                //현재 인덱스 번호를 전달하여, 현재 행 객체가 삭제될 수 있도록 처리
                userList.splice(index, 1);
                setUserList([...userList]);
              }

              /*
                filter : 배열 중, 조건에 만족하는 요소만 return하여 새로운 배열 생성
              */

                function delUser2(){
                  let noDeleteUserList = userList.filter(function(user, index){
                    /*
                      ex) 배열의 총 길이는 5. [user0, user1, user2, user3, user4]
                      
                      item : 삭제 버튼을 누른, 객체(ex. user2) 
                      user : 모든 userList 객체. (ex. [user0, user1, user2, user3, user4])

                      조건식에 의해, user2과 같지 않은!! user0, user1, user3, user4로 이루어진 새로운 배열로 반환
                    */
                    return item != user;
                  });

                  //새롭게 반환된 배열를 state 변경 함수에 전달하므로써, userlist를 화면에 다시 재랜더링
                  setUserList(noDeleteUserList);
                }

                return <tr>
                  <td>{item.name}</td>
                  <td>{item.age}</td>
                  <td>{item.addr}</td>
                  <td>
                      {item.age < 20 ? "급식" : 
                       item.age < 40 ? "청년" :
                       "노인"
                      }
                  </td>
                  <td>
                    <button onClick={delUser1}>삭제(splice)</button>
                  </td>
                  <td>
                    <button onClick={delUser2}>삭제(Filter)</button>
                    </td>
                </tr>
             })
          }
        </tbody>
      </table>

      <hr/>
      {
        //회원 정보 등록을 위한 입력 양식 태그 및 버튼
      }
      <div>
        <label htmlFor='name'>이름</label>
        <input type='text' id='name' name='name' value={name} onChange={updName}/>
      </div>
      <div>
        <label htmlFor='age'>나이</label>
        <input type='text' id='age' name='age' value={age} onChange={updAge}/>
      </div>
      <div>
        <label htmlFor='addr'>주소</label>
        <input type='text' id='addr' name='addr' value={addr} onChange={updAddr}/>
      </div>
      <div>
        <button onClick={regUser0}>회원 정보 등록(JS)</button><br/>
        <button onClick={regUser1}>회원 정보 등록(State-1)</button><br/>
        <button onClick={regUser2}>회원 정보 등록(State-2)</button><br/>
        <button onClick={regUser3}>회원 정보 등록(State-3)</button><br/>
      </div>
    </div>
  );
}

export default App;
