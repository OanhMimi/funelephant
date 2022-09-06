import React from "react";
import { useDispatch } from "react-redux";
import { useState } from "react";
// import SubmitButton from "../../Buttons/SubmitButton";
import './LogInForm.css';
import { login } from '../../../store/session';

const LogInForm = () => {

    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    const dispatch = useDispatch();

    const handleSubmit = (e) => {
        e.preventDefault();
        return dispatch(login({ email, password }));
    }

    return(
        <div className="registration">
            <form className="log-in" onSubmit={handleSubmit}>
                <label>
                    <h2 className="logging-in">Already one of Us?</h2>
                    <br/>
                    <label/>EMAIL ADDRESS
                    <br/>
                    <input type="text" value={email} onChange={(e) => setEmail(e.target.value)}/>
                    <br/>
                    <label/>PASSWORD
                    <br/>
                    <input type="text" value={password} onChange={(e) => setPassword(e.target.value)}/>
                    <br/>
                    <button>Submit</button>
                </label>
            </form>
        </div>
    )
}

export default LogInForm;