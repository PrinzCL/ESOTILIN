window.addEventListener('load', function() {
    var footer = document.querySelector('footer');
    var bodyHeight = document.body.clientHeight;
    var footerHeight = footer.offsetHeight;
    var remainingHeight = bodyHeight - footerHeight;
    footer.style.minHeight = remainingHeight + 'px';
  });
  