import './Review.css'
import React from 'react';
import { useDispatch,useSelector } from 'react-redux';
import { useParams } from 'react-router-dom';
import { useState } from 'react';
import { createReview,updateReview } from '../../store/review';
// import StarRating from '../StarRating';
import { FaStar } from 'react-icons/fa';
import { AiOutlineClose } from "react-icons/ai";


const ReviewFormModal = ({setShowModal,selectedReview, product}) => {

    const {productId} = useParams();
    let editReview = true;
    const sessionUser = useSelector(state => state.session.user);

    if (!selectedReview){
       selectedReview = {
        title: "",
        body: "",
        rating: 1 
        }
        editReview = false;
    }
    const dispatch = useDispatch();

    const [title,setTitle] = useState(selectedReview.title)
    const [body,setBody] = useState(selectedReview.body)
    const [rating,setRating] = useState(selectedReview.rating)
    
    const handleSubmit = (e) => { 
        let min50 = document.getElementById('min50')
        e.preventDefault();
        if (body.length < 50){
            min50.classList.remove("hidden")
            return ""
        }
        if (editReview){
            dispatch(updateReview({title,body,rating,product_id:productId,id:selectedReview.id}))
        }else{
            dispatch(createReview({title,body,rating,product_id:productId}))
        }

        setShowModal(false)
    }

    const handleMinBody = (e) =>{
        let min50 = document.getElementById('min50')
        e.preventDefault();
        if (e.target.value.length > 50){
            min50.classList.add("hidden")
            return ""
        }else
        setBody(e.target.value)
    }
   

   
   
    return(
        <>
            <div onClick={()=>setShowModal(false)} id="blur-background"></div>
            <div   className="bg-modal">
                <div id="form-close">
                    <AiOutlineClose id="form-modal-close" onClick={()=>setShowModal(false)}/>
                </div>
                <div className='review-modal'>
                    <div className="product-img-title">
                        <img id="review-product-img" src={product.photoUrl[0]} />
                        <div id="product-rating-star">
                            <div id="form-product-name">{product.name}</div>
                            <div id="product-rating">Rating
                            <div id="star-rating">
                                {[...Array(5)].map((star, i) => {
                                    const ratingValue = i + 1;
                                    return (
                                        <label>
                                        <input 
                                            type="radio" 
                                            name="rating" 
                                            value={ratingValue} 
                                            onClick={(e)=>setRating(e.target.value)}

                                        />
                                        <FaStar 
                                            className="star" 
                                            color={ratingValue <= (rating) ? "#ecc8f8" : "#e4e5e9"} 
                                            size={40}
                                
                                        />
                                        </label>
                                    )
                                })}                                         
                            </div>
                            </div>
                        </div>
                    </div>
                    <form className ="review-form-modal" onSubmit={handleSubmit}>
                        <div id="user-welcome-message">
                            <div id="hello-user">Hello </div>
                            <p id="hello-username">{sessionUser.firstName},</p>
                        </div>
                            <div id="review-message">We care about our customer and would love to hear your feedbacks </div>
                        <label id="review-title">Review Title 
                            <input id="title-input"
                                type="text"
                                value={title}
                                onChange={(e) => setTitle(e.target.value)}
                                required
                                />
                        </label>

                        <label id="review-review">Review 
                            <textarea 
                               placeholder='Minimum 50 characters'
                               id="body-input"
                                type="text"
                                value={body}
                                onChange={handleMinBody}
                                required
                                />
                        </label>
                        <h1 id="min50" className="hidden">Minimum 50 Characters</h1>
                        <button id="post-review" type="submit" >Post Review</button>
                    </form>
                </div>
            </div >
            
         </>

        // <div className="review-outmost-modal-box">
        //     <div onClick={()=>setShowModal(false)} className="review-form-modal">



        //     </div>
        // </div>


         

    )

}

export default ReviewFormModal; 