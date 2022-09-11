import React from "react";
import { useDispatch,useSelector } from "react-redux";
import { useState } from "react";
// import SubmitButton from "../../Buttons/SubmitButton";
import './LogInForm.css';
import * as sessionActions from "../../../store/session";
import { Redirect } from "react-router-dom";



const LogInForm = () => {

    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    const dispatch = useDispatch();

    const sessionUser = useSelector(state => state.session.user);

    if (sessionUser) return <Redirect to="/profile" />;

    const handleSubmit = (e) => {
        e.preventDefault();
        const user = { email, password }
        return dispatch(sessionActions.login(user));

    }
    const demoUser = (e) => {
        e.preventDefault();
        dispatch(sessionActions.login({
          email: "darreneidDOTA@gmail.com",
          password: "imtoosmartFormyOwnGood1"
        }))
      }

    return(
        <div>
            <form className="log-in" onSubmit={handleSubmit}>
                <label>
                    <h2 className="logging-in">Already one of Us?</h2>
                    <br/>
                    <div className="email-address">
                        <span>EMAIL ADDRESS</span>
                        <br/>
                        <input type="text" value={email} onChange={(e) => setEmail(e.target.value)}/>
                        <br/>
                    </div>
                    <div className="pw">
                        <span>PASSWORD</span>
                        <br/>
                        <input type="password" value={password} onChange={(e) => setPassword(e.target.value)}/>
                        <br/>
                    </div>
                    <span class="hidden" id="emailPasswordValidation">Email address/ Password combination not recognized</span>
                    <br/>
    
                    <button className="input" type="Submit">Sign In</button>
                    <br/>
                    <br/>
                    <button className="input" onClick={demoUser}>Demo User</button>
                </label>
            </form>
        </div>
    )
}

export default LogInForm;