import React, { useState } from "react";
import { Link } from "react-router-dom";
import { useNavigate } from "react-router-dom";
import "./Header.css";
const Header = () => {
  const navigate = useNavigate();
  const Logout = () => {
    // localStorage.clear();
    navigate("/login");
  };
  return (
    <>
      <header className="container-fluid sticky-top">
        <nav
          className="navbar  p-4"
          style={{ backgroundColor: "rgb(51, 53, 69)" }}
        >
          <div className="row d-flex justify-content-center">
              <div className="col-2">
            <Link to="">
                <img src="images/logo.png" width="120%" height="90%" alt="" />
            </Link>
              </div>
            <div className="col-6">
              <form class="d-flex me-auto ms-5">
                <input
                  class="form-control me-2 w-50"
                  type="search"
                  placeholder="Search"
                  aria-label="Search"
                />
                <button class="btn btn-outline-success" type="submit">
                  Search
                </button>
              </form>
            </div>
            <div className="col-4 d-flex justify-content-end">
              <div>
                <div class="dropdown">
                  <button
                    class="btn btn-danger px-4 dropdown-toggle"
                    type="button"
                    id="dropdownMenuButton2"
                    data-bs-toggle="dropdown"
                    aria-expanded="false"
                  >
                    City
                  </button>
                  <ul
                    class="dropdown-menu dropdown-menu-dark"
                    aria-labelledby="dropdownMenuButton2"
                  >
                    <li>
                      <a class="dropdown-item active" href="#">
                        Kolhapur
                      </a>
                    </li>
                    <li>
                      <a class="dropdown-item" href="#">
                        Pune
                      </a>
                    </li>
                    <li>
                      <a class="dropdown-item" href="#">
                        Mumbai
                      </a>
                    </li>
                    <li>
                      <a class="dropdown-item" href="#">
                        Kolkata
                      </a>
                    </li>
                  </ul>
                </div>
              </div>
              <div className="ms-5">
                <Link to="login">
                  <button type="button" class="btn btn-primary px-4">
                    Login
                  </button>
                </Link>
                <button
                  type="button"
                  onClick={Logout}
                  class="btn btn-primary px-4 ms-2"
                >
                  Logout
                </button>
              </div>
            </div>
          </div>
        </nav>
        <nav
          className="navbar  p-4 d-flex justify-content-between"
          style={{ backgroundColor: "rgb(34, 37, 57)" }}
        >
          <div className="nava col-4 d-flex  justify-content-evenly">
            <a href="#">Movies</a>
            <a href="#">Stream</a>
            <a href="#">Events</a>
            <a href="#">Plays</a>
            <a href="#">Sports</a>
            <a href="#">Activities</a>
            <a href="#">Buzz</a>
          </div>
          <div className="nava col-4 d-flex  justify-content-evenly">
            <a href="#">Offers</a>
            <a href="#">Gift cards</a>
          </div>
        </nav>
      </header>
    </>
  );
};

export default Header;
//verify- http://localhost:8080/verify?uid=${uid}