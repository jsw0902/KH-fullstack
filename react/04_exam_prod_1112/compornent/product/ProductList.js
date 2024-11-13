
//state를 사용하기 위한 import
import {useState} from "react";
import './productlist.css';

function ProductList(){
    //기존 상품 리스트를 state 변수로 생성
    const [productList, setProductList] = useState([
        /*
            productNo : 상품번호
            productName: 상품 이름
            productPrice : 상품 가격
            isLike : 좋아요 여부
            productImg : 이미지 경로
            Star : 별점
        */
        {
            productNo : 1,
            productName : "에어팟 프로",
            productPrice : "310,000",
            isLike : false,
            productImg : "/image/react-img-product-1.jpg",
            star : 5
        },
        {
            productNo : 2,
            productName : "추석과일 세트",
            productPrice : "200,000",
            isLike : true,
            productImg : "/image/react-img-product-2.jpg",
            star : 1
        },
        {
            productNo : 3,
            productName : "한우 세트",
            productPrice : "520,000",
            isLike : false,
            productImg : "/image/react-img-product-3.jpg",
            star : 4
        },
        {
            productNo : 4,
            productName : "에어컨",
            productPrice : "300,000",
            isLike : false,
            productImg : "/image/react-img-product-4.jpg",
            star : 2
        },
        {
            productNo : 5,
            productName : "무접점키보드",
            productPrice : "140,000",
            isLike : true,
            productImg : "/image/react-img-product-5.jpg",
            star : 1
        },
        {
            productNo : 6,
            productName : "아이콘16ProMax",
            productPrice : "1,650,000",
            isLike : false,
            productImg : "/image/react-img-product-6.jpg",
            star : 5
        }
    ]);

    return(
        <div className="product-content">
            <div className="title">
                <span>상품목록</span>
            </div>
            <div className="product-list">
                {productList.map(function(product, index){
                    /*
                        - 상품 전체 리스트(productList)를 순회하며, 각 요소당 Product 컴포넌트를 1번 호출하며, 현재 상품 객체(product)를 전달.
                        - 상품 정보의 좋아요 클릭 시, 재랜더링을 위해 productList와 setProductList를 파라미터로 전달
                    */
                    return <Product prod={product} list={productList} setList={setProductList} index={index}/>
                })}
            </div>

            {/* 
                상품 등록 Component
                - 컴포넌트 내부에서. 상품 정보를 입력받고 객체 형태로 생성하여, productList에 추가
                - 추가된 productList를 화면에 다시 랜더링 하기 위해 필요한 setProductList도 같이 전달
            */}
            <RegProduct productList={productList} setProductList={setProductList}/>
        </div>
    );
}

//상품 1개 정보를 JSX 문법으로 화면에 표기하기 위한 컴포넌트
function Product(props){
    //props : 현재 Product 컴포넌트 호출 시, 전달받은 파라미터를 객체 형태로 저장하고 있음.

    let product = props.prod;           //상품 1개 정보를 저장하고 있는, 객체

    //좋아요 여부 반영을 위해 필요한 값's
    let productList = props.list;       //상품 전체 리스트
    let setProductList = props.setList; //상품 리스트 변경 시, 호출 함수
    let index = props.index;            //현재 전달받은 상품 객체가, 배열의 몇번째 요소에 해당하는지

    //좋아요
    function like(){
        /* 
            isLike == boolean

            true => false로 변경하여 좋아요 취소
            false => true로 변경하여 좋아요

            현재 값에 따라 이벤트 핸들러를 분리하여 작성할 필요 없이,
            현재 값을 반전 시켜주면 처리할 수 있음. (즉, 하나의 이벤트 핸들러를 처리)
        */


        product.isLike = !product.isLike

        /*
            변경된 isList 값을, 화면에 다시 표기하고 싶음.
            -> productList를 변경해야함
            -> productList == state 변수
            -> state 변수 변경할 때 -> 변수 선언 시, 같이 선언한 set함수에 새로운 값을 전달.
        */ 
        productList[index] = product;
        setProductList([...productList]);
    }

    return(
        <div className="product">
            <div className="product-img">
                {/*
                    src == 이미지 경로 == product 객체 내부에 속성으로 존재. javascript 표현식 사용을 위해 중괄호 내부에 작성
                */}
                <img className="img" src={product.productImg}/>
            </div>
            <div className="product-info">
                <div className="product-title">{product.productName}</div>
            </div>
            <div className="product-price">
                <div className="product-price">{product.productPrice}</div>
                <span>원</span>
            </div>
            <div className="star-rate">
                <StarRate star={product.star} />
            </div>
            <div className="like">{/*삼항연산자 : true일때는 ? 뒤에 ture시 해줄거 작성, false일때는 : 뒤에 false시 해줄거 작성*/}
                {product.isLike
                 ? <span onClick={like}>♥</span>
                 : <span onClick={like}>♡</span>
                }
            </div>
        </div>
    );
}

