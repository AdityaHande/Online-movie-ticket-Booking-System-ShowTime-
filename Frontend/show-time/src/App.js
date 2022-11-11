import React from "react";
import { Route, Routes } from "react-router-dom";
import BlankLayout from "./Components/layouts/BlankLayout";
import FullLayout from "./Components/layouts/FullLayout";
const App = () => {
  return (
    <>
      <Routes>
        <Route path="/*" element={<BlankLayout />} />
        <Route path="secured" element={<FullLayout />} />
      </Routes>
    </>
  );
};

export default App;
