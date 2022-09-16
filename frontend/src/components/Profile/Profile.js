import './Profile.css'
import * as sessionActions from '../../store/session'
import { useDispatch } from 'react-redux' 
import { Redirect, useHistory } from "react-router-dom";
import { useSelector } from 'react-redux';

import testingImg from './Silkamino_Leave-In_Sprite.png';
import testingImg2 from './1_Littles_6.0_Motion_Sprite.png'

import pink1 from './flowers-negative-2.png'
import icon1pink from './eyes-negative-1.png'
import blue1 from './flowers-negative-1.png'
import icon2pink from './eyes-negative-2.png'
import yellow1 from './yellow-negative-3.png'
const Profile = () => {

    const dispatch = useDispatch();
    const history = useHistory();

    const logOut =(e) => {
        e.preventDefault();
        dispatch(sessionActions.logout())
        history.push("/") 
    }

    const firstName = useSelector(state=> state.session.user.firstName)

    const sessionUser = useSelector(state => state.session.user);

    if (!sessionUser) return <Redirect to="/signup" />;

    return (
        <div className="profile-container">
            <div className="profile">
                <div id="profile-h1">
                    <h1>we all need our own space</h1>
                    <h2 id="header-profile-msg">That’s what this page is for! This is the place for you and only you. Organize, explore, make
a wish list, click around, and get rewards. Trust us: Getting personal is a good thing.        
                    </h2>
                </div>
                <div id="wishlist-reviews-all">
                    <div id="your-wishlist">Your Wishlist</div>
                    <div id="LL">||</div>
                    <div id="your-reviews" >Your Reviews</div>
                </div>
                <div id="flex-first-profile">
                    <div>
                        <div id="aqua-greeting">
                        <h1 id="hello">Hello,</h1>
                        <h2 id="profile-firstname">{firstName}</h2>
                        <button className="logout-button" onClick={logOut}>LogOut</button>  

                        </div>

                    </div>
                    <div>
                        <div className="img-profile-div"><img id="profileicon-1" src={pink1}/>
                            <h2 id="awaits-wishlist">your wish lists awaits</h2>
                            <h2 id="awaits-msg">All your Fun Elepehant favorites, catalogued in one place. Shop it, all to it, or not-sosubtly share it with your closest friends right around your birthday.M There;s not wrong way to manage your wish list!</h2>
                        </div>
                    </div>  
                    <div>
                    <img id="profileicon-2" src={icon1pink}/>
                    </div>
                </div>
                <div>
                        
                </div>
                <div>

                </div>
                <div className="profile-page">
                    <img id="yellow-icon" src={yellow1}/>
                    <div id="blue-div">
                        <img id="blue-icon" src={blue1}/>
                        <h1 id="snatch">Snatch it before its gone!</h1>
                        <h1 id="profile-msg-2">remember not to miss out on the new upcoming products! </h1>
                    </div>  
                </div>
                <div>
                                 
                </div>
            </div>

        
        
        </div>
        
    )
}

export default Profile;