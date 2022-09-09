import React from "react";
import { useDispatch,useSelector } from "react-redux";
import { useEffect } from "react";
import { fetchProducts, getProducts } from "../../store/product";
import ProductIndexItem from "./ProductIndexItem";
import './products.css'
import funElephantBanner from './fun_elephant_banner.jpeg'

const ProductIndex = () => {
    const products = useSelector(getProducts)
    const dispatch = useDispatch()
    useEffect(()=>{
        dispatch(fetchProducts())
    },[])

    return(
        <div id="outer-index-div">
            <img id="fun-elephant-banner" src={funElephantBanner}/>
            <h1 id="Skincare-collectionHeader">skin care</h1>
            <div id="banner2-bg"></div>
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