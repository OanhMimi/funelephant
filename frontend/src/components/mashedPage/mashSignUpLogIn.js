import SignUpForm from "../Sign up or Log in/SignUp/SignUpForm";
import LogInForm from "../Sign up or Log in/LogIn/LogInForm";
import './mashSignUpLogIn.css';
import SignUpHover from "../SignUpHover/SignUpHover";

const mashForm = () => {
    return (
        <div id="background">
            <SignUpHover/>
            <div id="registration">
                <LogInForm/>
                <SignUpForm/>
            </div>
        </div>
       
    )
}

export default mashForm;