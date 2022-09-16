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
                            <NavLink id="slide-products" exact to="/products"><p onClick={()=>setShowSlideOut(false)}>All COLLECTIONS</p></NavLink>
                            <NavLink id="slide-skincare" exact to="/products/skincare"><p onClick={()=>setShowSlideOut(false)}>SKIN CARE</p></NavLink>
                            <NavLink id="slide-haircare" exact to="/products/haircare"><p onClick={()=>setShowSlideOut(false)}>HAIR CARE</p></NavLink>
                            <NavLink id="slide-gifts" exact to="/products/gifts"><p onClick={()=>setShowSlideOut(false)}>GIFTS</p></NavLink>

                        </ul>
                    </div>
                </div>
        </>
        
    )
}

export default SlideOutMenu;