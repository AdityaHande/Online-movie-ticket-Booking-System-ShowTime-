import React from "react";
import { useState, useEffect } from "react";
import axios from "axios";
import { Link, Navigate, useNavigate } from "react-router-dom";

const ShowsSlot = () => {
  const [shows, setShows] = useState([]);
  const [date, setDate] = useState();
  const navigate = useNavigate();

  const gettingSlot = (slot_id) => {
    localStorage.setItem("slotid", slot_id);
    localStorage.setItem("dates", date);

    alert("Motto")

    navigate("/grid");
  };

  let fetchShows = () => {
    axios
      .get("http://localhost:8080/getAllMovieShows")
      .then((response) => {
        setShows(response?.data);
      })
      .catch(console.log);
  };

  useEffect(() => {
    fetchShows();
  }, []);

  return (
    <>
      <div className="movies-list-containern container-fluid">
        <div className="container-table justify">
          <table className="table table-hover-none">
            <thead>
              <tr>
                <th>#</th>
                <th>Start Time</th>
                <th>End Time</th>
                <th>Show Date</th>
                <th>Option</th>
              </tr>
            </thead>
            <tbody>
              {shows.map((shows, index) => {
                return (
                  <tr>
                    <td>{shows.slot_id}</td>

                    <td>{shows.start_time}</td>
                    <td>{shows.end_time}</td>
                    <td>
                      <input
                        onChange={(e) => setDate(e.target.value)}
                        type="date"
                      />
                    </td>
                    <td>
                      <button
                        onClick={() => gettingSlot(shows.slot_id)}
                        className="btn btn-success"
                      >
                        Book
                      </button>
                    </td>
                  </tr>
                );
              })}
            </tbody>
          </table>
        </div>
      </div>
    </>
  );
};

export default ShowsSlot;
