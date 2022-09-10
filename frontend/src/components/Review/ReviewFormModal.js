import './Review.css'
import React from 'react';
import { useDispatch } from 'react-redux';
import { useParams } from 'react-router-dom';
import { useState } from 'react';
import { createReview } from '../../store/review';

const ReviewFormModal = () => {

    const dispatch = useDispatch();

    const [title,setTitle] = useState("")
    const [body,setBody] = useState("")
    const [rating,setRating] = useState("")

    const handleSubmit = (e) => {       
        e.preventDefault();
        dispatch(createReview({title,body,rating}))
    }
    
    return(
        <form onSubmit={handleSubmit}>
            <label>Review Title
                <input 
                    type="text"
                    value={title}
                    onChange={(e) => setTitle(e.target.value)}
                    required
                />
            </label>
            <label>Review 
                <input 
                    type="text"
                    value={body}
                    onChange={(e) => setBody(e.target.value)}
                    required
                />
            </label>
            <label>
                <input
                    type="number"
                    value={rating}
                    onChange={(e)=>setRating(e.target.value)}
                />
            </label>
            

        </form>
    )

}

export default ReviewFormModal; 