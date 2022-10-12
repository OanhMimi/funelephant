import React, { useEffect,useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { fetchProducts } from "../../store/product";
import funElephantBanner from './fun_elephant_banner.jpeg';
import './products.css';
import { AiOutlineDown } from "react-icons/ai";
import  {AiOutlineUp } from "react-icons/ai";
import { Link } from "react-router-dom";
import ProductIndexItem from "./ProductIndexItem";



const HairCareIndex = () => {
    const dispatch = useDispatch();
    const products = useSelector(state => Object.values(state.products))
    
    const filterProducts = () => {
        const hairProducts = [];

        for (let product of products) {
            if (product.category === 'HAIR CARE') {
                hairProducts.push(product);
            }
        }

        return hairProducts;
    }

    const hairProducts = filterProducts();
    
    useEffect(() => {
        dispatch(fetchProducts())
    }, [])

    const [showSlideDown,setShowSlideDown] = useState(false);


    return (
        <>
            <div id="outer-index-div">
                <div className="fun-elephant-banner-header">
                    <img id="fun-elephant-banner" src={funElephantBanner}/>
                    <h1 id="all-collectionHeader">hair care</h1>
                </div>
                <div className="banner2-bg">
                    <div className="press-to-slide-down" onClick={()=> setShowSlideDown(!showSlideDown)}>
                        <div id ="slide-down">
                                {showSlideDown ? <AiOutlineUp id="up-menu-icon"/>: <AiOutlineDown id="down-menu-icon"/>}
                        </div>
                        <div id="skincare-dropdown">HAIR CARE</div>
                    </div>
                </div>
                <div>

                    {showSlideDown && <div id='banner2-dropdown'> 
                                        <div id="links">
                                            <Link  id="link-deco"exact to ="/products">COLLECTIONS</Link>
                                            <Link id="link-deco"exact to ="/products/skincare">SKIN CARE</Link>
                                            <Link id="link-deco"exact to ="/products/gifts">GIFTS</Link>
                                        </div>
                                    </div>}
                </div>

                <div id="display-all-products">
                    {hairProducts.map(product=>(
                        <ProductIndexItem product={product} key={product.id}/>
                    ))} 
                </div>
          
            </div>
        </>
    )
}

export default HairCareIndex;