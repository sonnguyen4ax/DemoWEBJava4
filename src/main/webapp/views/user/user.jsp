<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>OE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value='${pageContext.request.contextPath}../../style/css/user.css'/>">
    <link rel="stylesheet" href="<c:url value='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css'/>">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script>
    <style type="text/css">
    	.btn_wrap i {
		    opacity: 0;
		    font-size: 28px;
		    color: #EEEEED;
		    will-change: transform;
		    -webkit-transform: scale(.1);
		            transform: scale(.1);
		    -webkit-transition: all .3s ease;
		    transition: all .3s ease;
		}
		
		.btn_wrap {
		    position: relative;
		    display: -webkit-box;
		    display: -ms-flexbox;
		    display: flex;
		    -webkit-box-pack: center;
		        -ms-flex-pack: center;
		            justify-content: center;
		    -webkit-box-align: center;
		        -ms-flex-align: center;
		            align-items: center;
		    overflow: hidden;
		    cursor: pointer;
		    background-color: #434242;
		    padding: 0 18px;
		    will-change: transform;
		    -webkit-transition: all .2s ease-in-out;
		    transition: all .2s ease-in-out;
		}
		
		.btn_wrap:hover {
		    /* transition-delay: .4s; */
		    -webkit-transform: scale(1.1);
		            transform: scale(1.1)
		}
		
		.btn_wrap span {
		    position: absolute;
		    z-index: 1;
		    width: 100%;
		    height: 50px;
		    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
		    font-size: 20px;
		    text-align: center;
		    line-height: 50px;
		    letter-spacing: 2px;
		    color: #EEEEED;
		    background-color: #2D2727;
		    padding: 0 18px;
		    -webkit-transition: all 1.2s ease;
		    transition: all 1.2s ease;
		}
		
		.btn_wrap .container {
		    display: -webkit-box;
		    display: -ms-flexbox;
		    display: flex;
		    -ms-flex-pack: distribute;
		        justify-content: space-around;
		    -webkit-box-align: center;
		        -ms-flex-align: center;
		            align-items: center;
		    width: 100%;
		    height: 50px;
		    border-radius: 80px;
		}
		
		.btn_wrap:hover span {
		    -webkit-transition-delay: .25s;
		            transition-delay: .25s;
		    -webkit-transform: translateX(-280px);
		            transform: translateX(-280px)
		}
		
		.btn_wrap:hover i {
		    opacity: 1;
		    -webkit-transform: scale(1);
		            transform: scale(1);
		}
		.main_item_value_img {
			transition: 0.25s;
		}
		.main_item_value_img:hover {
			transform: translate(0rem, -1ex);
		}
		.form-control.search::placeholder {
			color: #333;
		}
		.form-control::placeholder {
			color: #fff;
		}
		.input_pass_profile {
			border: none;
			background: transparent;
		}
		.input_pass_profile:focus {
			outline: none;
		}
    </style>
