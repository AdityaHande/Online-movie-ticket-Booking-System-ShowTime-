import React, { useState } from "react";
import axios from "axios";
import { Box, Tab, Tabs } from "@mui/material";
import PropTypes from "prop-types";
import Typography from "@mui/material/Typography";
import AddTheaterForm from "./AddTheaterForm";
import TheaterList from "./TheaterList";

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

const OwnerUI = () => {
  const [value, setValue] = React.useState(0);

  const handleChange = (event, newValue) => {
    setValue(newValue);
  };

  return (
    <>
      <div className="container-fluid">
        <h3 className="text-center text-warning mt-3">
          Welcome {JSON.parse(localStorage.getItem("loggedinuser")).name}<br/>
    
        </h3>
        <h5 className="text-center text-success mt-2">Your Owner ID:  {JSON.parse(localStorage.getItem("loggedinuser")).oid}</h5>
      </div>
      <div className="container-fluid">
        <Box sx={{ borderBottom: 1, borderColor: "divider", mt: 2 }}>
          <Tabs
            value={value}
            onChange={handleChange}
            aria-label="basic tabs example"
          >
            <Tab label="My Theatres" {...a11yProps(0)} />
            <Tab label="Add Theater" {...a11yProps(1)} />
          </Tabs>
        </Box>
        <TabPanel value={value} index={0}>
          <TheaterList />
        </TabPanel>
        <TabPanel value={value} index={1}>
          <AddTheaterForm />
        </TabPanel>
      </div>
    </>
  );
};

export default OwnerUI;
