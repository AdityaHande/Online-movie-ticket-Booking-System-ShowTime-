import React, { useState } from "react";
import axios from "axios";
import { Box, Tab, Tabs } from "@mui/material";
import PropTypes from "prop-types";
import Typography from "@mui/material/Typography";
import OwnerVerification from "./OwnerVerification";
import TheaterOwnerList from "./TheaterOwnerList";
import AddMovieForm from "./AddMovieForm";

function TabPanel(props) {
  const { children, value, index, ...other } = props;

  return (
    <div
      role="tabpanel"
      hidden={value !== index}
      id={`simple-tabpanel-${index}`}
      aria-labelledby={`simple-tab-${index}`}
      {...other}
    >
      {value === index && (
        <Box sx={{ p: 3 }}>
          <Typography>{children}</Typography>
        </Box>
      )}
    </div>
  );
}

TabPanel.propTypes = {
  children: PropTypes.node,
  index: PropTypes.number.isRequired,
  value: PropTypes.number.isRequired,
};

function a11yProps(index) {
  return {
    id: `simple-tab-${index}`,
    "aria-controls": `simple-tabpanel-${index}`,
  };
}

const AdminUI = () => {
  const [value, setValue] = React.useState(0);

  const handleChange = (event, newValue) => {
    setValue(newValue);
  };

  return (
    <>
      <div className="container-fluid">
        <h3 className="text-center text-warning mt-3">
          Welcome {JSON.parse(localStorage.getItem("loggedinuser")).name}
        </h3>
      </div>
      <div className="container-fluid">
        <Box sx={{ borderBottom: 1, borderColor: "divider", mt: 2 }}>
          <Tabs
            value={value}
            onChange={handleChange}
            aria-label="basic tabs example"
          >
            <Tab label="Owner Verification" {...a11yProps(0)} />
            <Tab label="Add Movies" {...a11yProps(1)} />
            <Tab label="Theater owner" {...a11yProps(2)} />
          </Tabs>
        </Box>
        <TabPanel value={value} index={0}>
          <OwnerVerification />
        </TabPanel>
        <TabPanel value={value} index={1}>
          <AddMovieForm />
        </TabPanel>
        <TabPanel value={value} index={2}>
          <TheaterOwnerList />
        </TabPanel>
      </div>
    </>
  );
};

export default AdminUI;
