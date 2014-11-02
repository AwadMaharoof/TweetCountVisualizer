<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Interest Visualizer</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/freelancer.css" rel="stylesheet" type="text/css">

        <!-- Fonts -->
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>

        <!-- IE8 support for HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->

    </head>

    <body id="page-top" class="index">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header page-scroll">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#page-top">Interest Visualizer</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="hidden">
                            <a href="#page-top"></a>
                        </li>
                        <li class="page-scroll">
                            <a href="#portfolio">Visualize</a>
                        </li>
                        <li class="page-scroll">
                            <a href="#about">About</a>
                        </li>
                        <li class="page-scroll">
                            <a href="#contact">Contact</a>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>

        <header>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <img class="img-responsive img-circle" src="img/profile.jpg" alt="" style="height:200px;">
                        <div class="intro-text">
                            <span class="name">Interest Visualizer</span>
                            <hr class="star-light">
                            <span class="skills">Real-time visualizations of things you love</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <section id="portfolio">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h2>Visualize!</h2>
                        <hr class="star-primary">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 column">
                        <div class="row clearfix">
                            <form name="autofillform" action="autocomplete">
                                <div class="col-md-2 column text-right" style="line-height: 38px;">
                                    Text to filter tweets by:
                                </div>
                                <div class="col-md-2 column">
                                    <input type="text" id="hashtags" style="height: 40px;"/>
                                </div>
                                <div class="col-md-2 column">
                                    <input type="button" value="Start recording stream" onclick="doCompletion()" class="btn btn-primary">
                                    <input type="button" value="Stop recording stream" onclick="stopStream()" class="btn btn-primary">
                                </div>
                            </form>
                            <div class="col-md-2 column">
                                <form name="getCountform" action="getcount">
                                    <input type="button" value="Start polling DB" onclick="getCount()" class="btn btn-primary">
                                </form>
                            </div>
                            <div class="col-md-3 column text-left" style="line-height: 38px;">
                                Your UUID: <div id="uuid"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 column">
                        <div id="chart_div" style="width: 100%; height: 500px;">
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="success" id="about">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h2>About</h2>
                        <hr class="star-light">
                    </div>
                </div>
                <!--   <div class="row">
                       <div class="col-lg-4 col-lg-offset-2">
                           <p>Freelancer is a free bootstrap theme created by Start Bootstrap. The download includes the complete source files including HTML, CSS, and JavaScript as well as optional LESS stylesheets for easy customization.</p>
                       </div>
                       <div class="col-lg-4">
                           <p>Whether you're a student looking to showcase your work, a professional looking to attract clients, or a graphic artist looking to share your projects, this template is the perfect starting point!</p>
                       </div>
                       <div class="col-lg-8 col-lg-offset-2 text-center">
                           <a href="#" class="btn btn-lg btn-outline">
                               <i class="fa fa-download"></i> Download Theme
                           </a>
                       </div>
                   </div> -->
            </div>
        </section>

        <section id="contact">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h2>Contact Us</h2>
                        <hr class="star-primary">
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <form role="form">
                            <div class="row">
                                <div class="form-group col-xs-12 floating-label-form-group">
                                    <label for="name">Name</label>
                                    <input class="form-control" type="text" name="name" placeholder="Name">
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-xs-12 floating-label-form-group">
                                    <label for="email">Email Address</label>
                                    <input class="form-control" type="email" name="email" placeholder="Email Address">
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-xs-12 floating-label-form-group">
                                    <label for="message">Message</label>
                                    <textarea placeholder="Message" class="form-control" rows="5"></textarea>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="form-group col-xs-12">
                                    <button type="submit" class="btn btn-lg btn-success">Send</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <footer class="text-center">
            <div class="footer-above">
                <div class="container">
                    <div class="row">
                        <div class="footer-col col-md-4">
                            <h3>Location</h3>
                            <p>Sri Lanka</p>
                        </div>
                        <div class="footer-col col-md-4">
                            <h3>Around the Web</h3>
                            <ul class="list-inline">
                                <li><a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-facebook"></i></a>
                                </li>
                                <li><a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-google-plus"></i></a>
                                </li>
                                <li><a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-twitter"></i></a>
                                </li>
                                <li><a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-linkedin"></i></a>
                                </li>
                                <li><a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-dribbble"></i></a>
                                </li>
                            </ul>
                        </div>
                        <div class="footer-col col-md-4">
                            <h3>About Twitter Visualizer</h3>
                            <p>Twitter Visualizer created by <a href="https://twitter.com/big_roof">@big_roof</a>.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-below">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            Copyright &copy; 2014 - Awad Maharoof
                        </div>
                    </div>
                </div>
            </div>
        </footer>

        <div class="scroll-top page-scroll visible-xs visble-sm">
            <a class="btn btn-primary" href="#page-top">
                <i class="fa fa-chevron-up"></i>
            </a>
        </div>
        <script src="js/jquery-1.10.2.js"></script>
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
        <script src="js/classie.js"></script>
        <script src="js/cbpAnimatedHeader.js"></script>
        <script src="js/freelancer.js"></script>
        <script src="js/scripts.js"></script>

    </body>

</html>
