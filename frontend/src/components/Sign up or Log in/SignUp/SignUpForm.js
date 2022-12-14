
import React from "react";
import { useState } from "react";
import { useDispatch,useSelector } from "react-redux";
import * as sessionActions from "../../../store/session";
import { Redirect } from "react-router-dom";
// import SubmitButton from "../../Buttons/SubmitButton";
import './SignUpForm.css';
import { AiFillCloseCircle } from "react-icons/ai";
import { AiOutlineCheckCircle} from "react-icons/ai";




const SignUpForm = () => {
    
    const dispatch = useDispatch(); 
    const sessionUser = useSelector(state => state.session.user);

    const [firstName,setFirstName] = useState("");
    const [lastName,setLastName] = useState("");
    const [email,setEmail] = useState("");
    const [confirmEmail,setConfirmEmail] = useState("");
    const [password, setPassword] = useState("");
    const [confirmPassword, setConfirmPassword] = useState("");
    const [clearValidation8,setClearValidation8] = useState(false);
    const [clearValidationLetter,setClearValidationLetter] = useState(false);
    const [clearValidationNum,setClearValidationNum] = useState(false);
    const [clearValidationPunc,setClearValidationPunc] = useState(false);



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
            setClearValidation8(true)
        }else{
            length.classList.remove("valid");
            length.classList.add("invalid");
            setClearValidation8(false)
        }

        const mixLetters = /[A-Za-z]/g;
        if (e.target.value.match(mixLetters)){
            letter.classList.remove("invalid")
            letter.classList.add("valid");
            setClearValidationLetter(true)

        }else{
            letter.classList.remove("valid");
            letter.classList.add("invalid");
            setClearValidationLetter(false)

        }

        const numbers = /[0-9]/g;
        if (e.target.value.match(numbers)){
            number.classList.remove("invalid")
            number.classList.add("valid");
            setClearValidationNum(true)

        }else{
            number.classList.remove("valid");
            number.classList.add("invalid");
            setClearValidationNum(false)

        }

        const symbol = /^(?=.*[~`!@#$%^&*()--+={}\[\]|\\:;"'<>,.?/_???]).*$/
        if (e.target.value.match(symbol)){
            specialChars.classList.remove("invalid")
            specialChars.classList.add("valid");
            setClearValidationPunc(true)

        }else{
            specialChars.classList.remove("valid");
            specialChars.classList.add("invalid");
            setClearValidationPunc(false)

        }

        setPassword(e.target.value)
    }

    
    return(
        <div id="outer-sign-up">
            <h2 id="first-time">First time here?</h2>
            <form className="sign-up" onSubmit={handleSubmit}>
                        <br/>
                    <div className="firstName">
                        <span id="firstName-input" > FIRST NAME</span>               
                        <br/>
                        <input type="text" value={firstName} onChange={(e)=>setFirstName(e.target.value) } />
                        <span className="hidden" id="firstNameHidden">Please enter a valid first name</span>
                        <br/>
                    </div>
                    <div className="lastName">
                        <span> LAST NAME</span>              
                        <br/>
                        <input type="text" value={lastName} onChange={(e)=>setLastName(e.target.value)} />
                        <span className="hidden" id="lastNameHidden">Please enter a valid last name</span>
                        <br/>
                    </div>
                    <div className="email">
                        <span> EMAIL</span>          
                        <br/>
                        <input  type="text" value={email} onChange={(e)=>setEmail(e.target.value)} />
                        <span className="hidden" id="emailHidden">Error: email is required</span>
                        <br/>
                    </div>
                    <div className="confirm-email">
                        <span> CONFIRM EMAIL</span>          
                        <br/>
                        <input  id="email" type="text" value={confirmEmail} onChange={(e)=>setConfirmEmail(e.target.value)} />
                        <span className="hidden" id="confirmEmailHidden">Email addresses do not match</span>
                        <br/>
                    </div>
                    <div className="password">
                    <span> PASSWORD</span>             
                        <br/>
                        <input  type="password" value={password} onChange={handleChangePassword} />
                        <br/>
                        <div id="message">
                                <p id="length" className="invalid"> {clearValidation8 ? <AiOutlineCheckCircle/> : <AiFillCloseCircle/>} 8 characters (minimum)</p>
                                <p id="letter" className="invalid"> {clearValidationLetter ? <AiOutlineCheckCircle/> : <AiFillCloseCircle/>} 1 letter from A to Z with a mixture of both uppercase and lowercase letters (at least)</p>
                                <p id="number" className="invalid"> {clearValidationNum ? <AiOutlineCheckCircle/> : <AiFillCloseCircle/>} 1 number (at least)</p>
                                <p id="special-chars" className="invalid">{clearValidationPunc ? <AiOutlineCheckCircle/> : <AiFillCloseCircle/>} 1 punctuation mark such as !, @, #, etc.</p>
                        </div>
                        <br/>
                    </div>
                    <div className="confirm-password">
                        <span> CONFIRM PASSWORD</span>
                        <br/>
                        <input  type="password" value={confirmPassword} onChange={(e)=>setConfirmPassword(e.target.value)} required/>
                        <span  className = "hidden" id="confirmPasswordHidden">Passwords do not match</span>
                        <br/>
                    </div>
                    <br/>
                    <button id="input-button" type='submit' on>REGISTER</button>
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