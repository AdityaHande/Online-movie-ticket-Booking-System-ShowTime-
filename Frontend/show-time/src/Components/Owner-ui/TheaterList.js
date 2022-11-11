import { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import axios from "axios";

const TheaterList = () => {
  const navigate = useNavigate();
  const [movie, setMovie] = useState([]);

  const [theatres1, setTheatres] = useState([]);
  const [movieId, setMid] = useState("");
  const [screenId, setScreenid] = useState("");

  //const gettid = JSON.parse(localStorage.getItem("own_theaters"));

  const mid = movieId;
  const sid = screenId;

  const allotMovie = (tid) => {
    console.log(tid, mid, sid);
    axios
      .put(
        `http://localhost:8080/movieTimeSlot?tid=${tid}&screenno=${sid}&mid=${mid}`
      )
      .then((response) => {
        console.log(response.data);
        alert("Successfully Screen Added");
      })
      .catch((err) => {
        console.log("Error: ", err);
        alert("Already Alloted this Screen");
      });
  };

  const removeMovie = (tid) => {
    axios
      .put(
        `http://localhost:8080/movieTimeSlot?tid=${tid}&screenno=${sid}&mid=0`
      )
      .then((response) => {
        console.log(response.data);
        alert("remove movie successfully");
      
      })
      .catch((err) => {
        console.log("Error: ", err);
      });
  
  };

  let arr = [];
  theatres1.map((s) => {
    for (let i = 1; i <= s.screens; i++) {
      arr.push(i);
    }
  });
  const arr2 = (val) => {
    let arr1 = [];
    for (let i = 1; i <= val; i++) {
      arr1.push(i);
    }
    return arr1;
  };
  const items = JSON.parse(localStorage.getItem("loggedinuser"));

  useEffect(() => {
    console.log("calling server API");
    const oid = items.oid;
    fetch(`http://localhost:8080/getMyTheaters?oid=${oid}`)
      .then((resp) => resp.json())
      .then((data) => {
        setTheatres(data);
        localStorage.setItem("own_theaters", JSON.stringify(data));
      });

    //getting all movies

    //getting all screens for all theaters for  owner
    axios
      .get("http://localhost:8080/getAllMovies")
      .then((response) => {
        console.log(response?.data);
        setMovie(response?.data);
        //localStorage.setItem("allMovies", JSON.stringify(data));
      })
      .catch((err) => {
        console.log(err);
        // alert("allot unsuccesful");
      });
  }, []);
  return (
    <div className="movies-list-container">
      <div className="container-table">
        <table className="table table-hover-none">
          <thead>
            <tr>
              <th>Theater ID</th>
              <th>Theater Name</th>
              <th>Movies</th>
              <th>Screen</th>
              <th>Option</th>
            </tr>
          </thead>
          <tbody>
            {theatres1.map((theatres, index) => {
              return (
                <tr id={index}>
                  <td>{theatres.tid}</td>
                  <td colsapn={theatres.screens}>{theatres.tname}</td>
                  <td>
                    <select
                      onChange={(e) => setMid(e.target.value)}
                      defaultValue={movieId}
                    >
                      {" "}
                      <option value="" disabled="true">
                        select
                      </option>
                      {movie.map((s) => {
                        return (
                          <option value={s.mid}>
                            {s.mname} ({s.type})
                          </option>
                        );
                      })}
                    </select>
                  </td>
                  <td>
                    <select
                      onChange={(e) => setScreenid(e.target.value)}
                      defaultValue={screenId}
                    >
                      <option value="" disabled="true">
                        select
                      </option>
                      {arr2(theatres.screens).map((v) => {
                        return (
                          <option key={v} value={v}>
                            {v}
                          </option>
                        );
                      })}
                    </select>
                  </td>
                  <td>
                    <button
                      onClick={() => allotMovie(theatres.tid)}
                      className="btn btn-success"
                    >
                      Allot
                    </button>
                    <button
                      onClick={() => removeMovie(theatres.tid)}
                      className="btn btn-danger"
                    >
                      Remove
                    </button>
                  </td>
                </tr>
              );
            })}
          </tbody>
        </table>
      </div>
    </div>
  );
};
export default TheaterList;
