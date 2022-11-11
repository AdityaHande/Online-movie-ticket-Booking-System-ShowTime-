import React from "react";
import { useState, useEffect } from "react";
import axios from "axios";
import { Link, useParams } from "react-router-dom";
import { useNavigate } from "react-router-dom";
const TheaterAndCityListByMovie = () => {
  
  const [theaterAndCity, setTheaterAndCity] = useState([]);
  const movieid = JSON.parse(localStorage.getItem("allMovies"));
  const {mid,city} = useParams();
  localStorage.setItem("movieid",mid);
  console.log(mid,city)
  const navigate = useNavigate();
  let fetchTheaterAndCity = () => {
    axios
      .get(`http://localhost:8080/getTheaterByMovieAndCity?mid=${mid}&cid=${city}`)
      .then((response) => {
        setTheaterAndCity(response?.data);
       
      })
      .catch(console.log);
  };

  useEffect(() => {
    fetchTheaterAndCity();
  }, []);

  const allotShow = (theaterAndCity) => {

    localStorage.setItem("theaterdata",JSON.stringify(theaterAndCity));
    navigate("/showsslot");
  }

  return (
    <div className="movies-list-containern container-fluid">
      <div className="container-table justify">
        <table className="table table-hover">
          <thead>
            <tr>
              <th>Theatre Name</th>
              <th>Screen No</th>
              <th>City</th>
              <th>Shows</th>
            </tr>
          </thead>
          <tbody>
            {theaterAndCity.map((theaterAndCity, index) => {
              return (
                <tr>
                  <td>{theaterAndCity.tname}</td>
                  <td>{theaterAndCity.screens}</td>
                  <td>{theaterAndCity.cityid.city_name}</td>
                  <td>
                    {/* <Link to="/showsslot"> */}
                      <button  onClick={() => allotShow(theaterAndCity)}className="btn btn-success">Shows</button>
                    {/* </Link> */}
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

export default TheaterAndCityListByMovie;