</head>
<body style="display:flex; min-height: 100vh; flex-direction: column;">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark position-fixed w-100 top-0" style="z-index: 2;">
        <div class="container-fluid">
            <a class="navbar-brand ms-5" href="/Assignment2">OE</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll"
                aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarScroll">
                <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/Assignment2/watch-product/index">Home</a>
                    </li>
                    <c:forEach items="${categorys}" var="category">
		                <li class="nav-item">
	                        <a class="nav-link" href="/Assignment2/watch-product/category?cate=${category}">${category}</a>
	                    </li>
		  			</c:forEach> 
		  			<li class="nav-item">
                        <a class="nav-link" href="/Assignment2/favorite/index">Favorite</a>
                    </li>
                </ul>
                <ul class="navbar-nav me-5 my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                    <form action="/Assignment2/watch-product/search" method="post" class="d-flex" role="search">
                        <input class="form-control search me-2" type="search" name="search" placeholder="Title, people, genres"
                            aria-label="Search">
                        <button class="btn btn-outline-light" type="submit">Search</button>
                    </form>
                    <c:if test="${user.admin == true}">
                    	<li class="nav-item">
	                        <a class="nav-link" href="/Assignment2/admin/index">Admin</a>
	                    </li>
                    </c:if>
                    <c:if test="${not empty user}">
                    	<li class="nav-item dropdown">
	                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
	                            aria-expanded="false">
	                            <c:if test="${user.fullname != null}">
	                            	${user.fullname}
	                            </c:if>
	                            <c:if test="${user.fullname == null}">
	                            	${user.id}
	                            </c:if>
	                        </a>
	                        <ul class="dropdown-menu">
	                            <li><a class="dropdown-item" href="/Assignment2/profile/index">Profile</a></li>
	                            <li>
	                                <hr class="dropdown-divider">
	                            </li>
	                            <li><a class="dropdown-item" href="/Assignment2/login/index?sign-out=true">Sign out</a></li>
	                        </ul>
	                    </li>
                    </c:if>
                    <c:if test="${empty user}">
                    	<li class="nav-item">
	                        <a class="nav-link" href="/Assignment2/login/index">Sign in</a>
	                    </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </nav>
    <main class="main" style="flex: 1">
    	<c:if test = "${empty detail and empty favorite and empty search and empty profile}">
	    	<c:if test = "${not empty watchVideoId}">
		        <div class="main_video_select">
		            <div class="video_item">
		                <iframe 
		                src="https://www.youtube.com/embed/${watchVideoId}" 
		                title="YouTube video player" 
		                frameborder="0" 
		                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
		                allowfullscreen>
		            </iframe>
		            </div>
		        </div>
	        </c:if>
	        <c:forEach items="${map}" var="map">
		        <div class="main_item">
		            <a href="">
		                <p>${map[0]}<span>Explore All ></span></p>
		            </a>
		            <div class="main_item_value row col-md-12">
		            	<c:forEach items="${map[1]}" var="mapValue">
			                <div class="main_item_value_img">
			                    <a href="/Assignment2/watch-product/id?id=${mapValue[0].poster}">
			                        <img src="https://img.youtube.com/vi/${mapValue[0].poster}/sddefault.jpg" alt="">
			                    </a>
			                    <div class="btn_wrap">
							        <span>&#10084;</span>
							        <div class="container">
							        	<c:if test="${mapValue[1] == false}">
							            	<a href="/Assignment2/favorite/like?id=${mapValue[0].id}&ho=true"><i class="bi bi-hearts"></i></a>
							            </c:if>
							            <c:if test="${mapValue[1] == true}">
							            	<a href="/Assignment2/favorite/unlike?id=${mapValue[0].id}&ho=true"><i style="color: red;" class="bi bi-hearts"></i></a>
							            </c:if>
							            <a onclick="share('${mapValue[0].poster}')" data-bs-toggle="modal" data-bs-target="#exampleModal" href="#"><i class="bi bi-share-fill"></i></a>
							            <a href="/Assignment2/watch-product/detail?id=${mapValue[0].poster}"><i class="bi bi-info-lg"></i></a>
							        </div>
							    </div>
			                </div>
			  			</c:forEach> 
		            </div>
		        </div>
			  </c:forEach> 
		  </c:if>
		  <c:if test = "${not empty detail and empty favorite and empty search and empty profile}">
			  <div class="col-md-12 row mb-5">
			  	<div class="col-md-6">
	              <a href="/Assignment2/watch-product/id?id=${detail[0].poster}">
	                  <img style="width: 100%;" src="https://img.youtube.com/vi/${detail[0].poster}/sddefault.jpg" alt="">
	              </a>
	              <div class="btn_wrap" style="width: 100%;">
					<div class="container">
						<c:if test="${detail[1] == false }">
					 		<a href="/Assignment2/favorite/like?id=${detail[0].id}&dt=true"><i style="opacity: 1;" class="bi bi-hearts"></i></a>
					 	</c:if>
					 	<c:if test="${detail[1] == true }">
					 		<a href="/Assignment2/favorite/unlike?id=${detail[0].id}&dt=true"><i style="opacity: 1; color: red;" class="bi bi-hearts"></i></a>
					 	</c:if>
					 	<a onclick="share('${detail[0].poster}')" data-bs-toggle="modal" data-bs-target="#exampleModal" href="#"><i style="opacity: 1;" class="bi bi-share-fill"></i></a>
					</div>
				 </div>
	         	</div>
	         	<div class="col-md-6" style="color: #E9F8F9">
	              <h1 >${detail[0].title}</h1>
	              <p>${detail[0].views} views - ${detail[0].category}</p>
	              <p >${detail[0].description}</p>
	         	</div>
			  </div>
			  <div class="col-md-12 row mb-5">
			  	<div class="col-md-6">
			  		<div class="input-group mb-3">
					  <form action="/Assignment2/watch-product/comment" class="col-md-12" method="post">
					  	<input type="text" name="cmt" class="form-control bg-dark text-light" placeholder="Viết bình luận..." aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
					  </form>
					</div>
					<c:forEach items="${cmtList}" var="cmt">
						<div class="col-md-12 mt-3" style="background: #454545;color: #fff; border: 1px solid; border-radius: 20px; width: fit-content; padding: 10px 10px 0 10px;">
							<h6>${cmt.user.fullname}</h6>
							<p>${cmt.cmtValue}</p>
						</div>
					</c:forEach>
			  	</div>
			  </div>
		  </c:if>
		  
		  <c:if test = "${not empty favorite and empty search and empty profile}">
		        <div class="main_item">
		            <div class="main_item_value row col-md-12">
			  		<c:forEach items="${favorite}" var="fa">
		                <div class="main_item_value_img">
		                    <a href="/Assignment2/watch-product/id?id=${fa.video.poster}">
		                        <img src="https://img.youtube.com/vi/${fa.video.poster}/sddefault.jpg" alt="">
		                    </a>
		                    <div class="btn_wrap">
						        <span>&#10084;</span>
						        <div class="container">
						            <a href="/Assignment2/favorite/unlike?id=${fa.video.id}"><i style="color: red;" class="bi bi-hearts"></i></a>
						            <a onclick="share('${fa.video.poster}')" data-bs-toggle="modal" data-bs-target="#exampleModal" href="#"><i class="bi bi-share-fill"></i></a>
						            <a href="/Assignment2/watch-product/detail?id=${fa.video.poster}"><i class="bi bi-info-lg"></i></a>
						        </div>
						    </div>
		                </div>
				  </c:forEach> 
		            </div>
		        </div>
		  </c:if>
		  <c:if test = "${not empty search and empty profile}">
		        <div class="main_item">
		            <div class="main_item_value row col-md-12">
			  		<c:forEach items="${search}" var="fa">
		                <div class="main_item_value_img">
		                    <a href="/Assignment2/watch-product/id?id=${fa[0].poster}">
		                        <img src="https://img.youtube.com/vi/${fa[0].poster}/sddefault.jpg" alt="">
		                    </a>
		                    <div class="btn_wrap">
						        <span>&#10084;</span>
						        <div class="container">
						            <c:if test="${fa[1] == false }">
								 		<a href="/Assignment2/favorite/like?id=${fa[0].id}"><i class="bi bi-hearts"></i></a>
								 	</c:if>
								 	<c:if test="${fa[1] == true }">
								 		<a href="/Assignment2/favorite/unlike?id=${fa[0].id}"><i style="color: red;" class="bi bi-hearts"></i></a>
								 	</c:if>
						            <a onclick="share('${fa[0].poster}')" data-bs-toggle="modal" data-bs-target="#exampleModal" href="#"><i class="bi bi-share-fill"></i></a>
						            <a href="/Assignment2/watch-product/detail?id=${fa[0].poster}"><i class="bi bi-info-lg"></i></a>
						        </div>
						    </div>
		                </div>
				  </c:forEach> 
		            </div>
		        </div>
		  </c:if>
		  <c:if test="${not empty profile}">
		  	<section class="bg-dark mb-5">
			    <div class="container" >
			        <div class="row">
			            <div class="col-lg-12 mb-4 mb-sm-5">
			                <div class="card card-style1 border-0" style="background: #000">
			                    <div class="card-body p-1-9 p-sm-2-3 p-md-6 p-lg-7">
			                        <div class="row align-items-center">
			                            <div class="col-lg-6 mb-4 mb-lg-0">
			                                <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="...">
			                            </div>
			                            <div class="col-lg-6 px-xl-10">
			                                <div class="bg-secondary d-lg-inline-block py-1-9 px-1-9 px-sm-6 mb-1-9 rounded" style="padding: 20px; background: #15395A !important;">
			                                    <h3 class="h2 text-white mb-0">${user.fullname}</h3>
			                                    <c:if test="${user.admin == true}">
			                                    	<span style="color: #ceaa4d !important" class="text-primary">Admin</span>
			                                    </c:if>
			                                    <c:if test="${user.admin == false}">
			                                    	<span style="color: #ceaa4d !important" class="text-primary">User</span>
			                                    </c:if>
			                                </div>
			                                <ul class="list-unstyled mb-1-9 mt-2 text-light">
			                                    <li class="mb-2 mb-xl-3 display-28">
			                                    	<span class="display-26 text-light me-2 font-weight-600">Name:</span> ${user.fullname} 
			                                    	<span style="float: right;">
			                                    		<a href="" data-bs-toggle="modal" data-bs-target="#changeName"><i class="bi bi-pencil text-light"></i></a>
			                                    	</span>
			                                    </li>
			                                    <li class="mb-2 mb-xl-3 display-28">
			                                    	<span class="display-26 text-light me-2 font-weight-600">Password:</span> 
			                                    	<input class="input_pass_profile text-light" readonly type="password" value="${user.password}"/>
			                                    	<span style="float: right;">
			                                    		<a href="" data-bs-toggle="modal" data-bs-target="#changePassword"><i class="bi bi-pencil text-light"></i></a>
		                                    		</span>
			                                    </li>
			                                    <li class="mb-2 mb-xl-3 display-28">
			                                    	<span class="display-26 text-light me-2 font-weight-600">Email:</span> ${user.email}
			                                    	<span style="float: right;">
			                                    		<a href="" data-bs-toggle="modal" data-bs-target="#changeEmail"><i class="bi bi-pencil text-light"></i></a>
			                                    	</span>
			                                    </li>
			                                </ul>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
			</section>
		  </c:if>
		  
		  <!-- Modal change name-->
		<div class="modal fade" id="changeName" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content bg-dark">
		      <div class="modal-header text-light">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">Change Name</h1>
		        <button type="button" class="btn-close-secondary" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form action="/Assignment2/profile/change-name" method="post">
				  <c:if test="${not empty error_changeName}">
				  	<div class="alert alert-danger" role="alert">
					  ${error_changeName}
				    </div>
				  </c:if>
				  <div class="mb-3">
				    <label for="newname" class="form-label text-light">New name</label>
				    <input name="name" type="text" class="form-control" id="newname">
				  </div>
				  <div class="mb-3">
				    <label for="exampleInputPassword1" class="form-label text-light">Password</label>
				    <input name="password" type="password" class="form-control" id="exampleInputPassword1">
				  </div>
				  <button type="submit" class="btn btn-secondary float-end">Submit</button>
				</form>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- Modal change password-->
		<div class="modal fade" id="changePassword" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content bg-dark">
		      <div class="modal-header text-light">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">Change Password</h1>
		        <button type="button" class="btn-close-secondary" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form action="/Assignment2/profile/change-password" method="post">
				  <c:if test="${not empty error_changePassword}">
				  	<div class="alert alert-danger" role="alert">
					  ${error_changePassword}
				    </div>
				  </c:if>
				  <div class="mb-3">
				    <label for="newname" class="form-label text-light">Present password</label>
				    <input name="password" type="password" class="form-control" id="newname">
				  </div>
				  <div class="mb-3">
				    <label for="exampleInputPassword1" class="form-label text-light">New password</label>
				    <input name="newPass" type="password" class="form-control" id="exampleInputPassword1">
				  </div>
				  <button type="submit" class="btn btn-secondary float-end">Submit</button>
				</form>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- Modal change name-->
		<div class="modal fade" id="changeEmail" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content bg-dark">
		      <div class="modal-header text-light">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">Change Email</h1>
		        <button type="button" class="btn-close-secondary" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form action="/Assignment2/profile/change-email" method="post">
				  <c:if test="${not empty error_changeEmail}">
				  	<div class="alert alert-danger" role="alert">
					  ${error_changeEmail}
				    </div>
				  </c:if>
				  <div class="mb-3">
				    <label for="newname" class="form-label text-light">New email</label>
				    <input name="email" type="text" class="form-control" id="newname">
				  </div>
				  <div class="mb-3">
				    <label for="exampleInputPassword1" class="form-label text-light">Password</label>
				    <input name="password" type="password" class="form-control" id="exampleInputPassword1">
				  </div>
				  <button type="submit" class="btn btn-secondary float-end">Submit</button>
				</form>
		      </div>
		    </div>
		  </div>
		</div>
    </main>
    <footer class="bg-dark text-center text-white" style="">
        <div class="container p-4 pb-0">
            <section class="mb-4">
                <a class="btn btn-outline-light m-1" href="#!" role="button">
                    <i class="bi bi-facebook"></i>
                </a>

                <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button">
                    <i class="bi bi-twitter"></i>
                </a>

                <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button">
                    <i class="bi bi-google"></i>
                </a>

                <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button">
                    <i class="bi bi-instagram"></i>
                </a>

                <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button">
                    <i class="bi bi-linkedin"></i>
                </a>

                <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button">
                    <i class="bi bi-github"></i>
                </a>
            </section>
        </div>
        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
            © 2023 Copyright:
            <a class="text-white" href="">Coder</a>
        </div>
        <!-- Copyright -->
    </footer>
    
   <!-- Modal -->
   <div class="modal" tabindex="-1" id="exampleModal" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">Share to your friend</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <form action="/Assignment2/favorite/share" method="post">
			  <div class="mb-3">
			    <label for="videoId" class="form-label">Video ID</label>
			    <input type="text" readonly class="form-control" id="videoId" name="videoId">
			  </div>
			  <div class="mb-3">
			    <label for="exampleInputEmail1" class="form-label">Email address</label>
			    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
			  </div>
			  <button style="float: right;" type="submit" class="btn btn-primary">Submit</button>
			</form>
	      </div>
	    </div>
	  </div>
	</div>
	<script type="text/javascript">
		function share(id){
			document.getElementById("videoId").value = id;
		}
	</script>
	<c:if test="${not empty error_changeName or not empty error_changePassword or not empty error_changeEmail}">
		<script type="text/javascript">
	      swal(
	        'Error!',
	        'Change fail!',
	        'error'
	      )
		</script>
	</c:if>
	<c:if test="${not empty success_changeName or not empty success_changePassword or not empty success_changeEmail}">
		<script type="text/javascript">
		  swal(
		    'Success',
			'Change success!',
			'success'
      	  )
		</script>
	</c:if>
    <script src="<c:url value='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous'/>"></script>
</body>
</html>