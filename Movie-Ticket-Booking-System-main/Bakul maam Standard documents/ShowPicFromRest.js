import { useEffect, useState } from "react";

function ShowPicFromRest() {
    const [person,setPerson] = useState({}); 

    useEffect(()=>{
           //this api sends JSON data where id, name and blob column picture received as byte []
           fetch("http://localhost:8080/getperson?pid=1")
           .then(resp => resp.json())
           .then(data => setPerson(data))
           
    } , [])

    return (
        <div>
            Id : <p> {person.pid} </p>
            Name : <p> {person.name}</p>
            Picture : <img src={`data:image/jpeg;base64,${person.picture}`} width="200" height="200" /> 
        </div>
    )
}

export default ShowPicFromRest;