import React from "react";
import { NavLink} from "react-router-dom";
import './products.css'
import { FaStar } from 'react-icons/fa';


const ProductIndexItem = ({product}) => {

    const showStar = (rating)=>{
        if (rating === null || rating < 0){
             return (
                 <div>
                     <FaStar id="star"/>
                     <FaStar id="no-star"/>
                     <FaStar id="no-star"/>
                     <FaStar id="no-star"/>
                     <FaStar id="no-star"/>
                 </div>
             )
         } 
        if (rating<2){
         return (
             <div>
                 <FaStar id="star"/>
                 <FaStar id="no-star"/>
                 <FaStar id="no-star"/>
                 <FaStar id="no-star"/>
                 <FaStar id="no-star"/>
              </div>
         )
         } 
         if (rating<3){
                  return (
             <div>
                 <FaStar id="star"/>
                 <FaStar id="star"/>
                 <FaStar id="no-star"/>
                 <FaStar id="no-star"/>
                 <FaStar id="no-star"/>
              </div>
         )
         } 
         if (rating<4){
                  return (
             <div>
                 <FaStar id="star"/>
                 <FaStar id="star"/>
                 <FaStar id="star"/>
                 <FaStar id="no-star"/>
                 <FaStar id="no-star"/>
              </div>
         )
         } 
         if (rating<5){
                  return (
             <div>
                 <FaStar id="star"/>
                 <FaStar id="star"/>
                 <FaStar id="star"/>
                 <FaStar id="star"/>
                 <FaStar id="no-star"/>
              </div>
         )
         } 
         if (rating === 5) {
            return(
            <div>
                <FaStar id="star"/>
                <FaStar id="star"/>
                <FaStar id="star"/>
                <FaStar id="star"/>
                <FaStar id="star"/>
             </div>
            )
         }
     }

    return(
        <div id="outer-product-index-item">
            <NavLink className="nav-link-products" to={`/products/${product.id}`}>
                <img id="individual-img" src={product.photoUrl[0]}/>
                <div id="individual-item-name">
                    <div id="product-info-name">{product.name}</div>
                    <div id="product-info">${product.price}.00</div>
                    <div className="rating-display-index">
                        <li>{showStar(product.avgReview)}</li>
                        <li>{product.avgReview} <span> (</span>{product.numReviews}<span>) </span></li>
                    </div>
                        
                </div>
            </NavLink>
        </div>
    )
}

export default ProductIndexItem;