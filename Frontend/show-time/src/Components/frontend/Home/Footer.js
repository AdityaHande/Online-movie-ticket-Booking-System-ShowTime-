/*import React from "react";

const Footer = () => {
  return (
    <>
    <div className="container-fluid">
      <footer className="p-3 bg-secondary d-flex  justify-content-center">
        <p>&copy; 2022 ShowTime All Rights Reserved.</p>
      </footer>
      </div>
    </>
  );
};

export default Footer;*/

import "./Footer.css";
import { useNavigate } from "react-router";

const Footer = () => {
  const navigate = useNavigate();
  return (
    <div className="main-footer">
      <div className="container">
        <div className="row">
          {/* Column 1 */}
          <div className="col">
            <h4>Contact info</h4>
            <ul className="list-unstyled">
              <li>
              Office No: 2, First Floor, "Gokhale Sanchit", <br/>
              Survey No: 846 Servants of India Society,<br/>
              BMCC Road, Off FC Rd, Deccan Gymkhana, <br/>
              Pune, Maharashtra 411004{" "}
              </li>
              <li>
                <a href="tel:+91 90214 79888">+91 90214 79888</a>
              </li>
              <li>
                <a href="mailto:info@itsmovietime.ie">
                  test@knowitproject.com
                </a>
              </li>
            </ul>
          </div>

          {/* Column 2 */}
          <div className="col">
            <h4>Services</h4>
            <ul className="list-unstyled">
              <li>Theater Registration</li>
              <li>Ticket Booking</li>
              <li>Search Movies</li>
            </ul>
          </div>

          {/* Column 3 */}
          <div className="col">
            <h4>Popular theaters near me</h4>
            <ul className="list-unstyled">
              <li>
                <a href="#">Theater in Kolhapur</a>
              </li>
              <li>
                <a href="#">Theater in Sangli</a>
              </li>
            </ul>
          </div>
        </div>
        <hr />
        <div className="row">
          <p className="col-sm">
            &copy;{new Date().getFullYear()} It's Show Time | All rights reserved
            | Terms of Service | Privacy
          </p>
        </div>
      </div>
    </div>
  );
};

export default Footer;