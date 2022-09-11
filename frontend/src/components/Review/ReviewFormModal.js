import './Review.css'
import React from 'react';
import { useDispatch } from 'react-redux';
import { useParams } from 'react-router-dom';
import { useState } from 'react';
import { createReview,updateReview } from '../../store/review';

const ReviewFormModal = ({setShowModal,selectedReview}) => {

    const {productId} = useParams();
    let editReview = true;

    if (!selectedReview){
       selectedReview = {
        title: "",
        body: "",
        rating: 0 
        }
        editReview = false;
    }
    const dispatch = useDispatch();

    const [title,setTitle] = useState(selectedReview.title)
    const [body,setBody] = useState(selectedReview.body)
    const [rating,setRating] = useState(selectedReview.rating)

    const handleSubmit = (e) => {   
        e.preventDefault();
        if (editReview){
            dispatch(updateReview({title,body,rating,product_id:productId,id:selectedReview.id}))
        }else{
            dispatch(createReview({title,body,rating,product_id:productId}))
        }
        setShowModal(false)
    }

    return(
        <>
            <div onClick={()=>setShowModal(false)} className="bg-modal">
            </div>
                <div className='review-modal'>
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
                        <label>Rating
                            <input
                                type="number"
                                value={rating}
                                onChange={(e)=>setRating(e.target.value)}
                                />
                        </label>
                        <button type="submit" >Post Review</button>
                 </form>
            </div>
         </>
      
    )

}

export default ReviewFormModal; 