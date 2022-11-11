import React, { useEffect, useState } from "react";
import MUIDatatable from "mui-datatables";
import { Button } from "@mui/material";
import axios from "axios";

const OwnerVerification = () => {
  const [list, setList] = useState([]);
  console.log("List: ", list);
  const verify = (value, tableMeta, updateValue) => {
    const rowIndex = tableMeta.rowIndex;
    const data = list[rowIndex];
    const uid = data.uid.uid;
    axios
      .put(`http://localhost:8080/verify?uid=${uid}`)
      .then((response) => {
        console.log(response);
        alert("verify");
        verification();
      })
      .catch((err) => {
        console.log("Error: ", err);
      });
  };

  const verification = () => {
    axios
      .get("http://localhost:8080/getActiveTheaterOwner?status=0")
      .then((response) => {
        console.log(response?.data);
        setList(response?.data);
      })
      .catch((err) => {
        console.log(err);
      });
  };

  useEffect(() => {
    verification();
  }, []);

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
            <Button
              variant="contained"
              color="primary"
              onClick={() => verify(value, tableMeta, updateValue)}
            >
              Verify
            </Button>
          );
        },
      },
    },
  ];
  return (
    <>
      <MUIDatatable data={list} columns={columns} />
    </>
  );
};

export default OwnerVerification;
