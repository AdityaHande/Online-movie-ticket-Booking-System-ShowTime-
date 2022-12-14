import axios from "axios";
import React, { useEffect, useState } from "react";
import SeatPicker from "react-seat-picker";
import "./Seats.css";
function GoldSeats({ setSelected1 }) {
  //const [reserved, setReserved] = useState([]);

  //setReserved(["D1", "D6"]);

  const rows = [
    [
      { id: 1, number: "D1" },
      { id: 2, number: "D2" },
      { id: 3, number: "D3" },
      { id: 4, number: "D4" },
      { id: 24, number: "D5" },
      { id: 34, number: "D6" },
      { id: 44, number: "D7" },

      null,
      { id: 5, number: "D8" },
      { id: 6, number: "D9" },
      { id: 7, number: "D10" },
    ],
    [
      { id: 11, number: "E1" },
      { id: 12, number: "E2" },
      { id: 13, number: "E3" },
      { id: 14, number: "E4" },
      { id: 74, number: "E5" },
      { id: 84, number: "E6" },
      { id: 34, number: "E7" },
      null,
      { id: 15, number: "E8" },
      { id: 16, number: "E9" },
      { id: 17, number: "E10" },
    ],
    [
      { id: 21, number: "F1" },
      { id: 22, number: "F2" },
      { id: 23, number: "F3" },
      { id: 24, number: "F4" },
      { id: 29, number: "F5" },
      { id: 20, number: "F6" },
      { id: 99, number: "F7" },
      null,
      { id: 25, number: "F8" },
      { id: 26, number: "F9" },
      { id: 27, number: "F10" },
      null,
    ],

    [
      { id: 21, number: "G1" },
      { id: 22, number: "G2" },
      { id: 23, number: "G3" },
      { id: 24, number: "G4" },
      { id: 29, number: "G5" },
      { id: 20, number: "G6" },
      { id: 99, number: "G7" },
      null,
      { id: 25, number: "G8" },
      { id: 26, number: "G9" },
      { id: 27, number: "G10" },
      null,
    ],

    [
      { id: 21, number: "H1" },
      { id: 22, number: "H2" },
      { id: 23, number: "H3" },
      { id: 24, number: "H4" },
      { id: 29, number: "H5" },
      { id: 20, number: "H6" },
      { id: 99, number: "H7" },
      null,
      { id: 25, number: "H8" },
      { id: 26, number: "H9" },
      { id: 27, number: "H10" },
      null,
    ],

    [
      { id: 21, number: "I1" },
      { id: 22, number: "I2"},
      { id: 23, number: "I3" },
      { id: 24, number: "I4" },
      { id: 29, number: "I5" },
      { id: 20, number: "I6" },
      { id: 99, number: "I7" },
      null,
      { id: 25, number: "I8" },
      { id: 26, number: "I9" },
      { id: 27, number: "I10" },
      null,
    ],
  ];


  const init={
    tid:JSON.parse(localStorage.getItem("theaterdata")).tid,
    screenno:JSON.parse(localStorage.getItem("theaterdata")).screens,
    show_date: localStorage.getItem("dates"),
    slot_id:JSON.parse(localStorage.getItem("slotid"))
  };

  const[book1,setBook]=useState(init);

  const[reserved,setReserved]=useState([]);
  

  useEffect(() => {
   axios
   .post("http://localhost:8080/getBookedSeats",book1)
   .then((response) => {
    setReserved(response?.data);
   
  })
  .catch(console.log);

   
  }, []);


  const addSeatCallback = ({ row, number, id }, addCb) => {
    setSelected1((prevItems) => [...prevItems, number]);
    const newTooltip = `tooltip for id-${id} added by callback`;
    addCb(row, number, id, newTooltip);
  };

  const removeSeatCallback = ({ row, number, id }, removeCb) => {
    setSelected1((list) => list.filter((item) => item !== number));
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
      <h5 className="seat_price">Gold ???120</h5>
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

export default GoldSeats;
