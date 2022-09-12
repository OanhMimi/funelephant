
import React from "react";
import { useSelector,useDispatch } from "react-redux";
import { useState } from "react";
import { getReviews } from "../../store/review";
import './Review.css'
import ReviewFormModal from './ReviewFormModal'
import { deleteReview } from "../../store/review";
import { FaStar } from 'react-icons/fa';



const ReviewIndex  = ({product}) => {

    const dispatch = useDispatch();
    const reviews = useSelector(getReviews)
    const currentUserId = useSelector(state=> state.session.user?.id)
    const [showModal, setShowModal] = useState(false);
    const [selectedReview,setSelectedReview] = useState();
    //selectedReview = the review we select

    const showStar = (rating)=>{
       if (rating===1){
            return <FaStar/>
        } 
       if (rating===2){
        return (
            <div>
                <FaStar/>
                <FaStar/>
             </div>
        )
        } 
        if (rating===3){
                 return (
            <div>
                <FaStar/>
                <FaStar/>
                <FaStar/>
             </div>
        )
        } 
        if (rating===4){
                 return (
            <div>
                <FaStar/>
                <FaStar/>
                <FaStar/>
                <FaStar/>
             </div>
        )
        } 
        if (rating===5){
                 return (
            <div>
                <FaStar/>
                <FaStar/>
                <FaStar/>
                <FaStar/>
                <FaStar/>
             </div>
        )
        } 
       
    }
    return(
        <>
            <div className="review-container">
                <div className="reviewer-info">
                    {reviews.map(review=> (
                        <div className="reviewer-name">{review.userName}</div> 
                    ))}
                </div>
                <div className="all-review-container">
                    {reviews.map(review=> (
                            <div className="display-reviews-info">
                                <div>{showStar(review.rating)}</div>
                                <div id="review-title">{review.title}</div> 
                                <br/>
                                <div id="review-body">{review.body}</div> 
                                <br/>
                                <br/>
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
                </div>
            
            </div>
            <button onClick={()=>setShowModal(true)}>Write a Review</button>
            {showModal && <ReviewFormModal 
            product={product}
            setShowModal={setShowModal}
            selectedReview={selectedReview} />}
        </>

    )
}

export default ReviewIndex; 