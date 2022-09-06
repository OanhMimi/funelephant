
import React from "react";
import { useState } from "react";
import { useDispatch,useSelector } from "react-redux";
import * as sessionActions from "../../../store/session";
import { Redirect } from "react-router-dom";
import SubmitButton from "../../Buttons/SubmitButton";
import './SignUpForm.css';



const SignUpForm = () => {
    
    const dispatch = useDispatch(); 
    const sessionUser = useSelector(state => state.session.user);

    const [firstName,setFirstName] = useState("");
    const [lastName,setLastName] = useState("");
    const [email,setEmail] = useState("");
    const [password, setPassword] = useState("");
    const [confirmPassword, setConfirmPassword] = useState("");
    const [errors, setErrors] = useState([]);


    if (sessionUser) return <Redirect to="/" />;


    const handleSubmit = (e) => {
        e.preventDefault();
        if (password === confirmPassword) {
            setErrors([]);
            return dispatch(sessionActions.signup({ firstName, lastName, email, password }))
    //     .catch(async (res) => {
    //     let data;
    //     try {
    //       // .clone() essentially allows you to read the response body twice
    //       data = await res.clone().json();
    //     } catch {
    //       data = await res.text(); // Will hit this case if, e.g., server is down
    //     }
    //     if (data?.errors) setErrors(data.errors);
    //     else if (data) setErrors([data]);
    //     else setErrors([res.statusText]);
    //   });
    }
        // return setErrors(['Confirm Password field must be the same as the Password field']);
    };

    return(
        <div className="registration">
            <form className="sign-up" onSubmit={handleSubmit}>
                {/* <ul>
                {errors.map((error) => <li key={error}>{error}</li>)}
                </ul> */}
                <label>
                    <h2 className="first-time">First time here?</h2>
                    <br/>
                    <label/> FIRST NAME
                    <br/>
                    <input type="text" value={firstName} onChange={(e)=>setFirstName(e.target.value)} required/>
                    <br/>
                    <label/> LAST NAME
                    <br/>
                    <input type="text" value={lastName} onChange={(e)=>setLastName(e.target.value)} required/>
                    <br/>
                    <label/> EMAIL
                    <br/>
                    <input type="text" value={email} onChange={(e)=>setEmail(e.target.value)} required/>
                    <br/>
                    <label/> PASSWORD
                    <br/>
                    <input type="text" value={password} onChange={(e)=>setPassword(e.target.value)} required/>
                    <br/>
                    <li>8 characters (minimum)</li>
                    <li>1 letter from A to Z with a mixture of both uppercase and lowercase letters (at least)</li>
                    <li>1 number (at least)</li>
                    <li>1 punctuation mark such as !, @, #, etc.</li>
                    <br/>
                    <label/> CONFIRM PASSWORD
                    <br/>
                    <input type="text" value={confirmPassword} onChange={(e)=>setConfirmPassword(e.target.value)} required/>
                    <br/>
                    <button type='submit'>Register</button>
                </label>
        </form>
    </div>

    )
}

export default SignUpForm;