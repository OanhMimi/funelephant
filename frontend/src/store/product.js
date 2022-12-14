
import { receiveReviews } from "./review"

export const RECEIVE_PRODUCTS = 'products/RECEIVE_PRODUCTS'
export const RECEIVE_PRODUCT = 'products/RECEIVE_PRODUCT'

export const receiveProducts = (products) => ({
    type: RECEIVE_PRODUCTS,
    payload: products
})

export const receiveProduct = (product) => ({
    type: RECEIVE_PRODUCT,
    payload: product
})

export const getProducts = state => {
    return state?.products?  Object.values(state.products) : []
}

export const getProduct = productId => state => {
    return state?.products? state.products[productId] : null;
}

export const fetchProducts = ()=> async(dispatch) => {
    const response = await fetch('/api/products') //get request
    if (response.ok){
        const products = await response.json()
        dispatch(receiveProducts(products))
    }
}

export const fetchProduct = (productId)=> async(dispatch) => {
    const response = await fetch(`/api/products/${productId}`)
    if (response.ok){
        const product = await response.json()
        dispatch(receiveProduct(product))
        dispatch(receiveReviews(product))
    }
}

const productsReducer = (state={},action) => {
    Object.freeze(state)
    const newState = {...state} 
    switch(action.type){
        case RECEIVE_PRODUCTS:
            return action.payload.products
        case RECEIVE_PRODUCT:
            newState[action.payload.product.id] = action.payload.product
            return newState;
        default:
            return state;
    }
}

export default productsReducer;













