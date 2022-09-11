import './SlideOutMenu.css'
import { GrClose } from "react-icons/gr";
import { NavLink } from 'react-router-dom';


const SlideOutMenu = () => {

    const handleCloseSideBar = (e) => {
        e.preventDefault();
        let modal = document.getElementById("menu-slide-out")
        modal.style.display="none"
    }

    return(
        <div id="menu-slide-out">
            <button id="x-closeSideBar" onClick={handleCloseSideBar}><GrClose/></button>
            <div id="menu-slide-content">
                <ul id="slide-content">    
                    <NavLink id="slide-home" exact to="/">HOME</NavLink>
                    <NavLink id="slide-skincare" exact to="/products">SKIN CARE</NavLink>
                </ul>
            </div>
   
        </div>
    )
}

export default SlideOutMenu;