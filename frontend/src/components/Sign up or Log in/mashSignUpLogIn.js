import SignUpForm from "./SignUp/SignUpForm";
import LogInForm from "./LogIn/LogInForm";

const mashForm = () => {
    return (
        <div id="registration">
            <LogInForm/>
            <SignUpForm/>
        </div>
    )
}

export default mashForm;