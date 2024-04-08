function scrolled() {
    if(window.pageYOffset >= 133){
        document.querySelector("#navbar").classList.add("scroll");
    }
    else {
        document.querySelector("#navbar").classList.remove("scroll");
    }
}

window.addEventListener('scroll', scrolled)