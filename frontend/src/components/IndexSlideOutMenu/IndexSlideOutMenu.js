import './IndexSlideOutMenu.css'
import { AiOutlineUp } from "react-icons/ai";

const IndexSlideOutMenu = () => {

    const handleClick = (e) => {
        e.preventDefault();
        let slideDownModal = document.getElementById("slide-down-modal")
        slideDownModal.style.display = "none"
    }
    return (
        <div id="slide-down-modal">
            <button onClick={handleClick} id ="slide-down" type="button">
                <AiOutlineUp className="up-menu-icon"/>
            </button>
        </div>
    )
}

export default IndexSlideOutMenu;