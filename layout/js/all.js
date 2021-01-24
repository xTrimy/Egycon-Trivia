// Create menu numbering

var menuContainer = document.getElementsByClassName('questions-menu');
for(let i = 0; i<menuContainer.length; i++){
    var menu = menuContainer[i];
    for(let j = 0;j<50;j++){
        var myElement = document.createElement('div');
        myElement.innerHTML = j+1;
        myElement.classList.add('item');
        menu.appendChild(myElement);
    }
}