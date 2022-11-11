import React, { useEffect, useState } from "react";
// import "./Confirmation.css";
import { useNavigate, useParams } from "react-router-dom";
import axios from "axios";
const init = {

  cid:JSON.parse(localStorage.getItem("loggedinuser")).cid,
  mid:JSON.parse(localStorage.getItem("movieid")),
  tid:JSON.parse(localStorage.getItem("theaterdata")).tid,
  screenno: JSON.parse(localStorage.getItem("theaterdata")).screens,
 show_date:  localStorage.getItem("dates"),
  slot_id: JSON.parse(localStorage.getItem("slotid")),
  charges: JSON.parse(localStorage.getItem("price")),
 payment_mode:"UPI",
 seatNames:JSON.parse(localStorage.getItem("arr"))
};

function Confirmation() {
  const navigate = useNavigate();
  const {totalPrice , selected, price } = useParams();
  // const[charges,setCharges]=useState(totalPrice);
  // setCharges(totalPrice);
  // const[payment_mode,setPayment]=useState(0);
  // const[seatNames,setseatNames]=useState(selected);
  // setseatNames(selected);
  const str = selected;
  const count = str.split(",");
  const number = count.length;
  const value = Number(price);
  //  const[payment,setPayment]=useState("");
  const [booking, setBooking] = useState(init);
  const allotData=()=>{
    axios
      .post("http://localhost:8080/saveBookingMaster",booking)
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
              <td>{selected}</td>
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
              <td>{totalPrice}</td>
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

export default Confirmation;