<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Donate</title>
    <link rel="stylesheet" href="admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
</head>
<body>
    <div class="hero">
        <div class="from-box">
         <div class="top_link"><a href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i>Return home</a></div>
            <div class="button-box">
                <div id="btn"></div>
                <h3 class="toggle-btn" style="text-align:center;">Donate</h3>
            </div>
            <form id=login class="input-group" onsubmit="event.preventDefault(); payNow()">
                <input type="text" class="input-field" id='name' name="Name" placeholder="Enter Name" required>                 
                <input type="email" class="input-field" id='email' placeholder="Email Id" name="Email" required>                
                <input type="number" class="input-field" id='pnumber' placeholder="Enter Phone Number"  name="Ph_No" required>
               <input type="number" class="input-field" id='amount' placeholder="Enter Amount"  name="pay" required>
                <button type="submit" class="submit-btn">Pay Now</button>                        
            </form> 
        </div>
    </div>   
    
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script>
    
	  	function payNow()
	  	{
	  		var name = document.getElementById("name").value;
	  		var email = document.getElementById("email").value;
	  		var pnumber = document.getElementById("pnumber").value;
	  		var amount = document.getElementById("amount").value;
	  		
	  		//Razorpay key:  rzp_test_OpPNstoOMVH2C3
	  		
	  		
	  		var options = {
			    "key": "rzp_test_OpPNstoOMVH2C3", // Enter the Key ID generated from the Dashboard
			    "amount": amount*100, // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
			    "currency": "INR",
			    "name": "Blood Donation", //your business name
			    "description": "Pese chaiye",
			    "image": "https://example.com/your_logo",
			    "handler": function (response){
			        alert("Payment Success"+response.razorpay_payment_id);
			        $.ajax({
			  			url:"addDonarDetails",
			  			method:"post",
			  			data:{"name": name, "email": email, "pnumber": pnumber,"amount": amount, "transaction_id": response.razorpay_payment_id},
			  			success:function(response1)
			  			{
			  				alert(response1)
			  			}
			  		})
			    },
			};
	  		
	  		var rzp1 = new Razorpay(options);
	  		rzp1.open();
	  		
	  	}
    </script>
</body>
</html>