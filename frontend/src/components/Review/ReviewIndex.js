
import React from "react";
import { useSelector,useDispatch } from "react-redux";
import { useState,useEffect } from "react";
import { getReviews } from "../../store/review";
import './Review.css'
import ReviewFormModal from './ReviewFormModal'
import { deleteReview } from "../../store/review";
import { FaStar } from 'react-icons/fa';
import { GrEdit } from "react-icons/gr";
import { RiDeleteBin6Line } from "react-icons/ri";
import { Redirect } from "react-router-dom";



const ReviewIndex  = ({product}) => {

    const dispatch = useDispatch();
    const currentUserId = useSelector(state=> state.session.user?.id)
    const [showModal, setShowModal] = useState(false);
    const [selectedReview,setSelectedReview] = useState();
    const [createdReview,setCreatedReview] = useState(false);
    
    const reviews = useSelector(getReviews)
    useEffect(()=>{

        let eachReview = Object.values(reviews)
        if (eachReview.length === 0){
            setCreatedReview(false)
            return
        }
        for (let index = 0; index < eachReview.length; index++) {
            if (currentUserId === eachReview[index].userId) {
                setCreatedReview(true)
                return
            } 
        setCreatedReview(false)
        }
     },[reviews])

     const sessionUser = useSelector(state => state.session.user);
     
    
    //selectedReview = the review we select

    const showStar = (rating)=>{
       if (rating===1){
            return (
                <div>
                    <FaStar id="star-value" />
                    <FaStar id="non-star-value"/>
                    <FaStar id="non-star-value"/>
                    <FaStar id="non-star-value"/>
                    <FaStar id="non-star-value"/>
                </div>
            )
        } 
       if (rating===2){
        return (
            <div>
                <FaStar id="star-value"/>
                <FaStar id="star-value"/>
                <FaStar id="non-star-value"/>
                <FaStar id="non-star-value"/>
                <FaStar id="non-star-value"/>
             </div>
        )
        } 
        if (rating===3){
                 return (
            <div>
                <FaStar id="star-value"/>
                <FaStar id="star-value"/>
                <FaStar id="star-value"/>
                <FaStar id="non-star-value"/>
                <FaStar id="non-star-value"/>
             </div>
        )
        } 
        if (rating===4){
                 return (
            <div>
                <FaStar id="star-value"/>
                <FaStar id="star-value"/>
                <FaStar id="star-value"/>
                <FaStar id="star-value"/>
                <FaStar id="non-star-value"/>
             </div>
        )
        } 
        if (rating===5){
                 return (
            <div>
                <FaStar id="star-value"/>
                <FaStar id="star-value"/>
                <FaStar id="star-value"/>
                <FaStar id="star-value"/>
                <FaStar id="star-value"/>
             </div>
        )
        } 
    }

    const handleClick = (e) => {
        e.preventDefault();
        !sessionUser? <Redirect to="/signUpOrLogIn" /> : setShowModal(true) 
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
                                <div id="review-rating">{showStar(review.rating)}</div>
                                <div>
                                    <div id="review-title">{review.title}</div> 
                                {currentUserId === review.userId && 
                                    (
                                    <>
                                        <div className="delete-update-btns">
                                            <button id="delete-review-button">
                                                <div id="delete-review" onClick={() => dispatch(deleteReview(review.id))}><RiDeleteBin6Line/>
                                                </div> 
                                            </button>
                                            <button id="update-review-button">
                                                <div id="update-review" onClick={()=>{
                                                    setSelectedReview(review) //<--- 
                                                    setShowModal(true)
                                                }}><GrEdit/>
                                                </div> 
                                            </button>
                                        </div>
                                    </>
                                )}

                                </div>

                                <br/>
                                <div id="review-body">{review.body}</div> 
                                <br/>

                            </div>  
                    ))}
                </div>
            </div>
            <div id="div-write-review">
                { createdReview ?  <h1></h1> : <button id="write-review" onClick={handleClick}>Write a Review</button>}
                {showModal && <ReviewFormModal 
                product={product}
                setShowModal={setShowModal}
                selectedReview={selectedReview} />}
            </div>
    </>

    )
}

export default ReviewIndex; 