//전달받은 별점에 따라 ★ 생성하는 컴포넌트
function StarRate(props){
    let star = props.star; //별점 정보 (숫자 자료형이므로 map 사용 불가)

    const arr = new Array();

    //별점 갯수만큼 반복하며 span 태그 생성
    for(let i=0; i<star; i++){
        arr.push(
            <span key={"star"+1}>★</span>
        );
    }

    return(
        <>
            { //배열을 순회하지 않고, 아래와 같이 배열 명칭을 작성하면 요소들을 붙여서 출력함
            arr
            }
        </>
    );
}

//상품 등록 컴포넌트
function RegProduct(props){
    let productlist = props.productList;
    let setProductList = props.setProductList;

    //state 변수를 이용한 각 입력값 상태 관리

    let [productNo, setProductNo] = useState("");
    let [productName, setProductName] = useState("");
    let [productPrice, setProductPrice] = useState(0);
    let [star, setStar] = useState(0);
    let [productImg, setProductImg] = useState("");

    function chgVal(e){
        let inputElId = e.target.id;         //이벤트가 발생한 요소의 ID
        let inputElVal = e.target.value;     //이벤트가 발생한 요소의 value 값

        if(inputElId == 'productNo'){
            setProductNo(inputElVal);
        } else if(inputElId == 'productName'){
            setProductName(inputElVal);
        } else if(inputElId == 'productPrice'){
            setProductPrice(inputElVal);
        } else if(inputElId == 'star'){
            setStar(inputElVal);
        }else{
            setProductImg(inputElVal);
        }
    }
    //상품 등록
    function RegProd(){
        //새로운 productList를 생성하여, setProductList에 매개변수로 전달하는 행위 == 최종적으로 이루어질 행위

        let newProduct = {
            productNo        : productNo,
            productName      : productName,
            productPrice     : productPrice,
            isLike           : false,
            productImg       : productImg,
            star             : star
        };
    
        // 상품 리스트에 새로운 상품 추가
        productlist.push(newProduct);
        setProductList([...productlist]);
    }

    return(
        <div className="reg-wrap">
            <div>
                <label htmlFor="productNo">상품번호</label>
                <input type="text" id="productNo" value={productNo} onChange={chgVal}/>
            </div>
            <div>
                <label htmlFor="productName">상품이름</label>
                <input type="text" id="productName" value={productName} onChange={chgVal}/>
            </div>
            <div>
                <label htmlFor="productPrice">상품가격</label>
                <input type="text" id="productPrice" value={productPrice} onChange={chgVal}/>
            </div>
            <div>
                <label htmlFor="star">별점</label>
                <input type="text" id="star" value={star} onChange={chgVal}/>
            </div>
            <div>
                <label htmlFor="productImg">이미지 경로</label>
                <input type="text" id="productImg" value={productImg} onChange={chgVal}/>
            </div>
            <div>
                <button onClick={RegProd}>상품등록</button>
            </div>
        </div>
    );
}

export default ProductList;