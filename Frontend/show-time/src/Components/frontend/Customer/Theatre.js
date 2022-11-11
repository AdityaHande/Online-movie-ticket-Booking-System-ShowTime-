import React, { useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import ArrowCircleRightIcon from "@mui/icons-material/ArrowCircleRight";
import "./Theatre.css";
import SilverSeats from "./SilverSeats";
import GoldSeats from "./GoldSeats";
import PlatinumSeats from "./PlatinumSeats";

function Theatre() {
  const [selected, setSelected] = useState([]);
  localStorage.setItem("arr",JSON.stringify(selected))
  console.log(selected);
  const price = 100;
  const totalPrice = price * selected.length;
  localStorage.setItem("price",totalPrice)

  const [selected1, setSelected1] = useState([]);
  const price1 = 120;
  const totalPrice1 = price1 * selected1.length;
  localStorage.setItem("price1",totalPrice1)
  localStorage.setItem("arr1",JSON.stringify(selected1))
  const [selected2, setSelected2] = useState([]);
  const price2 = 150;
  const totalPrice2 = price2 * selected2.length;
  localStorage.setItem("price2",totalPrice2)
  localStorage.setItem("arr2",JSON.stringify(selected2))
  const navigate = useNavigate();
  console.log("❤️❤️🥰", selected.length);
  return (
    <div className="container-fluid bg-light">
      <div className="theatre">
        <div
          className="theatre_image"
          style={{
            backgroundSize: "cover",
            // backgroundImage: `url("./public/images/Logo.jpg")`,
            backgroundPosition: "center center",
            objectFit: "contain",
          }}
        >
          <h2 className="theatre_body">
            <spam>{}</spam>
          </h2>
        </div>
        <SilverSeats setSelected={setSelected} />
        <GoldSeats setSelected1={setSelected1} />
        <PlatinumSeats setSelected2={setSelected2} />

        <div className="theatre_title">
          <h2 className="theatre_mall"></h2>
        </div>

        {selected.length !== 0 ? (
          <>
            <div className="theatre_bottom">
              <>
                <spam>
                  <h3>SEATS : {selected.toString()}</h3>
                </spam>
                <div className="theatre_price">
                  <h3>Total INR</h3>
                  <h1>₹{totalPrice}</h1>
                </div>
              </>
            </div>

            <div className="theatre_footer">
              <ArrowCircleRightIcon
                onClick={() =>
                  navigate(`/Confirmation/${selected}/${totalPrice}`)
                }
                className="theatre_icon"
              />
            </div>
          </>
        ) : null}

        {selected1.length !== 0 ? (
          <>
            <div className="theatre_bottom">
              <>
                <spam>
                  <h3>SEATS : {selected1.toString()}</h3>
                </spam>
                <div className="theatre_price">
                  <h3>Total INR</h3>
                  <h1>₹{totalPrice1}</h1>
                </div>
              </>
            </div>

            <div className="theatre_footer">
              <ArrowCircleRightIcon
                onClick={() =>
                  navigate(`/Confirmation1/${selected1}/${totalPrice1}`)
                }
                className="theatre_icon"
              />
            </div>
          </>
        ) : null}

        {selected2.length !== 0 ? (
          <>
            <div className="theatre_bottom">
              <>
                <spam>
                  <h3>SEATS : {selected2.toString()}</h3>
                </spam>
                <div className="theatre_price">
                  <h3>Total INR</h3>
                  <h1>₹{totalPrice2}</h1>
                </div>
              </>
            </div>

            <div className="theatre_footer">
              <ArrowCircleRightIcon
                onClick={() =>
                  navigate(`/Confirmation2/${selected2}/${totalPrice2}`)
                }
                className="theatre_icon"
              />
            </div>
          </>
        ) : null}
      </div>
    </div>
  );
}

export default Theatre;
