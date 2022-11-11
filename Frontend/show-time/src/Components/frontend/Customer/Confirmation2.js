import React, { useEffect, useState } from "react";
// import "./Confirmation.css";
import { useNavigate, useParams } from "react-router-dom";
import axios from "axios";
const init2 = {

  cid:JSON.parse(localStorage.getItem("loggedinuser")).cid,
  mid:JSON.parse(localStorage.getItem("movieid")),
  tid:JSON.parse(localStorage.getItem("theaterdata")).tid,
  screenno: JSON.parse(localStorage.getItem("theaterdata")).screens,
 show_date:  localStorage.getItem("dates"),
  slot_id: JSON.parse(localStorage.getItem("slotid")),
  charges: JSON.parse(localStorage.getItem("price2")),
 payment_mode:"UPI",
 seatNames:JSON.parse(localStorage.getItem("arr2"))
};

function Confirmation2() {
  const navigate = useNavigate();
  const {totalPrice2 , selected2, price2 } = useParams();
  // const[charges,setCharges]=useState(totalPrice);
  // setCharges(totalPrice);
  // const[payment_mode,setPayment]=useState(0);
  // const[seatNames,setseatNames]=useState(selected);
  // setseatNames(selected);
  const str = selected2;
  const count = str.split(",");
  const number = count.length;
  const value = Number(price2);
  //  const[payment,setPayment]=useState("");
  const [booking2, setBooking] = useState(init2);
  const allotData=()=>{
    axios
      .post("http://localhost:8080/saveBookingMaster",booking2)
      .then((response) => {
        if (response.status === 200) {
          alert("Booked Successfully");
          navigate(`/final`)
        }
       
      })
      .catch((error) => {
        //     console.log(error);
        alert("Not Successful");
      });
}
   
  
  const theater = JSON.parse(localStorage.getItem("theaterdata"));
  const date = localStorage.getItem("dates");
  // let screens = JSON.parse(localStorage.getItem("theaterdata")).screens;
  return (
    <div className="container">
      <div className="row d-flex justify-content-center">
        <div class="col-6 border rounded-2 mt-5 p-4 shadow  mb-5 bg-body rounded">
          <table>
            <tr>
              <td>Theater:</td>
              <td>{JSON.parse(localStorage.getItem("theaterdata")).tname}</td>
            </tr>

            <tr>
              <td>Screen:</td>
              <td>{JSON.parse(localStorage.getItem("theaterdata")).screens}</td>
            </tr>

            <tr>
              <td>Customer Name:</td>
              <td>{JSON.parse(localStorage.getItem("loggedinuser")).cname}</td>
            </tr>

            <tr>
              <td>Ticket Number:</td>
              <td>{selected2}</td>
            </tr>

            <tr>
              <td>Show Date:</td>
              <td>{date}</td>
            </tr>

            <tr>
              <td>Total Seats:</td>
              <td>{number}</td>
            </tr>

            <tr>
              <td>Total Price:</td>
              <td>{totalPrice2}</td>
            </tr>

            <tr>
              <td>Payment Option:</td>
              <td>
                <select>
                  <option value="UPI">UPI</option>
                  <option value="Card">Card</option>
                </select>
              </td>
            </tr>

            <tr>
              <td>

                <button type="button" class="btn btn-primary"
                  // onClick={() => navigate(`/final`)}
                  onClick={allotData}
                  className="confirmation_payment"
                >
                  <h3>Confirm and pay</h3>
                </button>

              </td>
              <td>
              <button type="button" class="btn btn-primary"
                   onClick={() => navigate(`/custui`)}
                 
                  className="confirmation_payment"
                >
                  <h3>Cancel</h3>
                </button>
              </td>
            </tr>
          </table>
        </div>
      </div>
    </div>
  );
}

export default Confirmation2;