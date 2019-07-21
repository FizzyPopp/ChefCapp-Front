import React from 'react';
import { createStackNavigator, createAppContainer } from "react-navigation";

/* This is not a good solution, need to look into createBottomTabNavigator, 
 * and use createStackNavigator within each tab? */

import Login from "./src/login/Login.js";
import SignUp from "./src/sign\ up/SignUp.js";
import Market from "./src/market/Market.js";
import MyKitchen from "./src/my\ kitchen/MyKitchen.js";
import Discover from "./src/discover/Discover.js";

const AppNavigator = createStackNavigator(
  {
    Login: Login,
    SignUp: SignUp,
    Discover: Discover,
    Market: Market,
    MyKitchen: MyKitchen,
  },
  {
    initialRouteName: "Login"
  }
);

export default createAppContainer(AppNavigator);
