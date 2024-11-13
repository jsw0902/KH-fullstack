import logo from './logo.svg';
import './App.css';

//Header 컴포넌트를 현재 컴포넌트에 포함시키기 위한 import
import Header from './compornent/common/Header';
import Footer from './compornent/common/Footer';
import ProductList from './compornent/product/ProductList';

function App() {
  return (
    <div className="App">
      <Header/>       {/* Header 컴포넌트 */}
      <ProductList/>  {/* ProductList 컴포넌트 */}
      <Footer/>       {/* Footer 컴포넌트 */}
    </div>
  );
}

export default App;
