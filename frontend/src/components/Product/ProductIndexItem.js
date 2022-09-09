import React from "react";
import { NavLink } from "react-router-dom";
import './products.css'



const ProductIndexItem = ({product}) => {
    return(
        <div id="outer-product-index-item">
            <NavLink class="nav-link-products" to={`/products/${product.id}`}>
                <img id="individual-img" src={product.photoUrl}/>
                <div id="individual-item-name">
                    <ul id="product-info">{product.name}</ul>
                    <ul id="product-info">${product.price}.00</ul>
                </div>
            </NavLink>
            
        </div>
    )
}

export default ProductIndexItem;