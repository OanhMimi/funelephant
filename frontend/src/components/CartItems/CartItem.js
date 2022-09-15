import { useEffect, useRef, useState } from "react";
import { useDispatch } from "react-redux";
import { deleteCartItem, updateCartItem } from "../../store/cartItems";
import { AiOutlineMinus } from "react-icons/ai";
import { AiOutlinePlus } from "react-icons/ai";


const CartItem = ({ cartItem }) => {
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
    <div className="items-in-my-cart">
      <div id="img-in-cart">
        <img id="cart-item-img" src={cartItem.photoUrl[0]} />
      </div>
      <div className="product-info">
        <div id="cart-item-product-name">{cartItem.productName}</div>
        <div id="subtotal">
          <div id="changing-quantity">
            <div onClick={(e) => count < 1 ? dispatch(deleteCartItem(cartItem.id)) : setCount( count - 1)}>
                <AiOutlineMinus id="ai-minus"/>
            </div>
            QTY: {cartItem.quantity}
            <div onClick={(e) => count > 9 ? setCount(10): setCount(count + 1)}>
                <AiOutlinePlus id="ai-plus"/>
            </div>
          </div>
          <div id="price-total">
            ${cartItem.quantity * cartItem.productPrice}.00
          </div>
        </div>
        <div id="remove-cart-item">
            <button
            id="remove-item"
            onClick={() => dispatch(deleteCartItem(cartItem.id))}
            >
            Remove
            </button>
        </div>
      </div>
    </div>
  );
};

export default CartItem;
