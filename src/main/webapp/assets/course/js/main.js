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
const playBtn = $('.banner__play');
const pauseBtn = $('.banner__pause');
const bannerOverlay = $('.banner__overlay');
const bannerVideo = $('.banner__video');
const bannerStop = $('.banner__stop');
const bannerContent = $('.banner-content');

// Handle header
document.onscroll = function () {
    let space = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop || 0;

    if (space > 60) {
        console.log('scroll');
        header.style.backgroundColor = '#fff';
        header.style.marginTop = '0';
        document.querySelectorAll('.nav-list__item a').forEach(function (item) {
            item.style.color = '#000';
        });
        document.querySelector('.nav__user-name').style.color = '#000';
        document.querySelector('.nav_separate').style.backgroundColor = '#000';
        document.querySelectorAll('.nav-notify i').forEach(function (item) {
            item.style.color = '#000';
        });
    } else {
        header.style.backgroundColor = 'transparent';
        header.style.marginTop = '14px';
        document.querySelectorAll('.nav-list__item a').forEach(function (item) {
            item.style.color = '#fff';
        });
        document.querySelector('.nav__user-name').style.color = '#fff';
        document.querySelector('.nav_separate').style.backgroundColor = '#fff';
        document.querySelectorAll('.nav-notify i').forEach(function (item) {
            item.style.color = '#fff';
        });
    }
};

// Handle nav right btn
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


userBtn.onclick = function (event) {
    event.stopPropagation();
    if (progressDropdown) {
        progressDropdown.style.display = 'none';
    }
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

if (progressDropdown) {
    progressDropdown.onclick = function (event) {
        event.stopPropagation();
    };
}

notifyDropdown.onclick = function (event) {
    event.stopPropagation();
};
userDropdown.onclick = function (event) {
    event.stopPropagation();
};

// Handle Video
if (pauseBtn) {
    pauseBtn.classList.add('hidden');

    pauseBtn.onclick = function () {
        console.log('click');
        bannerVideo.muted = true;
        bannerVideo.audio = 0;
        bannerOverlay.style.visibility = 'hidden';
        bannerContent.style.visibility = 'hidden';
        pauseBtn.classList.add('hidden');
        playBtn.classList.remove('hidden');
    };
}

if (playBtn) {
    playBtn.onclick = function () {
        console.log('click');
        bannerVideo.muted = false;
        bannerVideo.audio = 1;
        bannerOverlay.style.visibility = 'hidden';
        bannerContent.style.visibility = 'hidden';
        playBtn.classList.add('hidden');
        pauseBtn.classList.remove('hidden');
    };
}

// bannerOverlay.onmouseover = function (event) {
//     event.stopPropagation();
// }

bannerVideo.onmouseover = function () {
    if (bannerContent) {
        bannerContent.style.visibility = 'visible';
        bannerContent.style.opacity = 1;
    }

    if (bannerOverlay) {
        bannerOverlay.style.visibility = 'visible';
        bannerOverlay.style.opacity = 1;
    }

    setTimeout(() => {
        if (bannerContent) {
            bannerContent.style.visibility = 'hidden';
            bannerContent.style.opacity = 0;
        }

        if (bannerOverlay) {
            bannerOverlay.style.visibility = 'hidden';
            bannerOverlay.style.opacity = 0;
        }

    }, 2000);
};
