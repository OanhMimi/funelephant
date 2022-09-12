import React from "react";
import { NavLink } from "react-router-dom";
import {AiOutlineUser} from "react-icons/ai";
import { HiOutlineShoppingBag} from "react-icons/hi";
import { HiOutlineSearch} from "react-icons/hi";
import { RiMenuFill } from "react-icons/ri";
import SlideOutMenu from "../SlideOutMenu/SlideOutMenu";
import FunElephantLogo from './fun-elephant-logo.png'
import { useState } from "react";



const NavBar = () => {

    const [showSlideOut,setShowSlideOut] = useState(false)
     
    const handleClick = (e) => {
        e.preventDefault();
        // let modal = document.getElementById("menu-slide-out")
        // modal.style.display = "block"
        setShowSlideOut(true)
    }


 
    return(
        <>
            <div className="outmost-nav-bar">
                <div id="elephant-logo">
                    <img id="fun-elephant-logo" src={FunElephantLogo}/>
                </div>
                <div id="main-nav-bar">
                    <div className="left-nav-bar">
                        <button onClick={handleClick} id ="menuButton" type="button">
                            <RiMenuFill className="menu-icon"/>
                        </button>
                    </div>

                    <div className="right-nav-bar">
                        <div className="search">
                            <NavLink className="user-icon" exact to="/signUpOrLogIn"><HiOutlineSearch id="search-icon"/></NavLink>
                        </div>
                        <div className="bag">
                            <NavLink className="user-icon" exact to="/signUpOrLogIn"><HiOutlineShoppingBag id="bag-icon"/></NavLink>
                        </div>
                        <div className="prof">
                            <NavLink className="user-icon" exact to="/signUpOrLogIn"><AiOutlineUser id="prof-icon" /></NavLink>
                        </div>
                    </div>   
                </div>
                {showSlideOut && <SlideOutMenu setShowSlideOut={setShowSlideOut}/>}
            </div>
        </>
    )
}

export default NavBar;