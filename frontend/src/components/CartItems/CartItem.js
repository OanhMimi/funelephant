import { useEffect, useRef, useState } from "react";
import { useDispatch } from "react-redux";
import { deleteCartItem, updateCartItem } from "../../store/cartItems";

const CartItem = ({ cartItem }) => {
  console.log(cartItem);
  const dispatch = useDispatch();
  const [count, setCount] = useState(cartItem.quantity);
  const firstRender = useRef(true);
  //   const handleQuantity = (type) => {
  //     return (e) => {
  //       e.preventDefault();
  //       if (type === "positive") {
  //         cartItem.quantity = cartItem.quantity + 1;
  //       }
  //     };
  //   };
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
        <img id="cart-item-img" src={cartItem.productImage} />
      </div>
      <div className="product-info">
        <div>{cartItem.productName}</div>
        <div id="subtotal">
          <div>
            <div onClick={(e) => count < 1 ? dispatch(deleteCartItem(cartItem.id)) : setCount( count - 1)}>-</div>
            QTY: {cartItem.quantity}
            <div onClick={(e) => count > 9 ? setCount(10): setCount(count + 1)}>+</div>
          </div>
          <div>{cartItem.quantity * cartItem.productPrice}</div>
        </div>
        <button
          id="remove-item"
          onClick={() => dispatch(deleteCartItem(cartItem.id))}
        >
          Remove
        </button>
      </div>
    </div>
  );
};

export default CartItem;
