import './CheckOut.css'
import { useEffect, useRef, useState } from "react";
import { useDispatch,useSelector } from "react-redux";
import { deleteCartItem, updateCartItem } from "../../store/cartItems";
import { AiOutlineMinus } from "react-icons/ai";
import { AiOutlinePlus } from "react-icons/ai";
import { getCartItem } from '../../store/cartItems';
import { useParams } from 'react-router-dom';

const CheckOut = ({cartItems}) => {

    const dispatch = useDispatch();
    const {cartItemId} = useParams();
    const cartItem  = useSelector(getCartItem(cartItemId))

    const [count, setCount] = useState(cartItem.quantity);
    
    const firstRender = useRef(true);

    useEffect(() => {
      if (firstRender.current) {
        firstRender.current = false;
        return;
      }
      dispatch(updateCartItem(cartItem.id, { ...cartItem, quantity: count }));
    }, [count]);
  
  
    return (
        <div className="check-out-container">
            <div id="ur-shopping-cart">
                <div id="your-shopping-cart">Your Shopping Cart</div>
            </div>
            <div id="checking-out">
                <div id="check-out-cart-items">
                    <h1 id="checkout-msg">Thank you for taking one step closer to happy, healthier skin.</h1>
                    <div id="display-cart-items">
                        <div id="individual-item-content">
                            <div>display img</div>
                            <div id="display-checkout-product-info">display product info
                                <div>product name</div>
                                <div>
                                    <div onClick={(e) => count < 1 ? dispatch(deleteCartItem(cartItem.id)) : setCount( count - 1)}>
                                    <AiOutlineMinus id="ai-minus"/></div>
                                        QTY: {cartItem.quantity}
                                    <div onClick={(e) => count > 9 ? setCount(10): setCount(count + 1)}>
                                        <AiOutlinePlus id="ai-plus"/></div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div>$PRICE</div>
                        </div>
                    </div>
                    <div id="my-wishlist-items">My Wishlist Items(QTY)</div>
                    <div id="display-wishlist-items">
                        <div id="wishlist-items">
                            <div id="wishlist-img-info">
                                <div>display wishlist img</div>
                                <div id="display-wishlist-product-info">
                                    <div>productname</div>
                                    <div>product price</div>
                                </div>
                            </div>
                            
                            <div id="add-wishlist-to-bag">
                                <button id="add-to-bag">add to bag</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="display-checkout-amt">
                    <div id="checkout-cart">
                        <div id="checkout-sub">
                            <div id="checkout-subtotal">Subtotal</div>
                            <div id="checkout-price">$price</div>
                        </div>
                        <div id="shipping-tbh">
                            <div id="shipping-tbh-info">Shipping</div>
                            <div id="tbh">TBH</div>
                        </div>
                        <div id="tax-total">
                            <div id="tax-total-cart">Tax Total</div>
                            <div id="tax-tbh">$TBH</div>
                        </div>
                        <div id="est-border-top"></div>
                        <div id="estimated-total">
                            <div id="estimated-total-cart">Estimated Total</div>
                            <div id="estimated-tbh">$TBH</div>
                        </div>
                        <div id="est-border-bot"></div>
                        <div id="enter-promo-code">Enter Promo Code</div>
                        <div id="promocode">
                            <div id="promo-code"><input id="promocode-text" type="text"/></div>
                            <div id="promo-div">
                                <button id="apply-promo">APPLY</button>
                            </div>
                        </div>
                        <div id="shopping-border-bot"></div>
                    </div>
                    <div id="secure-checkout-container">
                        <button id="secure-checkout">SECURE CHECKOUT</button>
                        <div>paypal</div>
                    </div>
                </div>
            </div>
        </div>
    )

}

export default CheckOut;