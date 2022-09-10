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
                    <div className="menu">
                        <div class="button-menu">
                             <span class="menu-icon-bar"></span>
                             <span class="menu-icon-bar"></span>
                             <span class="menu-icon-bar"></span>
                        </div>
                        {/* <NavLink className="menu-icon" exact to="/signUpOrLogIn"><HiOutlineMenu/></NavLink> */}
                    </div>
                </ul>
                <ul className="right-nav-bar">
                    <div className="search">
                        <NavLink className="user-icon" exact to="/signUpOrLogIn"><HiOutlineSearch/></NavLink>
                    </div>
                    <div className="bag">
                        <NavLink className="user-icon" exact to="/signUpOrLogIn"><HiOutlineShoppingBag/></NavLink>
                    </div>
                    <div className="prof">
                        <NavLink className="user-icon" exact to="/signUpOrLogIn"><AiOutlineUser/></NavLink>
                    </div>
                </ul>
            </div>
            
        </div>
    )
}

export default NavBar;