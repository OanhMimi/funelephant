import React from "react";
import { NavLink } from "react-router-dom";
import {AiOutlineUser} from "react-icons/ai";
import { HiOutlineShoppingBag} from "react-icons/hi";
import { HiOutlineSearch} from "react-icons/hi";
import { HiOutlineMenu } from "react-icons/hi";


const NavBar = () => {
    return(
        <div>
            <div className="nav-bar">
                <ul className="left-nav-bar">  
                    <NavLink className="menu-icon" exact to="/signUpOrLogIn"><HiOutlineMenu/></NavLink>
                </ul>
                <ul className="right-nav-bar">
                    <NavLink className="user-icon" exact to="/signUpOrLogIn"><HiOutlineSearch/></NavLink>
                    <NavLink className="user-icon" exact to="/signUpOrLogIn"><HiOutlineShoppingBag/></NavLink>
                    <NavLink className="user-icon" exact to="/signUpOrLogIn"><AiOutlineUser/></NavLink>
                </ul>
            </div>
            
        </div>
    )
}

export default NavBar;