import React, {useState} from "react";
import { useDispatch,useSelector } from "react-redux";
import { useEffect } from "react";
import { fetchProducts, getProducts } from "../../store/product";
import ProductIndexItem from "./ProductIndexItem";
import './products.css'
import funElephantBanner from './fun_elephant_banner.jpeg'
import { AiOutlineDown } from "react-icons/ai";
import  {AiOutlineUp } from "react-icons/ai";
import { Link } from "react-router-dom";


const ProductIndex = () => {
    const products = useSelector(getProducts);
    const dispatch = useDispatch();
    useEffect(()=>{
        dispatch(fetchProducts());
    },[])

    const [showSlideDown,setShowSlideDown] = useState(false);






    return(
        <div id="outer-index-div">
            <img id="fun-elephant-banner" src={funElephantBanner}/>
            <h1 id="Skincare-collectionHeader">skin care</h1>
            <div id="banner2-bg">
                <div className="press-to-slide-down">
                    <button id ="slide-down" type="button" onClick={()=> setShowSlideDown(!showSlideDown)}>
                            <div className='slide-down-icon'>{showSlideDown ? 
                                <AiOutlineUp id="up-menu-icon"/>: <AiOutlineDown id="down-menu-icon"/>               
                            }</div>
                            {showSlideDown && <div className='collapse-content'> 
                                <div id="links">
                                    <Link exact to ="/">Home</Link>
                                    <Link exact to ="/profile">Profile</Link>
                                </div>
                            
                            </div>}
                    </button>
                    <h2 id="skin-care-drop-down">SKIN CARE</h2>
                </div>
             </div>
            <div id="display-all-products">
                {products.map(product=>(
                    <ProductIndexItem product={product} key={product.id}/>
                ))} 
            </div>
               
        </div>
      
        
    )

}

export default ProductIndex;


{/* <div className='collapse'>
<button className='desc-button' onClick={() => setIsOpen(!isOpen)}>
    DESCRIPTION
    <div className='desc-icon'>{isOpen ? 
    <i className="fa-solid fa-arrow-up"></i> :               
    <i className="fa-solid fa-arrow-down"></i> 
}</div>
    </button>
    {isOpen && <div className='collapse-content'>{product.description}</div>}
</div> */}
