import React, {useState,useEffect} from "react";
import { useDispatch,useSelector } from "react-redux";
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
            <h1 id="all-collectionHeader1">shop all collections</h1>
            <div id="banner2-bg">
                <div className="press-to-slide-down" onClick={()=> setShowSlideDown(!showSlideDown)}>
                    <div id ="slide-down">
                            {showSlideDown ? <AiOutlineUp id="up-menu-icon"/>: <AiOutlineDown id="down-menu-icon"/>}
                    </div>
                    <div id="skincare-dropdown">COLLECTIONS</div>
                </div>
            </div>
            <div>

                {showSlideDown && <div id='banner2-dropdown'> 
                                    <div id="links">
                                        <Link id="link-deco" exact to ="/products/skincare">SKIN CARE</Link>
                                        <Link id="link-deco" exact to ="/products/haircare">HAIR CARE</Link>
                                        <Link  id="link-deco" exact to ="/products/gifts">GIFTS</Link>

                                    </div>
                                </div>}
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
