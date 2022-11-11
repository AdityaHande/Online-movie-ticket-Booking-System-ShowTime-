import { Flag } from "@mui/icons-material";
import axios from "axios";
import React, { useEffect, useState } from "react";
import SeatPicker from "react-seat-picker";
import "./Seats.css";
function SilverSeats({ setSelected }) {

  //const reserved = ["A1", "A6","C3","A4","B6"];
  const rows = [
    [
      { id: 1, number: "A1" },
      { id: 2, number: "A2" },
      { id: 3, number: "A3" },
      { id: 4, number: "A4" },
      { id: 24, number: "A5" },
      { id: 34, number: "A6" },
      { id: 44, number: "A7" },

      null,
      { id: 5, number: "A8" },
      { id: 6, number: "A9" },
      { id: 7, number: "A10" },
    ],
    [
      { id: 11, number: "B1" },
      { id: 12, number: "B2" },
      { id: 13, number: "B3" },
      { id: 14, number: "B4" },
      { id: 74, number: "B5" },
      { id: 84, number: "B6" },
      { id: 34, number: "B7" },
      null,
      { id: 15, number: "B8" },
      { id: 16, number: "B9" },
      { id: 17, number: "B10" },
    ],
    [
      { id: 21, number: "C1" },
      { id: 22, number: "C2" },
      { id: 23, number: "C3" },
      { id: 24, number: "C4" },
      { id: 29, number: "C5" },
      { id: 20, number: "C6" },
      { id: 99, number: "C7" },
      null,
      { id: 25, number: "C8" },
      { id: 26, number: "C9" },
      { id: 27, number: "C10" },
      null,
    ],
   
  ];


  const init={
    tid:JSON.parse(localStorage.getItem("theaterdata")).tid,
    screenno:JSON.parse(localStorage.getItem("theaterdata")).screens,
    show_date: localStorage.getItem("dates"),
    slot_id:JSON.parse(localStorage.getItem("slotid"))
  };

  const[book,setBook]=useState(init);

  const[reserved,setReserved]=useState([]);
  

  useEffect(() => {
   axios
   .post("http://localhost:8080/getBookedSeats",book)
   .then((response) => {
    setReserved(response?.data);
   
  })
  .catch(console.log);

   
  }, []);



  const addSeatCallback = ({ row, number, id }, addCb) => {
    setSelected((prevItems) => [...prevItems, number]);
    const newTooltip = `tooltip for id-${id} added by callback`;
    addCb(row, number, id, newTooltip);
  };

  const removeSeatCallback = ({ row, number, id }, removeCb) => {
    setSelected((list) => list.filter((item) => item !== number));
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
    <h3 className="h1" >Screen</h3>
      <div className="box"></div>
      <h5 className="seat_price">Silver ₹100</h5>
      <SeatPicker
        addSeatCallback={addSeatCallback}
        removeSeatCallback={removeSeatCallback}
        rows={rows}
        alpha
        maxReservableSeats={10}
        visible
      />
      {/*<h1>Hello</h1>
      <h2>{arr[0]}</h2>
      <table>
        {arr.map((r) => {
          return( r.map((c) => {
            <tr><td>{c}</td></tr>;
          }));
        })}
      </table>*/}
    </div>
  );
}

export default SilverSeats;