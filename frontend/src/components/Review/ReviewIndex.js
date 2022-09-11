
import React from "react";
import { useSelector,useDispatch } from "react-redux";
import { useState } from "react";
import { getReviews } from "../../store/review";
import './Review.css'
import ReviewFormModal from './ReviewFormModal'
import { deleteReview } from "../../store/review";


const ReviewIndex  = () => {

    const dispatch = useDispatch();
    const reviews = useSelector(getReviews)
    const currentUserId = useSelector(state=> state.session.user?.id)
    const [showModal, setShowModal] = useState(false);
    const [selectedReview,setSelectedReview] = useState();
    //selectedReview = the review we select
    return(
        <div>
            {reviews.map(review=> (
                <div id="display-reviews-info">
                    <div>{review.title}</div> 
                    <div>{review.body}</div> 
                    <div>{review.rating}</div>
                    {currentUserId === review.userId && (
                        <>
                            <button>
                                <div onClick={() => dispatch(deleteReview(review.id))}>Delete Review
                                </div> 
                            </button>
                            <button>
                                <div onClick={()=>{
                                    setSelectedReview(review) //<--- 
                                    setShowModal(true)
                                }}>Update Review
                                </div> 
                            </button>
    
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