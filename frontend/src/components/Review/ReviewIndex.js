
import React from "react";
import { useSelector } from "react-redux";
import { useState } from "react";
import { getReviews } from "../../store/review";
import './Review.css'
import ReviewFormModal from './ReviewFormModal'

const ReviewIndex  = () => {
    const reviews = useSelector(getReviews)
    const currentUserId = useSelector(state=> state.session.user?.id)
    const [showModal, setShowModal] = useState(false);
    const [selectedReview,setSelectedReview] = useState();

    return(
        <div>
            {reviews.map(review=> (
                <div id="display-reviews-info">
                    <div>{review.title}</div> 
                    <div>{review.body}</div> 
                    <div>{review.rating}</div>
                    {currentUserId === review.userId && (
                        <>
                            <div>delete</div> 
                            <div onClick={()=>{
                                setSelectedReview(review)
                                setShowModal(true)
                            }}>update</div> 
                        </>
                    )}
                </div>
            ))}
        <button onClick={()=>setShowModal(true)}>Write a Review</button>
        {showModal && <ReviewFormModal 
        setShowModal={setShowModal}
        selectedReview={selectedReview} />}
        </div>
    )
}

export default ReviewIndex; 