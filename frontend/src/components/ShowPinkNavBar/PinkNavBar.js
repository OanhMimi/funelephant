import React from 'react';
import './PinkNavBar.css'
import { FaHeart } from "react-icons/fa";
import { useState } from 'react';
import CartItemIndex from '../CartItems/CartItemsIndex';
import { useDispatch ,useSelector} from 'react-redux';
import { getCartItem,createCartItem } from '../../store/cartItem';
import { useParams } from 'react-router-dom';

const PinkNavBar = ({product}) => {
    
    const {cartItemId} = useParams();
    const cartItem = useSelector(getCartItem(cartItemId));
    const [showCartItems, setShowCartItems ] = useState(false)
    const dispatch = useDispatch();
    const handleClick = (e) => {
        e.preventDefault();
        setShowCartItems(true)
        dispatch(createCartItem(cartItem))
    }
 
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
                            <select className="quantity">
                                <option value="1" selected="selected">1</option>
                                <option value="2" >2</option>
                                <option value="2" >3</option>
                                <option value="2" >4</option>
                                <option value="2" >5</option>
                                <option value="2" >6</option>
                                <option value="2" >7</option>
                                <option value="2" >8</option>
                                <option value="2" >9</option>
                                <option value="2" >10</option>
                            </select>
                        </div>
                    </div>
                    <div>
                        <button onClick={handleClick} id="buy-button">Buy</button>
                    </div>
                    <div id="likes-icon">
                        < FaHeart className="fa-heart"/>
                    </div>
                </div>
            </div> 
            {showCartItems && <CartItemIndex setShowCartItems={setShowCartItems}/>}
        </div>
    )
}

export default PinkNavBar;