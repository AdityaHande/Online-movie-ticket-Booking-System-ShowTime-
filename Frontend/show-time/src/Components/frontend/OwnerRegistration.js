import { useState, useReducer } from "react";
import axios from "axios";
//first requirement for useReducer - original data
const init = {
  userid: "",
  pwd: "",
  name: "",
  address: "",
  gender: "",
  contact: "",
  mail: "",
  id_proof: "",
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

const OwnerRegistration = () => {
  //const [eid,setEid] = useState(0);
  const [owner, dispatch] = useReducer(reducer, init);

  const [user, errorUser] = useState("");
  const [password, errorPassword] = useState("");
  const [name, errorName] = useState("");
  const [contact, errorContact] = useState();
  const [email, setEmail] = useState("");

  const sendData = (e) => {
    var count = 0;
    // var pattern1 = /^[a-zA-Z0-9]{5-15}/;
    // var pattern2 = /^(?=.*[0-9])(?=.*[A-Z])(?=.*[!@#$%^&])[A-Za-z0-9!@#$%^&*]{5,}$/;
    // var pattern3 = /^[A-Z]{1}[A-Za-z]{1,}\s[A-Z]{1}[A-Za-z]{1,}/
    // var pattern4 = /[0-9]{10}/;
    // var pattern5 = /^[a-z][a-z0-9]{1,}@[a-z]{1,}\.[a-z]{1,}$/;

    if (!owner.userid.match(/^[a-zA-Z0-9]{5,}/)) errorUser("Enter valid user id ");
    else {
      errorUser("");
      count++;
    }
    if (!owner.pwd.match(/^(?=.*[0-9])(?=.*[A-Z])(?=.*[!@#$%^&])[A-Za-z0-9!@#$%^&*]{5,}$/)) errorPassword("Password is not strong");
    else {
      errorPassword("");
      count++;
    }

    if (!owner.name.match( /^[A-Z]{1}[A-Za-z]{1,}\s[A-Z]{1}[A-Za-z]{1,}/)) errorName("Enter valid Name");
    else {
      errorName("");
      count++;
    }

    if (!owner.contact.match(/[0-9]{10}/)) errorContact("Enter valid Contact");
    else {
      errorContact("");
      count++;
    }

    if (!owner.mail.match(/^[a-z][a-z0-9]{1,}@[a-z]{1,}\.[a-z]{1,}$/)) setEmail("Enter valid Contact");
    else {
      setEmail("");
      count++;
    }

    //actually submits the data to server
    //react provides some functionality
    //"http://localhost:8080/saveTheaterOwner", owner

    if (count === 5) {
      e.preventDefault();
      axios
        .post("http://localhost:8080/saveTheaterOwner", owner)
        .then((response) => {
          if (response.status === 200) {
            alert("Owner Successfully Registered");
          }
        })
        .catch((error) => {
          //     console.log(error);
          alert("Username already exist try another");
        });
    }
  };

  return (
    <div className="container">
      <div className="row d-flex justify-content-center">
        <div class="col-6 border rounded-2 mt-5 p-4 shadow  mb-5 bg-body rounded">
          <h3 className="d-flex justify-content-center mb-3">
            {" "}
            Theater Owner Registraion{" "}
          </h3>
          <form>
            <div class="mb-3  mt-3">
              <label class="form-label ">Userid</label>
              <input
                type="text"
                required
                class="form-control"
                name="userid"
                value={owner.userid}
                onChange={(e) => {
                  dispatch({
                    type: "update",
                    field: "userid",
                    val: e.target.value,
                  });
                }}
                placeholder=""
              />
              <h6 className="text-danger text-center">{user}</h6>
            </div>

            <div class="mb-3 mt-3">
              <label class="form-label">Password</label>
              <input
                type="password"
                required
                class="form-control"
                name="pwd"
                value={owner.pwd}
                onChange={(e) => {
                  dispatch({
                    type: "update",
                    field: "pwd",
                    val: e.target.value,
                  });
                }}
                placeholder="Abcde@123"
              />
              <h6 className="text-danger text-center">{password}</h6>
            </div>

            <div class="mb-3 mt-3">
              <label class="form-label">Name</label>
              <input
                type="text"
                required
                class="form-control"
                name="name"
                value={owner.name}
                onChange={(e) => {
                  dispatch({
                    type: "update",
                    field: "name",
                    val: e.target.value,
                  });
                }}
                placeholder="Sangram Desai"
              />
              <h6 className="text-danger text-center">{name}</h6>
            </div>

            <div class="mb-3 mt-3">
              <label class="form-label">Address</label>
              <input
                type="text"
                required
                class="form-control"
                name="address"
                value={owner.address}
                onChange={(e) => {
                  dispatch({
                    type: "update",
                    field: "address",
                    val: e.target.value,
                  });
                }}
                placeholder="address"
              />
            </div>

            <div class="mb-3 mt-3">
              <label class="form-label">Gender:</label>
              <input
                type="radio"
                name="gender"
                value={"Male"}
                onChange={(e) => {
                  dispatch({
                    type: "update",
                    field: "gender",
                    val: e.target.value,
                  });
                }}
              />
              Male
              <input
                type="radio"
                name="gender"
                value={"Female"}
                onChange={(e) => {
                  dispatch({
                    type: "update",
                    field: "gender",
                    val: e.target.value,
                  });
                }}
              />
              Female
            </div>

            <div class="mb-3 mt-3">
              <label class="form-label">Contact</label>
              <input
                type="number"
                required
                class="form-control"
                name="contact"
                value={owner.contact}
                onChange={(e) => {
                  dispatch({
                    type: "update",
                    field: "contact",
                    val: e.target.value,
                  });
                }}
              />
              <h6 className="text-danger text-center">{contact}</h6>
            </div>

            <div class="mb-3 mt-3">
              <label class="form-label">Email</label>
              <input
                type="email"
                required
                class="form-control"
                name="mail"
                value={owner.mail}
                onChange={(e) => {
                  dispatch({
                    type: "update",
                    field: "mail",
                    val: e.target.value,
                  });
                }}
                placeholder="Abcd123@gmail.com"
              />
              <h6 className="text-danger text-center">{email}</h6>
            </div>

            <div class="mb-3 mt-3">
              <label class="form-label">Id_proof</label>
              <input
                type="text"
                required
                class="form-control"
                name="id_proof"
                value={owner.id_proof}
                onChange={(e) => {
                  dispatch({
                    type: "update",
                    field: "id_proof",
                    val: e.target.value,
                  });
                }}
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

export default OwnerRegistration;
