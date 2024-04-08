<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OE</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<script src="https://kit.fontawesome.com/f6131b4c65.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<c:url value='../style/css/login.css'/>"/>
<style type="text/css">
	.container::before {
	    background: linear-gradient(-45deg, #000000, #b1b1b1);
	}
	.btn {
		background-color: #282828;
	}
	.btn:hover {
		background-color: #000000;
		color: #fff;
		transform: translateY(5px);
	}
	.social-icon:hover {
		background-color: #000000;
		color: #fff;
	}
</style>
</head>
<body>
	<div class="container" style="min-width: 100%">
		<div class="forms-container">
			<div class="signin-signup">
				<form action="/Assignment2/login/sign-in" class="sign-in-form" method="post">
					<h2 class="title">Sign in</h2>
					<c:if test="${not empty errorLoginMessage}">
						<div class="alert alert-danger" role="alert">
						  ${errorLoginMessage}
						</div>
					</c:if>
					<div class="input-field">
						<i class="fas fa-user"></i>
						<input type="text" placeholder="Username" name="username"/>
					</div>
					<div class="input-field">
						<i class="fas fa-lock"></i>
						<input type="password" placeholder="Password" name="password"/>
					</div>
					<input type="submit" value="Sign in" class="btn solid"/>

					<p class="social-text">Or Sign in with social platforms</p>
					<div class="social-media">
						<a href="#" class="social-icon">
							<i class="fab fa-facebook-f"></i>
						</a>
						<a href="#" class="social-icon">
							<i class="fab fa-twitter"></i>
						</a>
						<a href="#" class="social-icon">
							<i class="fab fa-google"></i>
						</a>
						<a href="#" class="social-icon">
							<i class="fab fa-linkedin-in"></i>
						</a>
					</div>
				</form>

				<form action="/Assignment2/login/sign-up" class="sign-up-form" method="post">
					<h2 class="title">Sign up</h2>
					<c:if test="${not empty successSignUpMessage}">
						<div class="alert alert-success" role="alert">
						  ${successSignUpMessage}
						</div>
					</c:if>
					<c:if test="${not empty errorSignUpMessage}">
						<div class="alert alert-danger" role="alert">
						  ${errorSignUpMessage}
						</div>
					</c:if>
					<div class="input-field">
						<i class="fas fa-user"></i>
						<input type="text" placeholder="Username" name="id"/>
					</div>
					<div class="input-field">
						<i class="fas fa-envelope"></i>
						<input type="email" placeholder="Email" name="email"/>
					</div>
					<div class="input-field">
						<i class="fas fa-lock"></i>
						<input type="password" placeholder="Password" name="password"/>
					</div>
					<input type="submit" value="Sign up" class="btn solid"/>

					<p class="social-text">Or Sign up with social platforms</p>
					<div class="social-media">
						<a href="#" class="social-icon">
							<i class="fab fa-facebook-f"></i>
						</a>
						<a href="#" class="social-icon">
							<i class="fab fa-twitter"></i>
						</a>
						<a href="#" class="social-icon">
							<i class="fab fa-google"></i>
						</a>
						<a href="#" class="social-icon">
							<i class="fab fa-linkedin-in"></i>
						</a>
					</div>
				</form>
			</div>
		</div>
		<div class="panels-container">
			<div class="panel left-panel">
				<div class="content">
					<h3><a style="color: #fff;" href="/Assignment2"><i class="bi bi-house-door"></i></a> New here ?</h3>
					<p>Let's create an account now to use our services more easily?</p>
					<button class="btn transparent" id="sign-up-btn">Sign up</button>
				</div>

				<img src="../style/img/log.svg" class="image" alt="">
			</div>

			<div class="panel right-panel">
				<div class="content">
					<h3><a style="color: #fff;" href="/Assignment2"><i class="bi bi-house-door"></i></a> One of us ?</h3>
					<p>Welcome back! Sign in now to enjoy many offers from us?</p>
					<button class="btn transparent" id="sign-in-btn">Sign in</button>
				</div>

				<img src="../style/img/register.svg" class="image" alt="">
			</div>
		</div>
	</div>
	<c:if test="${not empty successSignUpMessage or not empty errorSignUpMessage}">
		<script type="text/javascript">
			const sign_in_btn = document.querySelector("#sign-in-btn");
			const sign_up_btn = document.querySelector("#sign-up-btn");
			const container = document.querySelector(".container");
	
			sign_up_btn.addEventListener('click', () => {
			    container.classList.add("sign-up-mode")
			})
	
			sign_in_btn.addEventListener('click', () => {
			    container.classList.remove("sign-up-mode")
			})
		    container.classList.add("sign-up-mode")
		</script>
	</c:if>
	<c:if test="${empty successSignUpMessage and empty errorSignUpMessage}">
		<script type="text/javascript">
			const sign_in_btn = document.querySelector("#sign-in-btn");
			const sign_up_btn = document.querySelector("#sign-up-btn");
			const container = document.querySelector(".container");
	
			sign_up_btn.addEventListener('click', () => {
			    container.classList.add("sign-up-mode")
			})
	
			sign_in_btn.addEventListener('click', () => {
			    container.classList.remove("sign-up-mode")
			})
		</script>
	</c:if>
</body>
</html>