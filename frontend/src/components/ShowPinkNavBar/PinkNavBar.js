import './PinkNavBar.css'
import { FaHeart } from "react-icons/fa";

const PinkNavBar = ({product}) => {

 
    return (
        <div className="pink-nav-sticky">
            <div id="pink-bar-display">
                <div id="first-pink-bar-display">
                    <ul id="pink-nav-display-show1">{product.name}</ul>
                    <ul id="pink-nav-display-show2">${product.price}.00</ul>
                </div>
                <div id="second-pink-bar-display">
                    <ul>
                        <button id="buy-button">Buy</button>
                    </ul>
                    <div id="likes-icon">
                        < FaHeart className="fa-heart"/>
                    </div>
                </div>
            </div> 
        </div>
    )
}

export default PinkNavBar;