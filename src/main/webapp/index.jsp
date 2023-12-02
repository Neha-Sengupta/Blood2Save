<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Blood2Save</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/blood.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

 
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">

      <div class="logo">
        <h1 class="text-light"><a href="index.jsp"><img src="assets/img/favicon.png" alt="icon"><span>Blood2Save</span></a></h1>
       
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="#hero">Home</a></li>
          <li class="dropdown"><a href="#about"><span>Login</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="Donater.jsp">Donater</a></li>
              <li><a href="Customer.jsp">Customer</a></li>
            </ul>
          </li>
          <li><a class="nav-link scrollto" href="#services">Services</a></li>
          <li><a class="nav-link scrollto" href="#contact">Contact Us</a></li>
          <li><a class="nav-link scrollto" href="#faq">FAQ</a></li>
          <li><a class="nav-link scrollto" href="Admin.jsp">Admin</a></li>
          <li><a class="nav-link scrollto" href="#footer">Donate</a></li>
          <li><a class="getstarted scrollto"  href="#hero">Find Donar</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">

    <div class="container">
      <div class="row gy-4">
        <div class="col-lg-6 order-2 order-lg-1 d-flex flex-column justify-content-center">
          <h1>Search Donar </h1>
          <h2>You can Search donar to request and for emergency search you have to first login yourself </h2>
          <div >
          
             						   <form action="indexSearch" method="post">
									      
									        <select  class="input-field" name="Blood_Group" style="width:400px; height:40px; border-color:#d6d7d3; border-radius:4px;color:#848482; margin-top:20px;">
									            <option> Choose Blood Group</option>
									            <option>A+</option>
									            <option>A-</option>
									            <option>B+</option>
									            <option>B-</option>
									            <option>AB+</option>
									            <option>AB-</option>
									            <option>O+</option>
									            <option>O-</option>
									          </select>
									           <input class="form-control me-2" type="search" placeholder="Enter location" name="Address" aria-label="Search" style="width:400px; height:40px; margin-top:15px;"><br>
									      
									        <button class="btn-get-started scrollto" style="width:400px; height:50px; border-radius:10px; margin-top:0px;border:none;" type="submit" >Search</button><br>
											
										</form>
          </div>
          
          
        </div>
        <div class="col-lg-6 order-1 order-lg-2 hero-img">
          <img src="assets/img/1.png" class="img-fluid animated" alt="">
        </div>
      </div>
    </div>

  </section><!-- End Hero -->

  

  <main id="main">

    <!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container">

        <div class="row justify-content-between">
          <div class="col-lg-5 d-flex align-items-center justify-content-center about-img">
            <img src="assets/img/about-img.svg" class="img-fluid" alt="" data-aos="zoom-in">
          </div>
          <div class="col-lg-6 pt-5 pt-lg-0">
            <h3 data-aos="fade-up">Users Login</h3>
            <p data-aos="fade-up" data-aos-delay="100">
              Users can Login using login button and if you a new user u can regiser your account please register yourself first 
            </p>
            <div class="row">
              <div class="col-md-6" data-aos="fade-up" data-aos-delay="100">
                <i class="fa-solid fa-hand-holding-medical"></i>
                <h4>Donater Login</h4>
                <div class="navbar"><a class="getstarted scrollto" href="Donater.jsp">Login</a></div>
                
              </div>
              <div class="col-md-6" data-aos="fade-up" data-aos-delay="200">
                <i class="fa-solid fa-user"></i>
                <h4>Customer Login</h4>
                <div class="navbar"><a class="getstarted scrollto" href="Customer.jsp">Login</a></div>
              </div>
            </div>
          </div>
        </div>

      </div>
    </section><!-- End About Section -->

    <!-- ======= Services Section ======= -->
    <section id="services" class="services section-bg">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Services</h2>
          <p>Check out the great services we offer</p>
        </div>

        <div class="row">
          <div class="col-md-6 col-lg-3 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="100">
            <div class="icon-box">
              <div class="icon"><i class="fa fa-search" aria-hidden="true"></i></div>
              <h4 class="title"><a href="">Find A Donar</a></h4>
              <p class="description">Users will be able to find blood donar and request for blood for specific date ,time & place</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-3 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="200">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-tachometer"></i></div>
              <h4 class="title"><a href="">Emergency Mode</a></h4>
              <p class="description">In case of emergency,users will be able to get contact number of public account of donar</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-3 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="300">
            <div class="icon-box">
              <div class="icon"><i class="fa fa-tint" aria-hidden="true"></i></div>
              <h4 class="title"><a href="">Be A Blood Donar</a></h4>
              <p class="description">Users will be able to create donar account and will be able to save life</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-3 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="400">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-world"></i></div>
              <h4 class="title"><a href="">Donate To Save Life</a></h4>
              <p class="description">Users can donate money and save life we will provide the money where its needed</p>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Services Section -->

       <!-- ======= Contact Us Section ======= -->
       <section id="contact" class="contact">
        <div class="container" data-aos="fade-up">
  
          <div class="section-title">
            <h2>Contact Us</h2>
            <p>Contact us the get started</p>
          </div>
  
          <div class="row">
  
            <div class="col-lg-5 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
              <div class="info">
                
               <img src="assets/img/contact.png" alt="contact image"width="500" height="500">
              </div>
  
            </div>
       
  
            <div class="col-lg-7 mt-5 mt-lg-0 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="200">
              <form  action="contact" method="post" style="width: 100%;border-top: 3px solid #fd0e35 ; border-bottom: 3px solid #fd0e35 ;padding: 30px;background: #fff;box-shadow: 0 0 24px 0 rgba(0, 0, 0, 0.12);">
                <div class="row">
                  <div class="form-group col-md-6">
                    <label for="name">Your Name</label>
                    <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" required>
                  </div>
                  <div class="form-group col-md-6 mt-3 mt-md-0">
                    <label for="name">Your Email</label>
                    <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" required>
                  </div>
                <div class="form-group mt-3">
                  <label for="name">Contact Number</label>
                  <input type="text" class="form-control" name="contact" id="contact" placeholder="Contact Number" required>
                </div>
                </div>
                <div class="form-group mt-3">
                  <label for="name">Subject</label>
                  <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" required>
                </div>
                <div class="form-group mt-3">
                  <label for="name">Message</label>
                  <textarea class="form-control" name="message" rows="10" required></textarea>
                </div>
              
                <button type="submit" style=" background: #fd0e35 ;border: 0;padding: 10px 24px; color: #fff;transition: 0.4s;border-radius: 4px;" onclick="myFunction()">Send Message</button>
                
                <script>
				function myFunction() {
				 alert("Data submitted successfuly!");
				} // Pop-up script
				</script>
                
              </form>
            </div>
  
          </div>
  
        </div>
        
        
        
   
      </section><!-- End Contact Us Section -->
  
  


    <!-- ======= F.A.Q Section ======= -->
    <section id="faq" class="faq section-bg">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>F.A.Q</h2>
          <p>Frequently Asked Questions</p>
        </div>

        <ul class="faq-list" data-aos="fade-up" data-aos-delay="100">

          <li>
            <div data-bs-toggle="collapse" class="collapsed question" href="#faq1">How can i request to donar?<i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq1" class="collapse" data-bs-parent=".faq-list">
              <p>
                If you want to request somone then you have to register yourself first and after creation your profile you can request your match donar.
              </p>
            </div>
          </li>

          <li>
            <div data-bs-toggle="collapse" href="#faq2" class="collapsed question">Can i get any reward for donating blood? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq2" class="collapse" data-bs-parent=".faq-list">
              <p>
				To donate blood our website can not give you any reword if you fully free to donate your precious blood and save others life then we can help with that, we can not charge anything for this.
              </p>
            </div>
          </li>

          <li>
            <div data-bs-toggle="collapse" href="#faq3" class="collapsed question">Can i have to pay donar for the blood? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq3" class="collapse" data-bs-parent=".faq-list">
              <p>
                We don't decide that if your match donar will charge for the donation  it's not in our hand we just help you to seach your nearest donar.
              </p>
            </div>
          </li>

          <li>
            <div data-bs-toggle="collapse" href="#faq4" class="collapsed question">For requesting the donar i have to pay? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq4" class="collapse" data-bs-parent=".faq-list">
              <p>
                No you don't,we provide you free services here if the donar charge any money that's not in our hand
              </p>
            </div>
          </li>

          <li>
            <div data-bs-toggle="collapse" href="#faq5" class="collapsed question">If i want help people with finacial support how can i do this? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq5" class="collapse" data-bs-parent=".faq-list">
              <p>
                If you want to help others then you can donate in our Donate section and we will ensure you with that this money will provide them whose need this support we will rech to them .
              </p>
            </div>
          </li>

          <li>
            <div data-bs-toggle="collapse" href="#faq6" class="collapsed question">If the donar hav any health issues how we can find that? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq6" class="collapse" data-bs-parent=".faq-list">
              <p>
                In this website you can only find nearest donar it can happend that he/she have any health problem please when you contact with them so make sure thet the donar provide you his/her medical report.And after that you will be decide that you want the blood donar or not. 
              </p>
            </div>
          </li>

        </ul>

      </div>
    </section><!-- End F.A.Q Section -->

 



    

   </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">

    <div class="footer-newsletter">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-6">
            <h4>Save Life With Financial Support</h4>
            <p>You can donate money for save others life to click the buuton</p>
           
              <button style="background-color:red;border-radius:8px;font-size:20px;width:120px;border: none;"><a href="Donate.jsp" style="font-size:20px;color:azure">Donate</a></button>
           
          </div>
        </div>
      </div>
    </div>

    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6 footer-contact">
            <h3><img src="assets/img/favicon.png" alt="icon">Blood2Save</h3>
            <p>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Donate Blood <br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; To Save<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Others <br><br>
              
            </p>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Login</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Contact Us</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">FAQ</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Services</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Fin A Donar</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Emergency Mode</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Be A Blood Donar</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Help Others</a></li>
              
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Social Networks</h4>
            <p>To Contact With Us</p>
            <div class="social-links mt-3">
              <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
              <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
              <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
              <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
              <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
            </div>
            <div>
              <strong>Phone:</strong> +1 5589 55488 55<br>
              <strong>Email:</strong> info@example.com<br>
            </div>
          </div>

        </div>
      </div>
    </div>

   
    

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>