import React from "react";
import { Route, Switch } from "react-router-dom";
import NavBar from './components/Navbar'; 
import SplashIndex from './components/SplashPage/SplashIndex'
import MashForm from "./components/mashedPage/mashSignUpLogIn";
import Profile from "./components/Profile/Profile";
import ProductIndex from "./components/Product/ProductIndex";
import ProductShow from "./components/Product/ProductShow";
import ScrollToTop from "./components/ScrollToTop";
import CheckOut from "./components/CheckOut";
import SkinCareIndex from "./components/Product/SkinCareIndex";
import HairCareIndex from "./components/Product/HairCareIndex";
import GiftsIndex from "./components/Product/GiftsIndex";

const App = () => (
    <>
      <NavBar/>
      
          <Switch>
            <Route exact path="/">
              <SplashIndex/>
              <ScrollToTop/>
            </Route>
            <Route exact path="/signup">
              <MashForm/>
              <ScrollToTop/>
            </Route>
            <Route exact path="/profile">
              <Profile/>
              <ScrollToTop/>
            </Route>
            <Route exact path="/products">
              <ProductIndex/>
              <ScrollToTop/>
            </Route>
            <Route exact path="/products/skincare">
              <SkinCareIndex />
            </Route>
            <Route exact path="/products/haircare">
              <HairCareIndex />
            </Route>
            <Route exact path="/products/gifts">
              <GiftsIndex />
            </Route>
            <Route exact path="/products/:productId">
              <ScrollToTop/>
              <ProductShow/>
            </Route>
            <Route exact path="/CheckOut">
              <CheckOut />
            </Route>
        </Switch>
    </>
);

export default App;