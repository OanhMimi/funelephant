
import React from "react";
import { useSelector } from "react-redux";
import { getReviews } from "../../store/review";
import './Review.css'

const ReviewIndex  = () => {
    const reviews = useSelector(getReviews)

    return(
        <div>
            {reviews.map(review=> (
                <div id="display-reviews-info">
                    <div>{review.title}</div> 
                    <div>{review.body}</div> 
                    <div>{review.rating}</div>
                </div>
            ))}
        </div>
    )
}

export default ReviewIndex; 