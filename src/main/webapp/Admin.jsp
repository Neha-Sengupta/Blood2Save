<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin login</title>
    <link rel="stylesheet" href="admin.css">
</head>
<body>
    <div class="hero">
        <div class="from-box">
            <div class="button-box">
                <div id="btn"></div>
                <h2 class="toggle-btn">Admin</h2>
            </div>
            <form id=login class="input-group" action="Adminlogin" method="Post">
                <input type="text" class="input-field" name="email" placeholder="Enter Email" required>
                <input type="password" class="input-field" name="Password" placeholder="Enter Password" required>
                <input type="checkbox" class="check-box"><span>Remember Password</span>
                <button type="submit" class="submit-btn" style="margin-top:20px;">Log in</button>                        
            </form> 
        </div>
    </div>   
</body>
</html>