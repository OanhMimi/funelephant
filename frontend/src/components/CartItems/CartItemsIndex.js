import "./CartItemIndex.css";
import { useSelector, useDispatch } from "react-redux";
import { getCartItems, fetchCartItems } from "../../store/cartItems";
import { useEffect, useState } from "react";
import { deleteCartItem } from "../../store/cartItems";
import CartItem from "./CartItem";

const CartItemIndex = ({ setShowCartItems }) => {
  const dispatch = useDispatch();
  const cartItems = useSelector(getCartItems);
  
  useEffect(() => {
      dispatch(fetchCartItems());
    }, [dispatch]);



  return (
    <>
      <div className="container-for-cart"></div>
      <div className="container-for-cart-box">
        <div className="cartItemIndex-container">
          <div className="container-2-top">
            <button
              id="close-cart-item"
              onClick={() => setShowCartItems(false)}
            >
              X
            </button>
            <h1>Shopping Bag</h1>
            <div className="cart-items-contents">
              {cartItems.map((cartItem) => (
                <CartItem cartItem={cartItem}/>
                // <div className="items-in-my-cart">
                //   <div id="img-in-cart">
                //     <img id="cart-item-img" src={cartItem.productImage} />
                //   </div>
                //   <div className="product-info">
                //     <div>{cartItem.productName}</div>
                //     <div id="subtotal">
                //       <div>
                //         <button onClick={handleQuantity("negative")}>-</button>
                //         QTY: {cartItem.quantity}
                //         <button onClick={handleQuantity("positive")}>+</button>
                //       </div>
                //       <div>{cartItem.quantity * cartItem.productPrice}</div>
                //     </div>
                //     <button
                //       id="remove-item"
                //       onClick={() => dispatch(deleteCartItem(cartItem.id))}
                //     >
                //       Remove
                //     </button>
                //   </div>
                // </div>
              ))}
            </div>
          </div>
          <div className="container-2-bottom">
            <div className="order-total">
              <div className="cart-item-total">
                <div>Order SubTotal</div>
                <div>Item Quantity</div>
              </div>
            </div>
            <div className="check-out-btn">
              <div>Checkout</div>
            </div>
          </div>
        </div>
      </div>
    </>
  );
};

export default CartItemIndex;
