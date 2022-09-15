import './Profile.css'
import * as sessionActions from '../../store/session'
import { useDispatch } from 'react-redux' 
import { Redirect, useHistory } from "react-router-dom";
import { useSelector } from 'react-redux';

import testingImg from './Silkamino_Leave-In_Sprite.png';
import testingImg2 from './1_Littles_6.0_Motion_Sprite.png'


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
                    <h2>That’s what this page is for! This is the place for you and only you. Organize, explore, make
a wish list, click around, and get rewards. Trust us: Getting personal is a good thing.        
                    </h2>
                </div>
                <div id="wishlist-reviews-all">
                    <div id="your-wishlist">Your Wishlist</div>
                    <div>||</div>
                    <div>Your Reviews</div>
                </div>
                <div>

                </div>
                <div>

                </div>
                <div>

                </div>
                <div className="profile-page">
                    <button className="logout-button" onClick={logOut}>LogOut</button>  
                    <h1 id="profile-h1">we all need our own space</h1>
                    <h2 id="profile-h2">That’s what this page is for! This is the place for you and only you. Organize, explore, make
    a wish list, click around, and get rewards. Trust us: Getting personal is a good thing.</h2>
                </div>
                <div>
                    <h1>Hello,</h1>
                    <h2>{firstName}</h2>
                    <img id="sprite-test" src={testingImg}/>                
                </div>
            </div>

        
        
        </div>
        
    )
}

export default Profile;