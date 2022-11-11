import { useReducer, useState } from "react";
import axios from "axios";
//first requirement for useReducer - original data
import { useNavigate, useParams } from "react-router-dom";
const init={
  cid:JSON.parse(localStorage.getItem("loggedinuser")).cid,
  rating:0,
  comment:"",

};
const reducer = (state, action) => {
  switch (action.type) {
    case "update":
      return { ...state, [action.field]: action.val };
    case "clear":
      return init;
  }
};
const ShowTimeFeedback= () => {
  // const [rating,setRating] = useState();
  //const [owner, dispatch] = useReducer(reducer, init);
  // const [comment,setComment] = useState("");
  // const [feedback,setFeedback] = useState(init);
  const navigate = useNavigate();
  const [feedback, dispatch] = useReducer(reducer, init);
  //const[clear,setClear]=useState("");
  // const resetInput=()=>{
  //  setRating();
  //  setComment("");
  // }
  const sendData = (e) => {
    //actually submits the data to server
    //react provides some functionality
    e.preventDefault();
    axios
      .post("http://localhost:8080/saveFeedback",feedback)
      .then((response) => {
        if (response.status === 200) {
          
          alert("Feedback submitted Succesfuly");
          navigate(`/custui`)
        }
       
      })
      .catch((error) => {
        //     console.log(error);
        alert("Not Successful");
      });
  };

  return (
    <div className="container">
    <div className="row d-flex justify-content-center">
    <div class="col-6 border rounded-2 mt-5 p-4 shadow  mb-5 bg-body rounded">
    <h3 className="d-flex justify-content-center mb-3"> Showtime Feedback </h3>
      <form>
      <div class="mb-3  mt-3">
          <label class="form-label ">Rating</label>
          <div>
          <label class="form-label ">1</label>
          <input
            type="radio"
            required
            name="rating"
            value={1}
            onChange={(e) => {
              dispatch({
                type: "update",
                field: "rating",
                val: e.target.value,
              }); 
            }}
            placeholder="1"
          />
           
       
       
          <div>
          <label class="form-label ">2</label>
          <input
            type="radio"
            required
           
            name="rating"
            value={2}
            onChange={(e) => {
              dispatch({
                type: "update",
                field: "rating",
                val: e.target.value,
              }); 
            }}
            label="rate3"
            placeholder="2"
          />
           </div>
       
        
          <div>
          <label class="form-label ">3</label>
          <input
            type="radio"
            required
           
            name="rating"
            value={3}
            onChange={(e) => {
              dispatch({
                type: "update",
                field: "rating",
                val: e.target.value,
              }); 
            }}
            label="rate3"
            placeholder="3"
          />
           </div>
        <div>
        <label class="form-label ">4</label>
          <input
            type="radio"
            required
           
            name="rating"
            value={4}
            onChange={(e) => {
              dispatch({
                type: "update",
                field: "rating",
                val: e.target.value,
              }); 
            }}
            
            placeholder="4"
          />
           </div>
        
      
         <div>
         <label class="form-label ">5</label>
          <input
            type="radio"
            required
           
            name="rating"
            value={5}
            onChange={(e) => {
              dispatch({
                type: "update",
                field: "rating",
                val: e.target.value,
              }); 
            }}
            
            placeholder="5"
          />
           </div>
           </div>
           </div>
        <div class="mb-3  mt-3">
          <label class="form-label ">Comment</label>
          <textarea
            required
            class="form-control"
            name="comment"
            value={feedback.comment}
            onChange={(e) => {
              dispatch({
                type: "update",
                field: "comment",
                val: e.target.value,
              }); 
            }}
            
            placeholder="Comment"
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

export default ShowTimeFeedback;