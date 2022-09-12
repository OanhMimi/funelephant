import React from "react";
import { useEffect} from "react";
import { useParams } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import { fetchProduct, getProduct } from "../../store/product";
import "./products.css";
// import { FaHeart } from "react-icons/fa";
import ReviewIndex from "../Review/ReviewIndex";
import PinkNavBar from "../ShowPinkNavBar/PinkNavBar";

const ProductShow = () => {
  const dispatch = useDispatch();
  const { productId } = useParams();
  const product = useSelector(getProduct(productId));

  useEffect(() => {
    dispatch(fetchProduct(productId));
  }, [productId]);

  if (!product) return null;

  return (

    <>
        <div id="show-outer-div">
        <PinkNavBar product={product}/>
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
        <ReviewIndex product={product}/>

    </>
  );
};

export default ProductShow;
