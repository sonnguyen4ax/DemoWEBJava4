const sideMenu = document.querySelector("aside");
const menuBtn = document.querySelector("#menu-btn");
const closeBtn = document.querySelector("#close-btn");
const themeToggler = document.querySelector(".theme-toggler");

const dashboard = document.querySelector("#dashboard");
const customers = document.querySelector("#customers");
const orders = document.querySelector("#orders");
const analytics = document.querySelector("#analytics");
const messages = document.querySelector("#messages");
const products = document.querySelector("#products");
const reports = document.querySelector("#reports");
const settings = document.querySelector("#settings");
const add = document.querySelector("#add");

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
    else if(orders.classList.contains("active")){
        orders.classList.toggle('active')
    }
    else if(analytics.classList.contains("active")){
        analytics.classList.toggle('active')
    }
    else if(messages.classList.contains("active")){
        messages.classList.toggle('active')
    }
    else if(products.classList.contains("active")){
        products.classList.toggle('active')
    }
    else if(reports.classList.contains("active")){
        reports.classList.toggle('active')
    }
    else if(settings.classList.contains("active")){
        settings.classList.toggle('active')
    }
    else if(add.classList.contains("active")){
        add.classList.toggle('active')
    }
    if(x == "customers")
    	console.log(123);
    var a = '#' +x;
    document.querySelector(a).classList.toggle("active");
}