import './SplashPage.css'
import splashImage1 from './Littles-6.0_HPH_1_1400X950PX.jpg'
import splashImage2 from './F_114811.jpeg'

const SplashIndex = () => {


    return(
        
        <div id="splashPage-outer-div">
            <div className="block">
                <div className="threeSplashImg">
                    <div id="background-color" className="center">
                    </div>
                    <h2 id="free-shipping">ENJOY FREE GROUND SHIPPING ON ALL ORDERS! PLUS, ORDERS $200+ GET 2-DAY SHIPPING - ON US!</h2>
                    <div>
                        <div className="splash2">
                            <img  id="splash-2" src={splashImage2}/>
                        </div>
                        <div className="splash1">
                            <img id="splash-1" src={splashImage1}/>
                        </div>
                      
                    </div>
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
      

        </div>
   
    )
}

export default SplashIndex;