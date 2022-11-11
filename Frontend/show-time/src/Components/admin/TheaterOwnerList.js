import { IconButton } from "@mui/material";
import axios from "axios";
import React, { useEffect, useState } from "react";
import DeleteIcon from "@mui/icons-material/Delete";
import MUIDatatable from "mui-datatables";

const TheaterOwnerList = () => {
  const [owner, setOwner] = useState([]);
  const fetchTheaterOwner = () => {
    axios
      .get("http://localhost:8080/getActiveTheaterOwner?status=1")
      .then((response) => {
        setOwner(response?.data);
      })
      .catch(console.log);
  };

  useEffect(() => {
    fetchTheaterOwner();
  }, []);

  const removeOwner = (value, tableMeta, updateValue) => {
    // http://localhost:8080/remove?uid=8
    const rowIndex = tableMeta.rowIndex;
    const data = owner[rowIndex];
    const uid = data.uid.uid;

    axios
      .put(`http://localhost:8080/remove?uid=${uid}`)
      .then((response) => {
        console.log(response?.data);
        fetchTheaterOwner();
      })
      .catch(console.log);
  };
  const columns = [
    {
      label: "Owner Name",
      name: "name",
    },
    {
      label: "ID Proof",
      name: "id_proof",
    },
    {
      label: "Contacts",
      name: "contact",
    },
    {
      label: "Status",
      name: "active_status",
      options: {
        customBodyRender: (value, tableMeta, updateValue) => {
          return (
            <IconButton
              color="error"
              onClick={() => removeOwner(value, tableMeta, updateValue)}
            >
              <DeleteIcon />
            </IconButton>
          );
        },
      },
    },
  ];
  return (
    <>
      <MUIDatatable data={owner} columns={columns} />
    </>
  );
};

export default TheaterOwnerList;
//http://localhost:8080/getActiveTheaterOwner?status=1
