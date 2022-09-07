import SignUpForm from "./SignUp/SignUpForm";
import LogInForm from "./LogIn/LogInForm";
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