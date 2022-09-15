import React from "react";
import "./PinkNavBar.css";
import { FaHeart } from "react-icons/fa";
import { FaStar } from "react-icons/fa";

import { FaRegHeart } from "react-icons/fa";
import { useState, useEffect } from "react";
import CartItemIndex from "../CartItems/CartItemsIndex";
import { useDispatch, useSelector } from "react-redux";
import {
  createCartItem,
  getCartItems,
  updateCartItem,
  fetchCartItems,
} from "../../store/cartItems";
import { RiContactsBookLine } from "react-icons/ri";

const PinkNavBar = ({ product }) => {
  const dispatch = useDispatch();
  const user = useSelector((state) => state.session.user);
  const [showCartItems, setShowCartItems] = useState(false);
  const cartItems = useSelector(getCartItems);
  const [itemQuantity, setItemQuantity] = useState(1);

  const showStar = (rating)=>{
    if (rating === null || rating < 0){
         return (
             <div>
                 <FaStar id="starFull"/>
                 <FaStar id="noStar"/>
                 <FaStar id="noStar"/>
                 <FaStar id="noStar"/>
                 <FaStar id="noStar"/>
             </div>
         )
     } 
    if (rating<2){
     return (
         <div>
             <FaStar id="starFull"/>
             <FaStar id="noStar"/>
             <FaStar id="noStar"/>
             <FaStar id="noStar"/>
             <FaStar id="noStar"/>
          </div>
     )
     } 
     if (rating<3){
              return (
         <div>
             <FaStar id="starFull"/>
             <FaStar id="starFull"/>
             <FaStar id="noStar"/>
             <FaStar id="noStar"/>
             <FaStar id="noStar"/>
          </div>
     )
     } 
     if (rating<4){
              return (
         <div>
             <FaStar id="starFull"/>
             <FaStar id="starFull"/>
             <FaStar id="starFull"/>
             <FaStar id="noStar"/>
             <FaStar id="noStar"/>
          </div>
     )
     } 
     if (rating<5){
              return (
         <div>
             <FaStar id="starFull"/>
             <FaStar id="starFull"/>
             <FaStar id="starFull"/>
             <FaStar id="starFull"/>
             <FaStar id="noStar"/>
          </div>
     )
     } 
     if (rating === 5) {
        return(
        <div>
            <FaStar id="starFull"/>
            <FaStar id="starFull"/>
            <FaStar id="starFull"/>
            <FaStar id="starFull"/>
            <FaStar id="starFull"/>
         </div>
        )
     }
 }

  useEffect(() => {
    dispatch(fetchCartItems());
  }, []);

  const handleClick = (e) => {
    e.preventDefault();
    setShowCartItems(true);
    debugger;
    console.log(itemQuantity);
    const item = {
      cartItem: {
        productId: product.id,
        userId: user.id,
        quantity: itemQuantity,
      },
    };
    for (let cartItem of cartItems) {
      if (cartItem.productId === product.id) {
        debugger;
        return dispatch(updateCartItem(cartItem.id, item));
      }
    }

    return dispatch(createCartItem(item));
  };

  const [fullHeart, setFullHeart] = useState(false);
  const handleHeart = (e) => {
    e.preventDefault();
  };

  return (
    <div className="pink-nav-sticky">
      <div id="pink-bar-display">
        <div id="first-pink-bar-display">
          <ul id="pink-nav-display-show1">{product.name}</ul>
          <ul id="pink-nav-display-show2">${product.price}.00</ul>
          <div id="show-star-on-pinkNav">{showStar(product.avgReview)}</div>
          <ul>{product.avgReview}</ul>
          <ul></ul>
        </div>
        <div id="second-pink-bar-display">
          <div className="select">
            <div id="qty-text">QTY</div>
            <div id="selected-qty">
              <select
                onChange={(e) => setItemQuantity(e.target.value)}
                className="quantity"
              >
                {[...Array(10)].map((numItem, i) => {
                  const quantityValue = i + 1;
                  return <option value={quantityValue}>{quantityValue}</option>;
                })}
              </select>
            </div>
          </div>
          <div>
            <button onClick={handleClick} id="buy-button">
              Buy
            </button>
          </div>
          <div onClick={() => setFullHeart(!fullHeart)} id="likes-icon">
            {fullHeart ? (
              <FaHeart id="fa-heart" />
            ) : (
              <FaRegHeart id="fa-heart-reg" />
            )}
          </div>
        </div>
      </div>
      {showCartItems && <CartItemIndex setShowCartItems={setShowCartItems} />}
    </div>
  );
};

export default PinkNavBar;
