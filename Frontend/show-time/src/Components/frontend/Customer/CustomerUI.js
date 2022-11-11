import axios from "axios";
import React, { useEffect, useState } from "react";
import Card from "./Card";

const CustomerUI = () => {
  const [movies, setMovies] = useState([]);
  console.log("Movies: ", movies);

  useEffect(() => {
    axios
      .get("http://localhost:8080/getAllMovies")
      .then((response) => {
        console.log(response?.data);
        setMovies(response?.data);
      })
      .catch((err) => {
        console.log(err);
      });
  }, []);

  return (
    <>
      <div className="container-fluid">
        <h2>Movies</h2>
        <div></div>
        <section
          style={{
            display: "flex",
            flexWrap: "wrap",
            justifyContent: "space-evenly",
          }}
        >
          {Array.isArray(movies) &&
            movies.map(
              (
                {
                  poster,
                  mname,
                  cast,
                  minfo,
                  release_date,
                  language,
                  type,
                  city,
                  mid,
                },
                i
              ) => {
                return (
                  <Card
                    key={i}
                    poster={`data:image/jpeg;base64,${poster}`}
                    mname={mname}
                    cast={cast}
                    minfo={minfo}
                    release_date={release_date}
                    language={language}
                    type={type}
                    mid={mid}
                  />
                );
              }
            )}
        </section>
      </div>
    </>
  );
};

export default CustomerUI;
