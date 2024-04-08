<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Admin</title>
		<script src="https://kit.fontawesome.com/f6131b4c65.js" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="<c:url value='${pageContext.request.contextPath}../../style/css/admin_index.css'/>">
		<link rel="stylesheet"
			href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
		<style type="text/css">
			.form__input {
			  font-family: 'Roboto', sans-serif;
			  color: #333;
			  font-size: 1.2rem;
				margin: 0 auto;
			  padding: 1.5rem 2rem;
			  border-radius: 0.2rem;
			  background-color: rgb(255, 255, 255);
			  border: none;
			  width: 90%;
			  display: block;
			  border-bottom: 0.3rem solid transparent;
			  transition: all 0.3s;
			  margin-top: 10px;
			}
			.buttons-container {
			  display: flex;
			  align-items: center;
			  justify-content: center;
			}
			
			.button-arounder {
			  background: white;
			  border: solid 2px black;
			  padding: .375em 1.125em;
			  font-size: 1rem;
			}
			
			.button-arounder {
			  background: hsl(190deg, 30%, 15%);
			  color: hsl(190deg, 10%, 95%);
			  
			  box-shadow: 0 0px 0px hsla(190deg, 15%, 5%, .2);
			  transfrom: translateY(0);
			  border-top-left-radius: 0px;
			  border-top-right-radius: 0px;
			  border-bottom-left-radius: 0px;
			  border-bottom-right-radius: 0px;
			  
			  --dur: .15s;
			  --delay: .15s;
			  --radius: 16px;
			  
			  transition:
			    border-top-left-radius var(--dur) var(--delay) ease-out,
			    border-top-right-radius var(--dur) calc(var(--delay) * 2) ease-out,
			    border-bottom-right-radius var(--dur) calc(var(--delay) * 3) ease-out,
			    border-bottom-left-radius var(--dur) calc(var(--delay) * 4) ease-out,
			    box-shadow calc(var(--dur) * 4) ease-out,
			    transform calc(var(--dur) * 4) ease-out,
			    background calc(var(--dur) * 4) steps(4, jump-end);
			}
			
			.button-arounder:hover,
			.button-arounder:focus {
			  box-shadow: 0 4px 8px hsla(190deg, 15%, 5%, .2);
			  transform: translateY(-4px);
			  background: hsl(230deg, 50%, 45%);
			  border-top-left-radius: var(--radius);
			  border-top-right-radius: var(--radius);
			  border-bottom-left-radius: var(--radius);
			  border-bottom-right-radius: var(--radius);
			}
		</style>
	</head>

	<body>
		<div class="container">
			<aside>
				<div class="top">
					<div class="logo">
						<a href="/Assignment2/watch-product/index"><img src="<c:url value='${pageContext.request.contextPath}../../style/img/logo.png'/>" alt=""></a>
					</div>
					<div class="close" id="close-btn">
						<span class="material-symbols-outlined">close</span>
					</div>
				</div>
				<div class="sidebar">
					<a href="#" id="dashboard" class="active" onclick="selectButton('dashboard')">
						<span class="material-symbols-outlined">grid_view</span>
						<h3>Dashboard</h3>
					</a>
					<a href="#" id="customers" onclick="selectButton('customers')">
						<span class="material-symbols-outlined">person</span>
						<h3>Account</h3>
					</a>
					<a href="#" id="products" onclick="selectButton('products')">
						<span class="material-symbols-outlined">inventory</span>
						<h3>Products</h3>
					</a>
					<a href="/Assignment2/login/index?sign-out=true">
						<span class="material-symbols-outlined">logout</span>
						<h3>Logout</h3>
					</a>
				</div>
			</aside>

			<main>
				<h1>Dashboard</h1>
				<div class="date">
					<input onchange="changeDate()" id="dateInput" type="date" value="${date}">
				</div>
				<div class="insights">
					<div class="sales">
						<span class="material-symbols-outlined">analytics</span>
						<div class="middle">
							<div class="left">
								<h3>Likes total</h3>
								<h1>${likes}</h1>
							</div>
							<div class="progress">
								<div class="number">
									<h3>Highest video likes</h3>
									<p>${highestLike}</p>
								</div>
							</div>
						</div>
						<small class="text-muted">Last 24 Hours</small>
					</div>
					<div class="expenses">
						<span class="material-symbols-outlined">bar_chart</span>
						<div class="middle">
							<div class="left">
								<h3>Comments total</h3>
								<h1>${cmts}</h1>
							</div>
							<div class="progress">
								<div class="number">
									<h3>Highest video comments</h3>
									<p>${highestCmt}</p>
								</div>
							</div>
						</div>
						<small class="text-muted">Last 24 Hours</small>
					</div>
					<div class="income">
						<span class="material-symbols-outlined">stacked_line_chart</span>
						<div class="middle">
							<div class="left">
								<h3>Share total</h3>
								<h1>${shares}</h1>
							</div>
							<div class="progress">
								<div class="number">
									<h3>Highest video shares</h3>
									<p>${highestShare}</p>
								</div>
							</div>
						</div>
						<small class="text-muted">Last 24 Hours</small>
					</div>
				</div>
				<div id="accountList" class="recent-orders" style="display: none; margin-bottom: 30px">
					<div id="accountMana" style="display: none; margin-bottom: 10%">
						<h2>Account Management</h2>
						<form action="/Assignment2/admin/account/add" method="post">
							<c:if test="${not empty error_account}">
								<div class="form__group">
								  <input style="background-color: #ffe4e4; border: 1px solid red; color: #b65a5a;" 
								  type="text" class="form__input" name="error" readonly="readonly" value="${error_account}"/>
								</div>
							</c:if>
							<c:if test="${not empty success_account}">
								<div class="form__group">
								  <input style="background-color: #e9ffe4; border: 1px solid #00ff1a; color: #63b65a;" 
								  type="text" class="form__input" name="success" readonly="readonly" value="${success_account}"/>
								</div>
							</c:if>
							<div class="form__group">
							  <input type="text" class="form__input" name="id" placeholder="Username" value="${us.id}"/>
							</div>
							<div class="form__group">
							  <input type="password" class="form__input" name="password" placeholder="Password" value="${us.password}"/>
							</div>
							<div class="form__group">
							  <input type="text" class="form__input" name="fullname" placeholder="Full name" value="${us.fullname}"/>
							</div>
							<div class="form__group">
							  <input type="text" class="form__input" name="email" placeholder="Email" value="${us.email}"/>
							</div>
							<div class="form__group">
							  <select class="form__input" name="admin" id="admin">
								  <c:if test="${us.admin == true || empty us}">
								    <option value="true">Admin</option>
								    <option value="false">User</option>
								  </c:if>
								  <c:if test="${us.admin == false}">
								    <option value="true">Admin</option>
								    <option selected value="false">User</option>
								  </c:if>
							  </select>
							</div>
							<div class="buttons-container" style="float: right; margin-right: 5%; margin-top: 20px;">
								<button formaction="/Assignment2/admin/account/add" type="submit" class="button-arounder">Create</button>
								<button formaction="/Assignment2/admin/account/update" type="submit" class="button-arounder">Update</button>
								<button formaction="/Assignment2/admin/account/remove" type="submit" class="button-arounder">Delete</button>
								<button formaction="/Assignment2/admin/account/new" type="submit" class="button-arounder">New</button> 
							</div>
						</form>
					</div>
					<h2>Accounts List</h2>
					<table>
						<thead>
							<tr>
								<th>User ID</th>
								<th>Name</th>
								<th>Email</th>
								<th>Role</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${accounts}" var="a">
								<tr>
									<td>${a.id}</td>
									<td>${a.fullname}</td>
									<td>${a.email}</td>
									<c:if test="${a.admin == true}">
										<td class="warning">Admin</td>
									</c:if>
									<c:if test="${a.admin == false}">
										<td class="warning">User</td>
									</c:if>
									<td class="primary"><a href="/Assignment2/admin/account?id=${a.id}"><span class="material-symbols-outlined">edit</span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<c:if test="${empty showAllAccount}">
						<a href="/Assignment2/admin/index/show-all-account">Show All</a>
					</c:if>
					<c:if test="${not empty showAllAccount}">
						<a href="/Assignment2/admin/index/short-account">Shorten</a>
					</c:if>
				</div>
				<div id="productList" class="recent-orders" style="display: none; margin-bottom: 30px">
					<div id="productMana" style="display: none; margin-bottom: 10%">
						<h2>Product Management</h2>
						<form action="/Assignment2/admin/product" method="post">
							<c:if test="${not empty error_product}">
								<div class="form__group">
								  <input style="background-color: #ffe4e4; border: 1px solid red; color: #b65a5a;" 
								  type="text" class="form__input" name="error" readonly="readonly" value="${error_product}"/>
								</div>
							</c:if>
							<c:if test="${not empty success_product}">
								<div class="form__group">
								  <input style="background-color: #e9ffe4; border: 1px solid #00ff1a; color: #63b65a;" 
								  type="text" class="form__input" name="success" readonly="readonly" value="${success_product}"/>
								</div>
							</c:if>
							<div class="form__group">
							  <input type="text" class="form__input" name="id" placeholder="Video ID" value="${vd.id}"/>
							</div>
							<div class="form__group">
							  <input type="text" class="form__input" name="title" placeholder="Title" value="${vd.title}"/>
							</div>
							<div class="form__group">
							  <input type="text" class="form__input" name="poster" placeholder="Youtube ID" value="${vd.poster}"/>
							</div>
							<div class="form__group">
							  <input type="text" class="form__input" name="description" placeholder="Description" value="${vd.description}"/>
							</div>
							<div class="form__group">
							  <input type="number" class="form__input" name="views" placeholder="Views" value="${vd.views}"/>
							</div>
							<div class="form__group">
							  <input type="text" class="form__input" name="category" placeholder="Category" value="${vd.category}"/>
							</div>
							<div class="form__group">
							  <select class="form__input" name="active" id="Active">
							    <c:if test="${vd.active == true || empty vd || vd.active == null}">
								    <option value="true">Active</option>
								    <option value="false">Stopped providing</option>
								  </c:if>
								  <c:if test="${vd.active == false}">
								    <option value="true">Active</option>
								    <option selected value="false">Stopped providing</option>
								  </c:if>
							  </select>
							</div>
							<div class="buttons-container" style="float: right; margin-right: 5%; margin-top: 20px;">
								<button formaction="/Assignment2/admin/product/add" type="submit" class="button-arounder">Create</button>
								<button formaction="/Assignment2/admin/product/update" type="submit" class="button-arounder">Update</button>
								<button formaction="/Assignment2/admin/product/remove" type="submit" class="button-arounder">Delete</button>
								<button formaction="/Assignment2/admin/product/new" type="submit" class="button-arounder">New</button> 
							</div>
						</form>
					</div>
					<h2>Products List</h2>
					<table>
						<thead>
							<tr>
								<th>Video ID</th>
								<th>Views</th>
								<th>Category</th>
								<th>Status</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${products}" var="p">
								<tr>
									<td>${p.id}</td>
									<td>${p.views}</td>
									<td>${p.category}</td>
									<c:if test="${p.active == true}">
										<td class="warning">active</td>
									</c:if>
									<c:if test="${p.active == false}">
										<td class="warning">stopped providing</td>
									</c:if>
									<td class="primary"><a href="/Assignment2/admin/product?id=${p.id}"><span class="material-symbols-outlined">edit</span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<c:if test="${empty showAllProduct}">
						<a href="/Assignment2/admin/index/show-all-product">Show All</a>
					</c:if>
					<c:if test="${not empty showAllProduct}">
						<a href="/Assignment2/admin/index/short-product">Shorten</a>
					</c:if>
				</div>
			</main>

			<div class="right">
			<div class="top">
				<button id="menu-btn">
					<span class="material-symbols-outlined">menu</span>
				</button>
				<div class="theme-toggler">
					<span class="material-symbols-outlined active">light_mode</span>
					<span class="material-symbols-outlined">dark_mode</span>
				</div>
				<div class="profile">
					<div class="info">
						<p>Hey, <b>${user.fullname}</b></p>
						<small class="text_muted">Admin</small>
					</div>
					<div class="profile-photo">
						<img src="<c:url value='${pageContext.request.contextPath}../../style/img/profile_1.jpg'/>" alt="">
					</div>
				</div>
			</div>
			<div class="recent-updates">
				<h2>Recent Updates</h2>
				<div class="updates">
					<div class="update">
						<div class="profile-photo">
							<img src="<c:url value='${pageContext.request.contextPath}../../style/img/profile_2.jpg'/>" alt="">
						</div>
						<div class="message">
							<p><b>Amanda</b> received his order od Night lion tech GPS drone.</p>
							<small class="text-muted">2 Minutes Ago</small>
						</div>
					</div>
					<div class="update">
						<div class="profile-photo">
							<img src="<c:url value='${pageContext.request.contextPath}../../style/img/profile_3.jpg'/>" alt="">
						</div>
						<div class="message">
							<p><b>Helen</b> received his order od Night lion tech GPS drone.</p>
							<small class="text-muted">2 Minutes Ago</small>
						</div>
					</div>
					<div class="update">
						<div class="profile-photo">
							<img src="<c:url value='${pageContext.request.contextPath}../../style/img/profile_1.jpg'/>" alt="">
						</div>
						<div class="message">
							<p><b>Serena</b> received his order od Night lion tech GPS drone.</p>
							<small class="text-muted">2 Minutes Ago</small>
						</div>
					</div>
				</div>
			</div>
			
			<div class="sales-analytics">
				<a href="#" data-bs-toggle="modal" data-bs-target="#addAccountModal" class="item add-product">
					<div>
						<span class="material-symbols-outlined">category</span>
						<h3>Add Product</h3>
					</div>
				</a>
				<div class="item add-product">
					<div>
						<span class="material-symbols-outlined">man</span>
						<h3>Add Account</h3>
					</div>
				</div>
			</div>
		</div>
		</div>
		<script type="text/javascript">
			function changeDate(){
				window.location = "/Assignment2/admin/index?date="+document.getElementById('dateInput').value;
			}
		</script>
		<c:if test="${empty date}">
			<script type="text/javascript">
				document.getElementById('dateInput').valueAsDate = new Date();
			</script>
		</c:if>
		
		
		<script type="text/javascript">
			const sideMenu = document.querySelector("aside");
			const menuBtn = document.querySelector("#menu-btn");
			const closeBtn = document.querySelector("#close-btn");
			const themeToggler = document.querySelector(".theme-toggler");
	
			const dashboard = document.querySelector("#dashboard");
			const customers = document.querySelector("#customers");
			const products = document.querySelector("#products");
			
			const productList = document.querySelector("#productList");
			const accountList = document.querySelector("#accountList");
			const accountMana = document.querySelector("#accountMana");
			const productMana = document.querySelector("#productMana");
	
			menuBtn.addEventListener('click', () => {
			    sideMenu.style.display = 'block';
			})
	
			closeBtn.addEventListener('click', () => {
			    sideMenu.style.display = 'none';
			})
	
			window.addEventListener('resize', () => {
			    if(window.innerWidth >= 769){
			        sideMenu.style.display = 'block';
			    }
			    else {
					sideMenu.style.display = 'none';
				}
			})
	
			themeToggler.addEventListener('click', () => {
			    document.body.classList.toggle('dark-theme-variables');
			    themeToggler.querySelector('span:nth-child(1)').classList.toggle('active');
			    themeToggler.querySelector('span:nth-child(2)').classList.toggle('active');
			})
	
			const selectButton = (x) => {
			    if(dashboard.classList.contains("active")){
			        dashboard.classList.toggle('active')
			    }
			    else if(customers.classList.contains("active")){
			        customers.classList.toggle('active')
			    }
			    else if(products.classList.contains("active")){
			        products.classList.toggle('active')
			    }
			    if(x == "dashboard"){
			    	productList.style.display = "none";
			    	accountList.style.display = "none";
			    	accountMana.style.display = "none";
			    	productMana.style.display = "none";
			    }
			    if(x == "customers"){
			    	accountList.style.display = "block";
			    	productList.style.display = "none";
			    	accountMana.style.display = "block";
			    	productMana.style.display = "none";
			    }
			    if(x == "products") {
			    	productList.style.display = "block";
			    	accountList.style.display = "none";
			    	accountMana.style.display = "none";
			    	productMana.style.display = "block";
			    }
			    var a = '#' +x;
			    document.querySelector(a).classList.toggle("active");
			}
		</script>
		<c:if test="${not empty showAllProduct or not empty showProduct}">
			<script type="text/javascript">
				const dash = document.querySelector("#dashboard");
				const pro = document.querySelector("#products");
				dash.classList.toggle('active')
				pro.classList.toggle('active')
				document.querySelector("#productList").style.display = "block";
				document.querySelector("#productMana").style.display = "block";
			</script>
		</c:if>
		<c:if test="${not empty showAllAccount or not empty showAccount}">
			<script type="text/javascript">
				const dash = document.querySelector("#dashboard");
				const cus = document.querySelector("#customers");
				dash.classList.toggle('active')
				cus.classList.toggle('active')
				document.querySelector("#accountList").style.display = "block";
				document.querySelector("#accountMana").style.display = "block";
			</script>
		</c:if>
	</body>
</html>