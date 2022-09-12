
//action creator
// export const RECEIVE_CART_ITEMS = 'cart_items/RECEIVE_CART_ITEMS'
// export const RECEIVE_CART_ITEM = 'cart_items/RECEIVE_CART_ITEM'
// export const REMOVE_CART_ITEM = 'cart_items/REMOVE_CART_ITEM'

// export const receiveCartItems = cartItems => ({
//     type: RECEIVE_CART_ITEMS,
//     cartItems
// })

// export const receiveCartItem = cartItem => ({
//     type: RECEIVE_CART_ITEM,
//     cartItem
// })

// export const removeCartItem = cartItemId => ({
//     type: REMOVE_CART_ITEM,
//     cartItemId
// })


// //selector

// export const getCartItems = state => {
//     return state?.cartItems? Object.values(state.cartItems) : [];
// }

// export const getCartItem = cartItemId => state => {
//     return state?.cartItems? state.cartItems[cartItemId] : null;
// }

// //thunk action creator 

// export const fetchCartItems = () => async(dispatch) => {
//     const response = await fetch('/api/cart_items')
//     if (response.ok){
//         const cartItems = response.json()
//         dispatch(receiveCartItems(cartItems))
//     }
// }

// export const fetchCartItem = (cartItemId) => async(dispatch) => {
//     const response = await fetch(``)
// }
