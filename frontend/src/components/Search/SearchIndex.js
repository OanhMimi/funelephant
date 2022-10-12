import './Search.css'
import { useState, useEffect } from 'react';
import { fetchProducts, getProducts } from '../../store/product';
import { useSelector, useDispatch } from 'react-redux';
import ProductIndexItem from '../Product/ProductIndexItem';

const SearchIndex = ({setShowSearchBar}) => {

    const dispatch = useDispatch();

    const [results, setResults] = useState([]);
    const [searchField, setSearchField] = useState("");

    const products = useSelector(getProducts);
    

    useEffect(()=>{
        dispatch(fetchProducts())
    },[])

    const handleChange = (e) => {
        setSearchField(e.target.value);

        if (e.target.value === "") {
            return setResults([]);
        }

        const filteredProducts = [];
        products.map(product=>{
            if(product.name.toLowerCase().includes(e.target.value.toLowerCase())){
                filteredProducts.push(product)
            }
        })
        setResults(filteredProducts)
    }
 
  
    return(
        <div className="search-bar-container"> 
            <div className="search-nav-container">
                <input 
                    id="search-id"
                    type="text"
                    value={searchField}
                    onChange={handleChange}
                /> 
            </div> 
                {/* {results.length !== 0 ? results.map(product => {
                    return <SearchShow product={product} key={product.id}/>
                }) : <div>No Results</div>} */}
            <div id="search-container">
                  { results.length !== 0? results.map(product => {
                    return<ProductIndexItem product={product} key={product.id}/>
                }) : <div id="no-results"> Please enter the name of the item you want to search</div>}
            </div>
            
        </div>
    )
}

export default SearchIndex;