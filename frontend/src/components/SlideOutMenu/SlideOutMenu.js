import './SlideOutMenu.css'
import { GrClose } from "react-icons/gr";
import { NavLink } from 'react-router-dom';


const SlideOutMenu = ({setShowSlideOut}) => {

    const handleCloseSideBar = (e) => {
        // e.preventDefault();
        // let modal = document.getElementById("menu-slide-out")
        // modal.style.display="none"
        setShowSlideOut(false)

    }

    return(
        
        <>
            <div id="bg-menu-slide-out"></div>
                <div id="menu-slide-out">
                    <button id="x-closeSideBar" onClick={handleCloseSideBar}>
                        <div className="close-container">
                            <div className="leftright"></div>
                            <div className="rightleft"></div>
                        </div>
                    </button>
                    <div id="menu-slide-content">
                        <ul id="slide-content">    
                            <NavLink id="slide-home" exact to="/">HOME</NavLink>
                            <NavLink id="slide-skincare" exact to="/products">SKIN CARE</NavLink>
                            <NavLink id="slide-haircare" exact to="/products">HAIR CARE</NavLink>
                            <NavLink id="slide-gifts" exact to="/products">GIFTS</NavLink>

                        </ul>
                    </div>
                </div>
        </>
        
    )
}

export default SlideOutMenu;