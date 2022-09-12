import React from "react";
import { Route, Switch } from "react-router-dom";
import NavBar from './components/Navbar'; 
import SplashIndex from './components/SplashPage/SplashIndex'
// import SignUpForm from './components/Sign up or Log in/SignUp/SignUpForm';
// import LogInForm from './components/Sign up or Log in/LogIn/LogInForm';
import MashForm from "./components/mashedPage/mashSignUpLogIn";
import Profile from "./components/Profile/Profile";
import ProductIndex from "./components/Product/ProductIndex";
import ProductShow from "./components/Product/ProductShow";

const App = () => (
    <>
      <NavBar/>
      
          <Switch>
            <Route exact path="/" component={SplashIndex}/>
            <Route exact path="/signUpOrLogIn">
              <MashForm/>
            </Route>
            <Route exact path="/profile" component={Profile}/>
            <Route exact path="/products" component={ProductIndex}/>
            <Route exact path="/products/:productId" component={ProductShow}  />
        </Switch>
    </>
);

export default App;