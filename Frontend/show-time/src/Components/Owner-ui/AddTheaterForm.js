import { useState, useReducer } from "react";
import axios from "axios";
//first requirement for useReducer - original data
const init = {
  oid: JSON.parse(localStorage.getItem("loggedinuser")).oid,
  cityid: "",
  tname: "",
  licence: "",
  screens: "",
  silverPrice: "",
  goldPrice: "",
  platinumPrice: "",
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

const AddTheaterForm = () => {
  const [theater, dispatch] = useReducer(reducer, init);

  const sendData = (e) => {
    e.preventDefault();
    axios
      .post("http://localhost:8080/saveTheater", theater)
      .then((response) => {
        if (response.status === 200) {
          alert("Registration Successfully");
        }
      })
      .catch((error) => {
        //     console.log(error);
        alert("OwnerId not exist");
      });
  };

  return (
    <div className="container">
      <div className="row d-flex justify-content-center">
        <div class="col-6 border rounded-2 mt-5 p-4 shadow  mb-5 bg-body rounded">
          <h3 className="d-flex justify-content-center mb-3">
            {" "}
            Theater Registraion{" "}
          </h3>
          <form>
            <div class="mb-3  mt-3">
              <label class="form-label ">OwnerId</label>
              <input
                type="number"
                required
                class="form-control"
                name="oid"
                value={theater.oid}
                // onChange={(e) => {
                // dispatch({
                //   type: "update",
                //   field: "oid",
                //   val: e.target.value,
                // });
                // }}
                placeholder="oid"
              />
            </div>
            <div class="mb-3 mt-3">
              {/* <label class="form-label">CityId</label>
              <input
                type="number"
                required
                class="form-control"
                name="cityid"
                value={theater.cityid}
                onChange={(e) => {
                  dispatch({
                    type: "update",
                    field: "cityid",
                    val: e.target.value,
                  });
                }}
                placeholder="cityid"
              /> */}
               
              <label class="form-label">City: </label>
              <input
             // class="form-control"
                type="radio"
                name="cityid"
                value="1"
                onChange={(e) => {
                  dispatch({
                    type: "update",
                    field: "cityid",
                    val: e.target.value,
                  });
                }}
              />
              Kolhapur
              <input
              //class="form-control"
                type="radio"
                name="cityid"
                value="2"
                onChange={(e) => {
                  dispatch({
                    type: "update",
                    field: "cityid",
                    val: e.target.value,
                  });
                }}
              />
              Sangali
            </div>

            <div class="mb-3 mt-3">
              <label class="form-label">Theater Name</label>
              <input
                type="text"
                required
                class="form-control"
                name="tname"
                value={theater.tname}
                onChange={(e) => {
                  dispatch({
                    type: "update",
                    field: "tname",
                    val: e.target.value,
                  });
                }}
                placeholder="tname"
              />
            </div>

            <div class="mb-3 mt-3">
              <label class="form-label">Licence</label>
              <input
                type="text"
                required
                class="form-control"
                name="licence"
                value={theater.licence}
                onChange={(e) => {
                  dispatch({
                    type: "update",
                    field: "licence",
                    val: e.target.value,
                  });
                }}
                placeholder="licence"
              />
            </div>

            <div class="mb-3 mt-3">
              <label class="form-label">Screens</label>
              <input
                type="number"
                required
                class="form-control"
                name="screens"
                value={theater.screens}
                onChange={(e) => {
                  dispatch({
                    type: "update",
                    field: "screens",
                    val: e.target.value,
                  });
                }}
              />
            </div>

            <div class="mb-3 mt-3">
              <label class="form-label">Silver Seat Price</label>
              <input
                type="number"
                required
                class="form-control"
                name="silverPrice"
                value={theater.silverPrice}
                onChange={(e) => {
                  dispatch({
                    type: "update",
                    field: "silverPrice",
                    val: e.target.value,
                  });
                }}
                placeholder="100"
              />
            </div>

            <div class="mb-3 mt-3">
              <label class="form-label">Gold Seat Price</label>
              <input
                type="number"
                required
                class="form-control"
                name="goldPrice"
                value={theater.goldPrice}
                onChange={(e) => {
                  dispatch({
                    type: "update",
                    field: "goldPrice",
                    val: e.target.value,
                  });
                }}
                placeholder="120"
              />
            </div>

            <div class="mb-3 mt-3">
              <label class="form-label">Platinum Seat Price</label>
              <input
                type="number"
                required
                class="form-control"
                name="platinumPrice"
                value={theater.platinumPrice}
                onChange={(e) => {
                  dispatch({
                    type: "update",
                    field: "platinumPrice",
                    val: e.target.value,
                  });
                }}
                placeholder="150"
              />
            </div>
            <div class="mb-3 mt-3">
              <label class="form-label">Total seats</label>
              <input
                type="number"
                class="form-control"
                name="platinumPrice"
                value="120"
              />
            </div>
            <div class="mb-3 mt-3">
              <label class="form-label">Rows</label>
              <input
                type="number"
                class="form-control"
                name="platinumPrice"
                value="12"
              />
            </div>
            <div class="mb-3 mt-3">
              <label class="form-label">Columns</label>
              <input
                type="number"
                class="form-control"
                name="platinumPrice"
                value="10"
              />
            </div>
            <div class="mb-3 mt-3">
              <label class="form-label">Silver Seats</label>
              <input
                type="number"
                class="form-control"
                name="platinumPrice"
                value="30"
              />
            </div>
            <div class="mb-3 mt-3">
              <label class="form-label">Gold Seats</label>
              <input
                type="number"
                class="form-control"
                name="platinumPrice"
                value="60"
              />
            </div>
            <div class="mb-3 mt-3">
              <label class="form-label">Platinum Seats</label>
              <input
                type="number"
                class="form-control"
                name="platinumPrice"
                value="30"
              />
            </div>

            <button
              type="button"
              class="btn btn-primary"
              onClick={(e) => {
                sendData(e);
              }}
            >
              Register
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

export default AddTheaterForm;
