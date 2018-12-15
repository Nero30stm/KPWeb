function getBodyScrollTop() {
  var offset = self.pageYOffset || (document.documentElement && document.documentElement.scrollTop) || (document.body && document.body.scrollTop);
  if (offset > 300) {
    document.querySelector('#navbar').className = "fixed-menu-top";
  }
  if (offset > screen.height - 300) {
    document.querySelector('#navbar').className = "fixed-menu-top";
  }
}
window.addEventListener("scroll", getBodyScrollTop);