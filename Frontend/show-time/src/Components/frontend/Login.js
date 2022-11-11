import { useReducer } from "react";
import axios from "axios";
import { Redirect } from "react-router-dom";
import { useNavigate } from "react-router-dom";
import { Link } from "react-router-dom";

const init = {
  userid: "",
  pwd: "",
  admin: {},
  customer: {},
  towner: {},
  loginerror: "",
};
const reducer = (state, action) => {
  switch (action.type) {
    case "update":
      return { ...state, [action.field]: action.val };
    case "clear":
      return init;
  }
};

var Login = () => {
  const [user, dispatch] = useReducer(reducer, init);
  const navigate = useNavigate();
  const sendData = (e) => {
    e.preventDefault();
    const reqOptions = {
      method: "Post",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
      },
      body: JSON.stringify(user),
    };
    fetch("http://localhost:8080/checkLogin", reqOptions)
      .then((resp) => resp.text())
      .then((data) => {
        if (data.length != 0) {
          const json = JSON.parse(data);
          if (json.uid.role == "customer") {
            dispatch({ type: "update", field: "customer", val: data });
            localStorage.setItem("loggedinuser", data);
            alert("Customer login successfull");
            navigate("/custui");
          } else if (json.uid.role == "admin") {
            dispatch({ type: "update", field: "admin", val: data });
            localStorage.setItem("loggedinuser", data);
            navigate("/admin");
          } else if (json.uid.role == "towner") {
            dispatch({ type: "update", field: "towner", val: data });
            localStorage.setItem("loggedinuser", data);
            alert("Owner login successfull");
            navigate("/ownerui");
          } else {
            alert("login faild");
          }
        }
      });
  };

  return (
    <div className="container">
      <div className="row d-flex justify-content-center">
        <div class="col-6 border rounded-2 mt-5 p-4 shadow  mb-5 bg-body rounded">
          <h3 className="d-flex justify-content-center mb-3"> Login Form </h3>
          <form>
            <div class="mb-3 form-group has-error">
              <label for="exampleInputEmail1" class="form-label fs-5">
                User Id :
              </label>
              <input
                class="form-control"
                type="text"
                name="userid"
                value={user.userid}
                required
                onChange={(e) => {
                  dispatch({
                    type: "update",
                    field: "userid",
                    val: e.target.value,
                  });
                }}
              />
            </div>
            <div class="mb-3">
              <label for="exampleInputEmail1" class="form-label fs-5">
                Password :
              </label>
              <input
                type="password"
                name="pwd"
                value={user.pwd}
                onChange={(e) => {
                  dispatch({
                    type: "update",
                    field: "pwd",
                    val: e.target.value,
                  });
                }}
                class="form-control"
                required
              />
            </div>

            <div className="mt-4">
              <button
                type="submit"
                class="btn btn-primary me-2 "
                onClick={(e) => {
                  sendData(e);
                }}
              >
                Submit
              </button>
              <button
                type="reset"
                class="btn btn-primary"
                onClick={() => {
                  dispatch({ type: "clear" });
                }}
              >
                Clear
              </button>
            </div>

            <div className="pt-4">
              <span className="text-secondary" style={{ fontSize: 16 }}>
                New User?Want to register
              </span>
              <span className="ps-2">
                <Link to="/customer">customer</Link>/
                <Link to="/owner">Owner</Link>
              </span>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
};
export default Login;
