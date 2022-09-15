import React from "react";
import { useEffect, useState} from "react";
import { useParams } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import { fetchProduct, getProduct } from "../../store/product";
import "./products.css";
// import { FaHeart } from "react-icons/fa";
import ReviewIndex from "../Review/ReviewIndex";
import PinkNavBar from "../ShowPinkNavBar/PinkNavBar";
import skincare_reward from './skincare_rewards.png'
import { MdChevronRight } from "react-icons/md";





const ProductShow = () => {
  const dispatch = useDispatch();
  const { productId } = useParams();
  const product = useSelector(getProduct(productId));

  useEffect(() => {
    dispatch(fetchProduct(productId));
  }, [productId]);



  const [showDesc,setShowInfo] = useState("desc")

  const handleProductClick = () => {
    switch(showDesc){
      case "desc":
        return <span>{product.desc}</span>
      case "usage":
        return <span>{product.usage}</span>
      case "ingredients": 
        return <span>{product.ingredients}</span>
    }
  }

  if (!product) return null;
  const photo2 = product.photoUrl[1]


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
                      <div onClick={()=>setShowInfo("desc")}id="what">WHAT IT DOES <MdChevronRight/></div>
                      <div onClick={()=>setShowInfo("usage")}id="how">HOW TO USE <MdChevronRight/></div>
                      <div onClick={()=>setShowInfo("ingredients")}id="ingredients">INGREDIENTS <MdChevronRight/></div>
                      <div>
                        <img id="skincare-awards" src={skincare_reward}/>
                      </div>
                    </div>
                    <div id="product-desc"> 
                      {handleProductClick()}
                    </div> 
                  </div>
              </div>
              <div className="show-img-display">
                  <img className="img-direct" src={photo2} />
              </div>
            </div>
        </div>
        <ReviewIndex product={product}/>
    </>
  );
};

export default ProductShow;
