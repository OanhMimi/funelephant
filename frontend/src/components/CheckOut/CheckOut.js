import './CheckOut.css'
import { useEffect, useState} from "react";
import { useDispatch,useSelector } from "react-redux";
import { fetchCartItems,getCartItems,deleteCartItem } from "../../store/cartItems";
import CheckOutCartItem from './CheckOutCartItem';
import { Redirect, useHistory } from 'react-router-dom';
import { __RouterContext } from 'react-router';

const CheckOut = () => {

    const dispatch = useDispatch();
    const cartItems = useSelector(getCartItems)

    useEffect(() => {
        dispatch(fetchCartItems())
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

      const history = useHistory();
    
    const handleCheckOut = (e) => {
        e.preventDefault();
        cartItems.map(cartItem => {
            dispatch(deleteCartItem(cartItem.id))
    })
        history.push("/")
    }
    
    const [applied,setApplied] = useState("APPLY")

    const handleApply =(e) => {
        e.preventDefault();
        setApplied("APPLIED")
    }
   
  
    return (
        <div className="check-out-container">
            <div id="ur-shopping-cart">
                <div id="your-shopping-cart">Your Shopping Cart</div>
            </div>
            <div id="checking-out">
                <div id="check-out-cart-items">
                    <div id="msg-checkout">
                        <h1 id="checkout-msg">Thank you for taking one step closer to happy, healthier skin.</h1>
                    </div>
        
                    {cartItems.map((cartItem) => (
                            <CheckOutCartItem cartItem={cartItem}/>
                    ))}
    
                    {/* <div id="my-wishlist-items">My Wishlist Items(QTY)</div>
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
                    </div> */}
                </div>
                <div id="display-checkout-amt">
                    <div id="checkout-cart">
                        <div id="checkout-sub">
                            <div id="checkout-subtotal">Subtotal ({getQuantityTotal(cartItems)}item)</div>
                            <div id="checkout-price">${getSubtotal(cartItems)}.00</div>
                        </div>
                        <div id="shipping-tbh">
                            <div id="shipping-tbh-info">Shipping</div>
                            <div id="tbh">Free</div>
                        </div>
                        <div id="tax-total">
                            <div id="tax-total-cart">Tax Total</div>
                            <div id="tax-tbh">$TBD</div>
                        </div>
                        <div id="est-border-top"></div>
                        <div id="estimated-total">
                            <div id="estimated-total-cart">${getSubtotal(cartItems)}.00</div>
                            <div id="estimated-tbh">$TBD</div>
                        </div>
                        <div id="est-border-bot"></div>
                        <div id="enter-promo-code">Enter Promo Code</div>
                        <div id="promocode">
                            <div id="promo-code"><input id="promocode-text" type="text" /></div>
                            <div id="promo-div">
                                <button onClick={handleApply} id="apply-promo">{applied}</button>
                            </div>
                        </div>
                        <div id="shopping-border-bot"></div>
                    </div>
                    <div id="secure-checkout-container">
                        <button id="secure-checkout" onClick={handleCheckOut}>SECURE CHECKOUT</button>
                        <div>paypal</div>
                    </div>
                </div>
            </div>
        </div>
    )

}

export default CheckOut;