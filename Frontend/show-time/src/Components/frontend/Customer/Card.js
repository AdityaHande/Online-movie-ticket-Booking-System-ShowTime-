import { SettingsAccessibility } from "@mui/icons-material";
import axios from "axios";
import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import { useNavigate, useParams } from "react-router-dom";
const Card = ({
  poster,
  mname,
  cast,
  minfo,
  release_date,
  language,
  type,
  mid,
}) => {
  const [cities, setCities] = useState([]);
  const [city, sellectedCity] = useState("");
  const navigate = useNavigate();
  let fetchShows = () => {
    axios
      .get("http://localhost:8080/getAllCity")
      .then((response) => {
        console.log(response?.data);

        setCities(response?.data);
      })
      .catch((err) => {
        console.log(err);
      });
  };
  let setCity = (e) => {
    e.preventDefault();
    console.log(e.target.value);
    sellectedCity(e.target.value);
  };
  useEffect(() => {
    fetchShows();
  }, []);

  return (
    <>
      <div class="card" style={{ width: "18rem" }}>
        <img src={poster} class="card-img-top" alt="..." />
        <div class="card-body">
          <h5 class="card-title">{mname}</h5>
          <h6>Cast:{cast}</h6>
          <p>
            <b> Movie Info:</b>
            {minfo}
          </p>

          <div className="m-2">
            <select
              onChange={(e) => setCity(e)}
              //onChange={(e) =>{e.preventDefault()} }
              defaultValue={cities}
            >
              <option value="" disabled="true">
                Cities
              </option>

              {cities.map((v) => {
                return <option value={v.cityid}>{v.city_name}</option>;
              })}
            </select>
            <div className="d-flex justify-content-between">
              <div className="m-2">
                {/* <Link to="/theatercitybymovie?mid="{mid}> */}
                <button
                  onClick={() => navigate(`/theatercitybymovie/${mid}/${city}`)}
                  class="btn btn-primary"
                >
                  Theatres
                </button>
                {/* </Link> */}
              </div>
              {/* <select
                class="form-select "
                aria-label="Default select example"
                onChange={(e) => setCid(e.target.value)}
                defaultValue={cid}
              >
                <option value="" disabled="true">
                  City
                </option>
                {cid.map((v) => {
                  return (
                    <option  value={v.cityid}>
                      {v.city_name}
                    </option>
                  );
                })}
              </select> */}
            </div>
          </div>
          <div className="d-flex justify-content-between">
            <p>Release Date:{release_date}</p>
            <p>{type}</p>
          </div>
        </div>
      </div>
    </>
  );
};

export default Card;
