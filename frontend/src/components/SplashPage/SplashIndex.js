import './SplashPage.css'
import splashImage1 from './Littles-6.0_HPH_1_1400X950PX.jpg'
import splashImage2 from './F_114811.jpeg'

const SplashIndex = () => {

    return(
        
        <div className="splashPage-outer-div">
                <h1 id="side-slogan">Keep your friends close, and your moisturizer closer.</h1>
                <div className="threeSplashImg">
                    <div className="pink-block"></div>
                    <div id="free-shipping">ENJOY FREE GROUND SHIPPING ON ALL ORDERS! PLUS, ORDERS $200+ GET 2-DAY SHIPPING - ON US!</div>
                    <img id="splash-1" src={splashImage1}/>
                    <img  id="splash-2" src={splashImage2}/>
                </div>
                <div className="splash-hover">
                    <div className="splash-hover-slow" aria-hidden="true">
                        <span aria-hidden="true">The Best-Case Scenario</span>
                        <span aria-hidden="true">The Best-Case Scenario</span>
                        <span aria-hidden="true">The Best-Case Scenario</span>
                        <span aria-hidden="true">The Best-Case Scenario</span>
                    </div>
                </div>
               
        </div>
   
    )
}

export default SplashIndex;