
import React from "react";
import { useState } from "react";
import { useDispatch,useSelector } from "react-redux";
import * as sessionActions from "../../../store/session";
import { Redirect } from "react-router-dom";
// import SubmitButton from "../../Buttons/SubmitButton";
import './SignUpForm.css';



const SignUpForm = () => {
    
    const dispatch = useDispatch(); 
    const sessionUser = useSelector(state => state.session.user);

    const [firstName,setFirstName] = useState("");
    const [lastName,setLastName] = useState("");
    const [email,setEmail] = useState("");
    const [confirmEmail,setConfirmEmail] = useState("");
    const [password, setPassword] = useState("");
    const [confirmPassword, setConfirmPassword] = useState("");


    if (sessionUser) return <Redirect to="/profile" />;


    const handleSubmit = (e) => {
        e.preventDefault();
        const firstNameVar = document.getElementById("firstNameHidden");
        const lastNameVar = document.getElementById("lastNameHidden");
        const emailVar = document.getElementById("emailHidden");
        const confirmEmailVar = document.getElementById("confirmEmailHidden");
        const confirmPasswordVar = document.getElementById("confirmPasswordHidden");

        if (firstName === ""){
            firstNameVar.classList.remove("hidden")
        }else{
            firstNameVar.classList.add("hidden")
        }
        if (lastName === ""){
            lastNameVar.classList.remove("hidden")
        }else{
            lastNameVar.classList.add("hidden")
        }

        const validEmail =  /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        if (!email.match(validEmail)){
            emailVar.classList.remove("hidden")
        }else{
            emailVar.classList.add("hidden")
        }

        if (email !== confirmEmail){
            confirmEmailVar.classList.remove("hidden");
        } else{
            confirmEmailVar.classList.add("hidden");
        }

        if (password !== confirmPassword){
            confirmPasswordVar.classList.remove("hidden");
        } else{
            confirmPasswordVar.classList.add("hidden");
        }

        if (password === confirmPassword && email === confirmEmail) {
            return dispatch(sessionActions.signup({user:{ firstName, lastName, email, password }}))
        }
    };




    const handleChangePassword = (e) => {
        const length = document.getElementById("length");
        const letter = document.getElementById("letter");
        const number = document.getElementById("number");
        const specialChars = document.getElementById("special-chars");

        e.preventDefault();

        if (e.target.value.length >= 8){
            length.classList.remove("invalid")
            length.classList.add("valid");
        }else{
            length.classList.remove("valid");
            length.classList.add("invalid");
        }

        const mixLetters = /[A-Za-z]/g;
        if (e.target.value.match(mixLetters)){
            letter.classList.remove("invalid")
            letter.classList.add("valid");
        }else{
            letter.classList.remove("valid");
            letter.classList.add("invalid");
        }

        const numbers = /[0-9]/g;
        if (e.target.value.match(numbers)){
            number.classList.remove("invalid")
            number.classList.add("valid");
        }else{
            number.classList.remove("valid");
            number.classList.add("invalid");
        }

        const symbol = /^(?=.*[~`!@#$%^&*()--+={}\[\]|\\:;"'<>,.?/_₹]).*$/
        if (e.target.value.match(symbol)){
            specialChars.classList.remove("invalid")
            specialChars.classList.add("valid");
        }else{
            specialChars.classList.remove("valid");
            specialChars.classList.add("invalid");
        }

        setPassword(e.target.value)
    }

    
    return(
        <div id="outer-sign-up">
            <h2 id="first-time">First time here?</h2>
            <form className="sign-up" onSubmit={handleSubmit}>
                        <br/>
                    <div class="firstName">
                        <span > FIRST NAME</span>               
                        <br/>
                        <input type="text" value={firstName} onChange={(e)=>setFirstName(e.target.value) } required/>
                        <span class="hidden" id="firstNameHidden">Please enter a valid first name</span>
                        <br/>
                    </div>
                    <div className="lastName">
                        <span> LAST NAME</span>              
                        <br/>
                        <input type="text" value={lastName} onChange={(e)=>setLastName(e.target.value)} required/>
                        <span class="hidden" id="lastNameHidden">Please enter a valid last name</span>
                        <br/>
                    </div>
                    <div className="email">
                        <span> EMAIL</span>          
                        <br/>
                        <input  type="text" value={email} onChange={(e)=>setEmail(e.target.value)} required/>
                        <span class="hidden" id="emailHidden">Error: email is required</span>
                        <br/>
                    </div>
                    <div className="confirm-email">
                        <span> CONFIRM EMAIL</span>          
                        <br/>
                        <input  type="text" value={confirmEmail} onChange={(e)=>setConfirmEmail(e.target.value)} required/>
                        <span class="hidden" id="confirmEmailHidden">Email addresses do not match</span>
                        <br/>
                    </div>
                    <div className="password">
                    <span> PASSWORD</span>             
                        <br/>
                        <input  type="password" value={password} onChange={handleChangePassword} required/>
                        <br/>
                        <div id="message">
                                <p id="length" class="invalid">8 characters (minimum)</p>
                                <p id="letter" class="invalid">1 letter from A to Z with a mixture of both uppercase and lowercase letters (at least)</p>
                                <p id="number" class="invalid">1 number (at least)</p>
                                <p id="special-chars" class="invalid">1 punctuation mark such as !, @, #, etc.</p>
                        </div>
                        <br/>
                    </div>
                    <div className="confirm-password">
                        <span> CONFIRM PASSWORD</span>
                        <br/>
                        <input  type="password" value={confirmPassword} onChange={(e)=>setConfirmPassword(e.target.value)} required/>
                        <span  class = "hidden" id="confirmPasswordHidden">Passwords do not match</span>
                        <br/>
                    </div>
                    <br/>
                    <button className="input" type='submit' on>REGISTER</button>
                    <br/>
                    <div id="subscription-wrapper">
                        <input id="checkbox-sub" type="checkbox" />
                        <span id="privacy">Click the box at left to get the good stuff straight to your email inbox, including info about exclusive offers, product launches, and events. Unsubscribe anytime. Privacy Policy.</span>       
                    </div>
            </form>
        </div>


    )
}

export default SignUpForm;