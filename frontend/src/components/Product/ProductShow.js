import React from "react";
import { useEffect,useState } from "react";
import { useParams } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import { fetchProduct, getProduct } from "../../store/product";
import "./products.css";
import { FaHeart } from "react-icons/fa";
import ReviewIndex from "../Review/ReviewIndex";
import ReviewFormModal from "../Review/ReviewFormModal";
import { Modal } from "../../context/Modal";

const ProductShow = () => {
  const dispatch = useDispatch();
  const { productId } = useParams();
  const product = useSelector(getProduct(productId));

  useEffect(() => {
    dispatch(fetchProduct(productId));
  }, [productId]);

  const [showModal, setShowModal] = useState(false);

  if (!product) return null;

  return (

    <>
        <div id="show-outer-div">
        <div id="pink-bar-display">
            <div id="first-pink-bar-display">
            <ul id="pink-nav-display-show1">{product.name}</ul>
            <ul id="pink-nav-display-show2">${product.price}.00</ul>
            </div>
            <div id="second-pink-bar-display">
            <ul>
                <button id="buy-button">Buy</button>
            </ul>
            <ul id="likes-icon">
                <FaHeart />
            </ul>
            </div>
        </div>
        <div id="second-container">
            <div id="show-desc-display">
            <div id="product-info">
                <p id="product-information">Product Information</p>
            </div>
            <div id="product-description">
                <div id="what-it-does">
                <span>What it does</span>
                </div>
                <div id="product-desc">
                <span>{product.desc}</span>
                </div>
            </div>
            </div>
            <div id="showImgBg">
            <div id="show-img-display">
                <img id="img-direct" src={product.photoUrl} />
            </div>
            </div>
        </div>
        </div>
        <ReviewIndex/> 
        <button onClick={()=>setShowModal(true)}>Wite a Review</button>
        {showModal && (
        <Modal onClose={() => setShowModal(false)}>
          <ReviewFormModal />
        </Modal>
      )}
    </>
  );
};

export default ProductShow;
