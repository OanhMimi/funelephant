
//action creator
export const RECEIVE_CART_ITEMS = 'cart_items/RECEIVE_CART_ITEMS'
export const RECEIVE_CART_ITEM = 'cart_items/RECEIVE_CART_ITEM'
export const REMOVE_CART_ITEM = 'cart_items/REMOVE_CART_ITEM'

export const receiveCartItems = cartItems => ({
    type: RECEIVE_CART_ITEMS,
    cartItems
})

export const receiveCartItem = cartItem => ({
    type: RECEIVE_CART_ITEM,
    cartItem
})

export const removeCartItem = cartItemId => ({
    type: REMOVE_CART_ITEM,
    cartItemId
})


//selector

export const getCartItems = state => {
    return state?.cartItems? Object.values(state.cartItems) : [];
}

export const getCartItem = cartItemId => state => {
    return state?.cartItems? state.cartItems[cartItemId] : null;
}

//thunk action creator 

export const fetchCartItems = () => async(dispatch) => {
    const response = await fetch('/api/cart_items')
    if (response.ok){
        const cartItems = response.json()
        dispatch(receiveCartItems(cartItems))
    }
}

export const createCartItem = (cartItem) => async(dispatch)=>{
    const response = await fetch('/api/session',{
        method: 'POST',
        headers: {
            'Content-Type' : 'application/json'
        },
        body: JSON.stringify(cartItem)
    })
    if (response.ok){
        const cartItem = response.json()
        dispatch(receiveCartItem(cartItem))
    }
}

export const updateCartItem = (cartItemId) => async(dispatch) => {
    const response = await fetch(`/api/cart_items/${cartItemId}`,{
        method: 'PATCH',
        headers: {
            'Content-Type' : 'application/json'
        },
        body: JSON.stringify(cartItemId)
    })
    if (response.ok){
        const cartItem = response.json()
        dispatch(receiveCartItem(cartItem)) 
    }
}

export const deleteCartItem = (cartItemId) => async(dispatch) => {
    const response = await fetch(`/api/cart_items/${cartItemId}`,{
        method: 'DELETE'
    })
    if (response.ok){
        dispatch(removeCartItem(cartItemId))
    }
}

//reducer

const CartItemReducer = (state ={},action) => {
    Object.freeze(state);
    const newState = {...state};
    switch(action.type){
        case RECEIVE_CART_ITEMS:
            return action.cartItems
        case RECEIVE_CART_ITEM:
            newState[action.cartItem.id] = action.cartItem
            return newState;
        case REMOVE_CART_ITEM:
            delete newState[action.cartItemId]
            return newState;
        default: 
            return state;
    }
}

export default CartItemReducer;


