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

        <div className="profile-page">
            <button onClick={logOut}>LogOut</button>
        </div>
    )
}

export default Profile;