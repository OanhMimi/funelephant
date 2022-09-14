import React from "react";
import "./PinkNavBar.css";
import { FaHeart } from "react-icons/fa";
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

              {/* <select className="quantity">
                                <option value="1" >1</option>
                                <option value="2" >2</option>
                                <option value="3" >3</option>
                                <option value="4" >4</option>
                                <option value="5" >5</option>
                                <option value="6" >6</option>
                                <option value="7" >7</option>
                                <option value="8" >8</option>
                                <option value="9" >9</option>
                                <option value="10" >10</option>
                            </select> */}
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
