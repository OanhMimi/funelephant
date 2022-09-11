import csrfFetch from "./csrf"

//action creators 
export const RECEIVE_REVIEWS = 'reviews/RECEIVE_REVIEWS'
export const RECEIVE_REVIEW = 'reviews/RECEIVE_REVIEW'
export const REMOVE_REVIEW = 'reviews/REMOVE_REVIEW'

export const receiveReviews = reviews => ({
    type: RECEIVE_REVIEWS,
    payload: reviews
})
export const receiveReview = review => ({
    type: RECEIVE_REVIEW,
    review
})
export const removeReview = reviewId => ({
    type: REMOVE_REVIEW,
    reviewId
})

//state selectors
export const getReviews = state => {
    return state?.reviews ? Object.values(state.reviews) : []
}

//thunk action creators
export const createReview = (review) => async(dispatch) => {
    const response = await csrfFetch('/api/reviews',{
        method: 'POST',
        headers: {
            'Content-Type':'application/json'
        },
        body: JSON.stringify(review)
    })
    if (response.ok){
        const review = await response.json()
        dispatch(receiveReview(review))
    }
}

export const updateReview = (review) => async(dispatch) => {
    const response = await csrfFetch(`/api/reviews/${review.id}`,{
        method: 'PATCH',
        headers: {
            'Content-Type' : 'application/json'
        },
        body: JSON.stringify(review)
    })
    if (response.ok){
        const review = await response.json()
        dispatch(receiveReview(review))
    }
}

export const deleteReview = (reviewId) => async(dispatch) => {
    const response = await csrfFetch(`/api/reviews/${reviewId}`,{
        method: 'DELETE'
    })
    if (response.ok){
        dispatch(removeReview(reviewId))
    }
}

const ReviewsReducer = (state={},action) => {
    Object.freeze(state)
    const newState = {...state}
    switch(action.type){
        case RECEIVE_REVIEWS:
            return action.payload.reviews
        case RECEIVE_REVIEW:
            newState[action.review.id] = action.review
            return newState
        case REMOVE_REVIEW:
            delete newState[action.reviewId]
            return newState
        default: 
            return state;
    }
}


export default ReviewsReducer;



