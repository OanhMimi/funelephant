
import './CartItemIndex.css'
import { useSelector } from 'react-redux';
import { getCartItems } from '../../store/cartItem';

const CartItemIndex = ({setShowCartItems}) => {

    const cartItems = useSelector(getCartItems)
    
    return (
        <>
            <div className="container-for-cart"></div>
            <div className="cartItemIndex-container">
                <button id="close-cart-item" onClick={()=>setShowCartItems(false)}>X</button>
                <h1>Shopping Bag</h1>
                <div className="cartItem-products">
                    {cartItems.map(cartItem => (
                        <>
                            <div>{cartItem.productName}</div>
                        </>
                    ))}
                </div>
                <div className="cart-total-info">
                        <div>Order SubTotal</div>
                        <div>Price</div>
                </div>
                <div className="cart-bag-info">
                        <div>View bag</div>
                        <div>CheckOut</div>
                </div>
            </div>
        
        </>
        
    )
}

export default CartItemIndex;