import './SplashPage.css'
import splashImage1 from './Littles-6.0_PDP_Image_1.jpg'

const SplashIndex = () => {


    return(
        <div>
            <div className="block"></div>
            <div className="splashImage1">
                <img src={splashImage1}/>
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