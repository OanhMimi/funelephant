import React from "react";
import { Route, Switch } from "react-router-dom";
import NavBar from './components/Navbar'; 
import SplashIndex from './components/SplashIndex'
// import SignUpForm from './components/Sign up or Log in/SignUp/SignUpForm';
// import LogInForm from './components/Sign up or Log in/LogIn/LogInForm';
import PinkNav from './components/Pink Nav Bar/pinkNav'
import MashForm from "./components/Sign up or Log in/mashSignUpLogIn";
import Profile from "./components/Profile/Profile";

const App = () => (
    <>
      <PinkNav/>
      <NavBar />

          <Switch>
            <Route exact path="/" component={SplashIndex}/>
            <Route exact path="/signUpOrLogIn">
              <MashForm/>
            </Route>
            <Route exact path="/profile" component={Profile}/>
        </Switch>
    </>
);

export default App;