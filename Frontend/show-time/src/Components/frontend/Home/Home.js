import React from "react";
import { Route, Routes } from "react-router-dom";
import Login from "../Login";
import Header from "./Header";
import HomePageComponent from "./HomePageComponents/HomePageComponent";
import CustomerRegistration from "../CustomerRegistration";
import OwnerRegistration from "../OwnerRegistration";

import CustomerUI from "../Customer/CustomerUI";
import AdminUI from "../../admin/AdminUI";
import OwnerUI from "../../Owner-ui/OwnerUI";
import Footer from "./Footer";
import TheaterAndCityListByMovie from "../Customer/TheaterAndCityListByMovie";
import ShowsSlot from "../Customer/ShowsSlot";

import Theatre from "../Customer/Theatre";
import Confirmation from "../Customer/Confirmation";
import Final from "../Customer/Final";
import ShowTimeFeedback from "../Customer/ShowTimeFeedback";
import Confirmation1 from "../Customer/Confirmation1";
import Confirmation2 from "../Customer/Confirmation2";

const Home = () => {
  return (
    <>
      <Header />
      <Routes>
        <Route path="" element={<HomePageComponent />} />
        <Route path="login" element={<Login />} />
        <Route path="/customer" element={<CustomerRegistration />} />
        <Route path="/owner" element={<OwnerRegistration />} />
        <Route path="/custui" element={<CustomerUI />} />
        <Route path="/ownerui" element={<OwnerUI />} />
        {/* <Route path="/addmovie" element={<Addmovie />} /> */}
        <Route path="/admin" element={<AdminUI />} />
        {/* <Route path="/verification" element={<Verification />} />*/}
        <Route
          path="/theatercitybymovie/:mid/:city"
          element={<TheaterAndCityListByMovie />}
        />
        <Route path="/showsslot" element={<ShowsSlot />} />
        <Route path="/grid" element={<Theatre />} />
        <Route path="/Confirmation/:selected/:totalPrice" element={<Confirmation />} />
        <Route path="/Confirmation1/:selected1/:totalPrice1" element={<Confirmation1 />} />
        <Route path="/Confirmation2/:selected2/:totalPrice2" element={<Confirmation2 />} />

        <Route path="/final" element={<Final/>} />
        <Route path="/feedback" element={<ShowTimeFeedback/>} />
      </Routes>
       <Footer /> 
    </>
  );
};

export default Home;
