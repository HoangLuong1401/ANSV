const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

const header = $('header');
const closeBtns = $$('.btn__close');
const progressBtn = $('.js-progress');
const progressDropdown = $('.nav-right-dropdown');
const notifyBtn = $('.js-notify');
const notifyDropdown = $('.dropdown-notify');
const userBtn = $('.js-user');
const userDropdown = $('.user-dropdown');

progressBtn.onclick = function (event) {
    event.stopPropagation();
    notifyDropdown.style.display = 'none';
    userDropdown.style.display = 'none';
    if (progressDropdown.style.display == 'block') {
        progressDropdown.style.display = 'none';
    } else {
        progressDropdown.style.display = 'block';
    }
};

notifyBtn.onclick = function (event) {
    event.stopPropagation();
    progressDropdown.style.display = 'none';
    userDropdown.style.display = 'none';
    if (notifyDropdown.style.display == 'block') {
        notifyDropdown.style.display = 'none';
    } else {
        notifyDropdown.style.display = 'block';
    }
};

closeBtns.forEach((closeBtn) => {
    closeBtn.onclick = function (event) {
        event.stopPropagation();
        progressDropdown.style.display = 'none';
        notifyDropdown.style.display = 'none';
        userDropdown.style.display = 'none';
    };
});

userBtn.onclick = function (event) {
    event.stopPropagation();
    progressDropdown.style.display = 'none';
    notifyDropdown.style.display = 'none';
    if (userDropdown.style.display == 'block') {
        userDropdown.style.display = 'none';
    } else {
        userDropdown.style.display = 'block';
    }
};

document.onclick = function () {
    progressDropdown.style.display = 'none';
    notifyDropdown.style.display = 'none';
    userDropdown.style.display = 'none';
};

progressDropdown.onclick = function (event) {
    event.stopPropagation();
};
notifyDropdown.onclick = function (event) {
    event.stopPropagation();
};
userDropdown.onclick = function (event) {
    event.stopPropagation();
};

