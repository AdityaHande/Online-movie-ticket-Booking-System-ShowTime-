import React from 'react'
import { Navigate, useNavigate } from 'react-router-dom';
import Swal from 'sweetalert2';
const Final = () => {

    const navigate = useNavigate();
   
    Swal.fire({
        position: 'top-center',
        icon: 'success',
        title: 'Congratulations your tickes are booked',
        showConfirmButton: false,
        timer: 1500
      })

    return (   

    
    <div className="container">
      <div className="row d-flex justify-content-center">
        <div class="col-6 border rounded-2 mt-5 p-4 shadow  mb-5 bg-body rounded">

        <button type="button" class="btn btn-primary"
                  onClick={() => navigate(`/feedback`)}
                >
                  <h3>Give Feedback to ShowTimeApp</h3>
                </button>

                <button type="button" class="btn btn-primary"
                  onClick={() => navigate(`/custui`)}
                >
                  <h3>Go To Movies</h3>
                </button>
        </div>
        </div>
        </div>
);
}
 
export default Final;