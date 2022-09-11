import React from "react";
import { useDispatch,useSelector } from "react-redux";
import { useEffect } from "react";
import { fetchProducts, getProducts } from "../../store/product";
import ProductIndexItem from "./ProductIndexItem";
import './products.css'
import funElephantBanner from './fun_elephant_banner.jpeg'
import { AiOutlineDown } from "react-icons/ai";
import IndexSlideOutMenu from "../IndexSlideOutMenu/IndexSlideOutMenu";


const ProductIndex = () => {
    const products = useSelector(getProducts)
    const dispatch = useDispatch()
    useEffect(()=>{
        dispatch(fetchProducts())
    },[])

    const handleClick = (e) => {
        e.preventDefault();
        let slideDownModal = document.getElementById("slide-down-modal")
        slideDownModal.style.display = "block"
    }

    return(
        <div id="outer-index-div">
            <img id="fun-elephant-banner" src={funElephantBanner}/>
            <h1 id="Skincare-collectionHeader">skin care</h1>
            <div id="banner2-bg"></div>
            <div>
                <button onClick={handleClick} id ="slide-down" type="button">
                        <AiOutlineDown className="down-menu-icon"/>
                </button>
            </div>
            <IndexSlideOutMenu/>
            <h2 id="skin-care-drop-down">SKIN CARE</h2>
            <div id="display-all-products">
                {products.map(product=>(
                    <ProductIndexItem product={product} key={product.id}/>
                ))} 
            </div>
               
        </div>
      
        
    )

}

export default ProductIndex;