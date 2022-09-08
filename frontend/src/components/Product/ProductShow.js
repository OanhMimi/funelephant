
import React from "react";
import { useEffect } from 'react';
import { Link, useParams } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import { fetchProduct } from "../../store/product";


const ProductShow = () => {
    const dispatch = useDispatch();
    const {productId} = useParams();
    const product = useSelector(state=> state.products[productId]);
    useEffect(()=>{
        dispatch(fetchProduct(productId))
    },[productId])

    return(
        <>
            <h1>{product.name}</h1>
            <p>{product.price}</p>
            <p>{product.desc}</p>
            <p>{product.category}</p>
        </>
    )
}

export default ProductShow; 