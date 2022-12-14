import "./CartItemIndex.css";
import { useSelector, useDispatch } from "react-redux";
import { getCartItems, fetchCartItems } from "../../store/cartItems";
import { useEffect } from "react";
import CartItem from "./CartItem";
import { NavLink } from "react-router-dom";
import { GrClose } from "react-icons/gr";

const CartItemIndex = ({ setShowCartItems }) => {
  const dispatch = useDispatch();
  const cartItems = useSelector(getCartItems);
  
  useEffect(() => {
      dispatch(fetchCartItems());
    }, [dispatch]);


  const getSubtotal = (cartItems) => {
    let subtotal= 0;
    cartItems.forEach(cartItem=>{
         subtotal+= (cartItem.quantity * cartItem.productPrice)
    })
    return subtotal;
  }

  const getQuantityTotal = (cartItems) => {
    let totalQuantity = 0;
    cartItems.forEach(cartItem=>{
      totalQuantity+= cartItem.quantity
    })
    return totalQuantity;
  }



  return (
    <>
      <div className="container-for-cart"></div>
        <div className="cartItemIndex-container">
          <div className="cart-2-top">
            <button
              id="close-cart-item"
              onClick={() => setShowCartItems(false)}>
              < GrClose/>
            </button>
            <h1 id="shopping-bag">Shopping Bag</h1>
            <div className="cart-items-contents">
              {cartItems.length === 0? <div id="shopping-empt"><h1 id="empty-cart">Shopping cart empty</h1></div> :
              cartItems.map((cartItem,i) => (
                <CartItem key={i} cartItem={cartItem}/>
              ))}
            </div>
          
            <div className="container-2-bottom">
                  <div className="order-total">
                          <div id="subtotal-quantity" >Subtotal ({getQuantityTotal(cartItems)}item)</div>
                          <div id="subtotal-amount">${getSubtotal(cartItems)}.00</div>
                  </div>
                  <div className="check-out">
                      <NavLink exact to="/CheckOut" id="checkout-btn" >Checkout</NavLink>
                  </div>
            </div>
          </div>
        </div>
    </>
  );
};

export default CartItemIndex;
