import "./CheckOut.css"
import { useEffect, useRef, useState } from "react";
import { useDispatch } from "react-redux";
import { deleteCartItem, updateCartItem } from "../../store/cartItems";
import { AiOutlineMinus } from "react-icons/ai";
import { AiOutlinePlus } from "react-icons/ai";

const CheckOutCartItem = ({cartItem}) => {

    const dispatch = useDispatch();
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
        <div id="display-cart-items">
            <div id="left-item-content">
                <div id="img-photo">
                    <img id="cart-item-img" src={cartItem.photoUrl[0]}/>
                </div>
                <div id="display-checkout-product-info">
                     <div id="cart-product-name">{cartItem.productName}</div>
                     <div id="ai-plus-minus">
                        <div onClick={(e) => count < 1 ? dispatch(deleteCartItem(cartItem.id)) : setCount( count - 1)}>
                            <AiOutlineMinus id="ai-minus"/>
                        </div>
                            QTY: {cartItem.quantity}
                        <div onClick={(e) => count > 9 ? setCount(10): setCount(count + 1)}>
                            <AiOutlinePlus id="ai-plus"/>
                        </div>
                     </div>
                </div>
            </div>
            <div id="right-item-content">
                <div>${cartItem.productPrice * cartItem.quantity}.00</div>
            </div>
        </div>
    )
}

export default CheckOutCartItem;