import axios from "axios";
import React, { useEffect, useState } from "react";
import SeatPicker from "react-seat-picker";
import "./Seats.css";
function PlatinumSeats({ setSelected2 }) {
  const rows = [
    [
      { id: 1, number: "J1" },
      { id: 2, number: "J2" },
      { id: 3, number: "J3" },
      { id: 4, number: "J4" },
      { id: 24, number: "J5" },
      { id: 34, number: "J6" },
      { id: 44, number: "J7" },

      null,
      { id: 5, number: "J8" },
      { id: 6, number: "J9" },
      { id: 7, number: "J10" },
    ],
    [
      { id: 11, number: "K1" },
      { id: 12, number: "K2" },
      { id: 13, number: "K3" },
      { id: 14, number: "K4" },
      { id: 74, number: "K5" },
      { id: 84, number: "K6" },
      { id: 34, number: "K7" },
      null,
      { id: 15, number: "K8" },
      { id: 16, number: "K9" },
      { id: 17, number: "K10" },
    ],
    [
      { id: 21, number: "L1" },
      { id: 22, number: "L2" },
      { id: 23, number: "L3" },
      { id: 24, number: "L4" },
      { id: 29, number: "L5" },
      { id: 20, number: "L6" },
      { id: 99, number: "L7" },
      null,
      { id: 25, number: "L8" },
      { id: 26, number: "L9" },
      { id: 27, number: "L10" },
      null,
    ],
   
  ];



  const init={
    tid:JSON.parse(localStorage.getItem("theaterdata")).tid,
    screenno:JSON.parse(localStorage.getItem("theaterdata")).screens,
    show_date: localStorage.getItem("dates"),
    slot_id:JSON.parse(localStorage.getItem("slotid"))
  };

  const[book2,setBook]=useState(init);

  const[reserved,setReserved]=useState([]);
  

  useEffect(() => {
   axios
   .post("http://localhost:8080/getBookedSeats",book2)
   .then((response) => {
    setReserved(response?.data);
   
  })
  .catch(console.log);

   
  }, []);

  const addSeatCallback = ({ row, number, id }, addCb) => {
    setSelected2((prevItems) => [...prevItems, number]);
    const newTooltip = `tooltip for id-${id} added by callback`;
    addCb(row, number, id, newTooltip);
  };

  const removeSeatCallback = ({ row, number, id }, removeCb) => {
    setSelected2((list) => list.filter((item) => item !== number));
    removeCb(row, number);
  };


  rows.forEach((r) => {
    r.forEach((c) => {
      
      if (c != null)
        if (reserved.indexOf(c.number) != -1) {
         
          c["isReserved"] = true;
          //alert(JSON.stringify(c));
        }
    });
  });

  return (
    <div className="seats">
      {/* <div className="box"></div> */}
      <h5 className="seat_price">Platinum ₹150</h5>
      <SeatPicker
        addSeatCallback={addSeatCallback}
        removeSeatCallback={removeSeatCallback}
        rows={rows}
        alpha
        maxReservableSeats={10}
        visible
      />
    </div>
  );
}

export default PlatinumSeats;
