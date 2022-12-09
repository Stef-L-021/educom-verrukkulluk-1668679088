// Custom javascript


// Function for tabs in detail page
function openTab(evt, tab_name) {
    // declare all values
    var i, tabcontent, tablinks;

    // get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i< tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    // Get all elements with claass="tablinks" and remove the class active
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    // Show the current tab and add an "active" class to the button that opened the tab
    document.getElementById(tab_name).style.display = "block";
    evt.currentTarget.className += " active";
} 