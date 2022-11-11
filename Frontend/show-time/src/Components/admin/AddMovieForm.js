import { useState, useReducer } from "react";
import axios from "axios";

//first requirement for useReducer - original data
const init = {
  mname: "",
  minfo: "",
  cast: "",
  type: "",
  release_date: "",
  start_date: "",
  end_date: "",
  language: "",
  tax_free: "",
};



//second requirement for useReducer - updation function
const reducer = (state, action) => {
  switch (action.type) {
    case "update":
      return { ...state, [action.field]: action.val };
    case "clear":
      return init;
  }
};

let AddMovieForm = () => {
  //const [eid,setEid] = useState(0);
  const [movie, dispatch] = useReducer(reducer, init);
  const [poster, setPoster] = useState();
  const [mid, setMid] = useState();
  var mids = mid;
  const sendData = (e) => {
    e.preventDefault();
    var fd = new FormData();
    //fd.append("name", name);
    fd.append("file", poster);

    const reqData = {
      method: "post",
      Headers: {
        "content-type": "multipart/form-data",
      },
      body: fd,
    };
    axios
      .post("http://localhost:8080/saveMovie", movie)
      .then((response) => {
        console.log(response);
        console.log(response.data.mid);
        setMid(response.data.mid);
       // alert(mids);
        console.log(mids);
        fetch("http://localhost:8080/uploadimage/" + response.data.mid, reqData)
          .then((response) => {
            response.json();
          })
          .then((data) => console.log(data));
          alert("Movie Added Successfully")
      })
      .catch((error) => {
        console.log(error);
        alert("Something Went Wrong!!!")
      });
  };
  /* axios
      .post("http://localhost:8080/saveMovie", movie)
      .then((resp) => {setMid(resp.data.mid);
                       fetch("http://localhost:8080/uploadimage/"+mid, reqData) 
                       .then(resp => resp.json())
                       .then(data => console.log(data)))
                      })
      

      .catch((error) => {
        console.log(error);
      });
  };*/

  return (
    <div className="container">
      <div className="row d-flex justify-content-center">
        <div class="col-6 border rounded-2 mt-5 p-4 shadow  mb-5 bg-body rounded">
          <h3 className="d-flex justify-content-center mb-3"> Add Movies </h3>
          <form>
            <div class="mb-3  mt-3">
              <label class="form-label ">Enter Movie Name</label>
              <input
                type="text"
                required
                class="form-control"
                name="mname"
                value={movie.mname}
                onChange={(e) => {
                  dispatch({
                    type: "update",
                    field: "mname",
                    val: e.target.value,
                  });
                }}
                placeholder="moviename"
              />
            </div>

            <div class="mb-3  mt-3">
              <label class="form-label ">Enter info</label>
              <textarea
                type="text"
                required
                class="form-control"
                name="minfo"
                value={movie.minfo}
                onChange={(e) => {
                  dispatch({
                    type: "update",
                    field: "minfo",
                    val: e.target.value,
                  });
                }}
                placeholder="movieinfo"
              ></textarea>
            </div>

            <div class="mb-3  mt-3">
              <label class="form-label ">Enter Cast</label>
              <input
                type="text"
                required
                class="form-control"
                name="cast"
                value={movie.cast}
                onChange={(e) => {
                  dispatch({
                    type: "update",
                    field: "cast",
                    val: e.target.value,
                  });
                }}
                placeholder="cast name"
              />
            </div>

            <div class="mb-3  mt-3">
              {/* <label class="form-label ">Enter type</label>
              <input
                type="text"
                required
                class="form-control"
                name="type"
                value={movie.type}
                onChange={(e) => {
                  dispatch({
                    type: "update",
                    field: "type",
                    val: e.target.value,
                  });
                }}
                placeholder="2D 3D"
              /> */}

                
              <label class="form-label">Select Type: </label>
              <input
             // class="form-control"
                type="radio"
                name="type"
                value="2D"
                onChange={(e) => {
                  dispatch({
                    type: "update",
                    field: "type",
                    val: e.target.value,
                  });
                }}
              />
             2D
              <input
              //class="form-control"
                type="radio"
                name="type"
                value="3D"
                onChange={(e) => {
                  dispatch({
                    type: "update",
                    field: "type",
                    val: e.target.value,
                  });
                }}
              />
            3D
            </div>

           
            <div class="mb-3  mt-3">
              <label class="form-label ">Enter release date </label>
              <input
                type="date"
                required
                class="form-control"
                name="release_date"
                value={movie.release_date}
                onChange={(e) => {
                  dispatch({
                    type: "update",
                    field: "release_date",
                    val: e.target.value,
                  });
                }}
              />
            </div>

            <div class="mb-3  mt-3">
              <label class="form-label ">Enter start date </label>
              <input
                type="date"
                required
                class="form-control"
                name="start_date"
                value={movie.start_date}
                onChange={(e) => {
                  dispatch({
                    type: "update",
                    field: "start_date",
                    val: e.target.value,
                  });
                }}
              />
            </div>

            <div class="mb-3  mt-3">
              <label class="form-label ">Enter end date </label>
              <input
                type="date"
                required
                class="form-control"
                name="end_date"
                value={movie.end_date}
                onChange={(e) => {
                  dispatch({
                    type: "update",
                    field: "end_date",
                    val: e.target.value,
                  });
                }}
              />
            </div>

            <div class="mb-3  mt-3">
              <label class="form-label ">Enter language</label>
              <input
                type="text"
                required
                class="form-control"
                name="language"
                value={movie.language}
                onChange={(e) => {
                  dispatch({
                    type: "update",
                    field: "language",
                    val: e.target.value,
                  });
                }}
              />
            </div>

            <div class="mb-3  mt-3">
              <label class="form-label ">Enter poster</label>
              <input
                accept="image/*"
                type="file"
                required
                class="form-control"
                name="poster"
                onChange={(e) => setPoster(e.target.files[0])}
              />
            </div>

            <div class="mb-3  mt-3">
              <label class="form-label ">Enter tax free status</label>
              <input
                type="text"
                required
                class="form-control"
                name="tax_free"
                value={movie.tax_free}
                onChange={(e) => {
                  dispatch({
                    type: "update",
                    field: "tax_free",
                    val: e.target.value,
                  });
                }}
                placeholder="1 for yes,0 for no"
              />
            </div>

            <button
              type="button"
              class="btn btn-primary"
              onClick={(e) => {
                sendData(e);
              }}
            >
              Add
            </button>

            <span className="ps-2">
              <button
                type="button"
                class="btn btn-primary"
                onClick={() => {
                  dispatch({ type: "clear" });
                }}
              >
                Clear
              </button>
            </span>
          </form>
        </div>
      </div>
    </div>
  );
};

export default AddMovieForm;
