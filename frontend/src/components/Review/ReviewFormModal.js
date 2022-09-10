import './Review.css'
import React from 'react';
import { useDispatch , useSelector} from 'react-redux';
import { useParams } from 'react-router-dom';
import { useState,useEffect } from 'react';
import { getProduct,fetchProduct } from '../../store/product';
import { createReview,updateReview } from '../../store/review';


const ReviewFormModal = () => {

    const dispatch = useDispatch();
    const {reviewId} = useParams();
    const formType = reviewId ? 'Edit your review' : 'Write a review' 

    let reviewData = useSelector(getProduct(reviewId))
    if (formType === 'Write a review'){
        reviewData = {
            title: '',
            body: '',
            rating: 0
        }
    }

    useEffect(()=>{
        if (reviewId){
            dispatch((fetchProduct(reviewId)))
        }
    },[reviewId])

    const [review,setReview] = useState(reviewData)

    const handleSubmit = (e) => {
        e.preventDefault();
        if (formType === 'Write a review'){
            dispatch(createReview(review))
        }else{
            dispatch(updateReview(review))
        }
    }

    return(
        <div>
            <h1>{formType}</h1>
            <form className="reviewForm" onSubmit={handleSubmit}>
                <label>Title
                    <input type="text" value={review.title} onChange={(e)=>(setReview({...review,title:e.currentTarget.value}))}/>
                </label>
                <label>Body
                    <input type="text" value={review.body} onChange={(e)=>(setReview({...review,body:e.currentTarget.value}))} />
                </label>
                <label>Rating
                    <input type="number" value={review.rating} onChange={(e)=>(setReview({...review,rating:e.currentTarget.value}))} />
                </label>
                <button>{formType}</button>
            </form>
        </div>
    )

}

export default ReviewFormModal; 