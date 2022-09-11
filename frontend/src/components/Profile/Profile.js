import './Profile.css'
import * as sessionActions from '../../store/session'
import { useDispatch } from 'react-redux' 
import { Redirect } from "react-router-dom";
import { useSelector } from 'react-redux';

const Profile = () => {

    const dispatch = useDispatch();


    const logOut =(e) => {
        e.preventDefault();
        dispatch(sessionActions.logout())
    }

    const sessionUser = useSelector(state => state.session.user);
    if (!sessionUser) return <Redirect to="/signUpOrLogIn" />;

    return (

        <div className="profile">
            <div className="profile-page">
                <button className="logout-button" onClick={logOut}>LogOut</button>  
                <h1 id="profile-h1">we all need our own space</h1>
                <h2 id="profile-h2">That’s what this page is for! This is the place for you and only you. Organize, explore, make
a wish list, click around, and get rewards. Trust us: Getting personal is a good thing.</h2>
            </div>
            <div>
                <h1>Hello,</h1>
                
            </div>
        </div>
        
    )
}

export default Profile;