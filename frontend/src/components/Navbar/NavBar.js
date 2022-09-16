import React from "react";
import { NavLink } from "react-router-dom";
import {AiOutlineUser} from "react-icons/ai";
import { HiOutlineShoppingBag} from "react-icons/hi";
import { HiOutlineSearch} from "react-icons/hi";
import { RiMenuFill } from "react-icons/ri";
import SlideOutMenu from "../SlideOutMenu/SlideOutMenu";
import FunElephantLogo from './fun-elephant-logo.png'
import { useState } from "react";
import CartItemIndex from "../CartItems/CartItemsIndex";



const NavBar = () => {

    const [showSlideOut,setShowSlideOut] = useState(false)
     
    const handleClick = (e) => {
        e.preventDefault();
        // let modal = document.getElementById("menu-slide-out")
        // modal.style.display = "block"
        setShowSlideOut(true)
    }

    const [showCartItems, setShowCartItems] = useState(false);

 
    return(
        <>
            <div className="outmost-nav-bar">
                <div id="elephant-logo">
                    <NavLink exact to ="/"><img id="fun-elephant-logo" src={FunElephantLogo}/></NavLink>
                </div>
                <div id="main-nav-bar">
                    <div className="left-nav-bar">
                        <button onClick={handleClick} id ="menuButton" type="button">
                            <RiMenuFill className="menu-icon"/>
                        </button>
                    </div>

                    <div className="right-nav-bar">
                        <div className="search">
                            <NavLink className="search-icon" exact to="/search"><HiOutlineSearch id="search-icon"/></NavLink>
                        </div>
                        <div className="bag">
                            <div onClick={()=>setShowCartItems(true)} className="bag-icon"><HiOutlineShoppingBag id="bag-icon"/></div>
                        </div>
                        <div className="prof">
                            <NavLink className="user-icon" exact to="/SignUp"><AiOutlineUser id="prof-icon" /></NavLink>
                        </div>
                    </div>   
                </div>
            </div>
                {showSlideOut && <SlideOutMenu id="display-slide-out" setShowSlideOut={setShowSlideOut}/>}
                {showCartItems && <CartItemIndex setShowCartItems={setShowCartItems} />}

        </>
    )
}

export default NavBar;