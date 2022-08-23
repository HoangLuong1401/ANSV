const header =  document.querySelector('header');
const progressBtn =  document.querySelector('.js-progress');
const progressDropdown =  document.querySelector('.nav-right-dropdown');
const notifyBtn =  document.querySelector('.js-notify');
const notifyDropdown =  document.querySelector('.dropdown-notify');
const userBtn =  document.querySelector('.js-user');
const userDropdown =  document.querySelector('.user-dropdown');


// Handle header
document.onscroll = function () {
    let space = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop || 0;

    if (space > 60) {
        header.style.backgroundColor = '#fff';
        header.style.marginTop = '0';
        document.querySelectorAll('.nav-list__item a').forEach(function (item) {
            item.style.color = '#fc9404';
        });
        document.querySelector('.nav__user-name').style.color = '#fc9404';
        document.querySelector('.nav_separate').style.backgroundColor = '#fc9404';
        document.querySelectorAll('.nav-notify i').forEach(function (item) {
            item.style.color = '#fc9404';
        });
    } else {
        header.style.backgroundColor = 'transparent';
        header.style.marginTop = '14px';
        document.querySelectorAll('.nav-list__item a').forEach(function (item) {
            item.style.color = '#ffffff';
        });
        document.querySelector('.nav__user-name').style.color = '#ffffff';
        document.querySelector('.nav_separate').style.backgroundColor = '#ffffff';
        document.querySelectorAll('.nav-notify i').forEach(function (item) {
            item.style.color = '#ffffff';
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
jQuery(document).ready(function ($) {
var CommonScreen = {
    itemPerPage: 6,
    pageWidth: 0,
    windowWidth: 0,
    /**
     * <1024 --> 718:3
     * 1024-<1255 --> 960:4
     * 1255-<1500 --> 1206:5
     * >=1500--> 1451:6
     */
    getScreenProperties: function () {
        var wWidth = $(window).width();
        $(window).resize(function () {
            wWidth = $(window).width();
        });
        var pageWidth = 1451;
        if (wWidth < 1006) {
            pageWidth = 718;
        } else if (wWidth < 1255) {
            pageWidth = 960;
        } else if (wWidth < 1500) {
            pageWidth = 1206;
        }
        pageWidth = pageWidth + 20
        //item perpage tren 1 hang(gia dinh la 1x1)
        var itemPerPage = 6;
        if (wWidth < 1006) {
            itemPerPage = 3;
        } else if (wWidth < 1255) {
            itemPerPage = 4;
        } else if (wWidth < 1500) {
            itemPerPage = 5;
        }
        return {
            itemPerPage: itemPerPage,
            pageWidth: pageWidth,
            windowWidth: wWidth,
            maxItem: 6
        };
    },
    getPageWidth: function () {
        var screenProperties = CommonScreen.getScreenProperties();
        return screenProperties.pageWidth;
    },
    init: function () {
        var screenProperties = CommonScreen.getScreenProperties();
        CommonScreen.itemPerPage = screenProperties.itemPerPage;
        CommonScreen.pageWidth = screenProperties.pageWidth;
        CommonScreen.windowWidth = screenProperties.windowWidth;
    }
}
var HomeSlider = {
    idPrefix: '_page_',
    clickable: true,
    /**
     * lay so item thuc te cua tung loai box
     * @param {int} boxType: 0 => page 1x1, 1=>page 2x1 (item dau=4:2x2)
     * 2 => page 1x1 (item dau=2:1x2)
     * @returns {undefined}
     */
    getPageItem: function (pageObj, isFirstPage) {
        var screenProperties = CommonScreen.getScreenProperties();
        var itemPerPage = screenProperties.itemPerPage;
        if (!isFirstPage)
            isFirstPage = false;
        var items = 0;
        var boxType = typeof (pageObj.attr("boxtype")) != 'undefined' ? parseInt(pageObj.attr("boxtype"), 10) : 0;

        switch (boxType) {
            case 1:
                items = isFirstPage ? (itemPerPage * 2 - 3) : itemPerPage * 2;
                break;
            case 2:
                items = isFirstPage ? (itemPerPage - 1) : itemPerPage;
                break;
            default:
                items = itemPerPage;
        }
        return items;
    },
    getItemChange: function (delta, boxType) {
        var items = 0;
        switch (boxType) {
            case 1:
                items = delta * 2;
                break;
            case 2:
                items = delta;
                break;
            default:
                items = delta;
        }
        return items;
    },
    getImageOnScreen: function (pageObj, isFirstPage) { //chi lay nhung image hien tren man hinh
        if (!isFirstPage)
            isFirstPage = false;
        var index = 0;
        var onsCreenImage = []; //nhung image hien ra man hinh
        var imageChildren = pageObj.find("._slideimg");
        var itemOnPage = HomeSlider.getPageItem(pageObj, isFirstPage);
        imageChildren.each(function () {
            var o2 = $(this);
            var leftPosition = Math.round(o2.position().left);
            //var leftPosition = Math.round(o2.offset().left);
            if (leftPosition >= 0 && index < itemOnPage) {
                index++;
                onsCreenImage.push(o2);
            }
        });
        var firstImage = $(imageChildren[0]); //image dau cua slide
        var lastImage = $(imageChildren[imageChildren.length - 1]); //image cuoi cung cua slide
        var firstBoundImage = onsCreenImage[0]; //image dau nam trong man hinh
        var lastBoundImage = onsCreenImage[onsCreenImage.length - 1]; //image cuoi cung nam trong man hinh
        return {
            firstImage: firstImage,
            lastImage: lastImage,
            onScreenImage: onsCreenImage,
            firstBoundImage: firstBoundImage,
            lastBoundImage: lastBoundImage
        };
    },
    getItemOnOnceRow: function (pageObj) {
        var items = 0;
        var boxType = typeof (pageObj.attr("boxtype")) != 'undefined' ? parseInt(pageObj.attr("boxtype"), 10) : 0;
        var lastImage = typeof (pageObj.attr("lastImage")) != 'undefined' ? parseInt(pageObj.attr("lastImage"), 10) : 0;
        switch (boxType) {
            case 1:
                items = Math.round((lastImage + 4) / 2)
                break;
            case 2:
                items = lastImage + 2;
                break;
            default:
                items = lastImage + 1;
        }
        return items;
    },
    slide: function (boxId, isNext) {
        if (HomeSlider.clickable) {
            HomeSlider.clickable = false;
            var o =  $('#' + HomeSlider.idPrefix + boxId);
            var imageChildren = o.find("._slideimg");
            var children = o.find(".subtray");
            var screenProperties = CommonScreen.getScreenProperties();
            var itemPerPage = screenProperties.itemPerPage;
            var itemWidth = children[1] ? $(children[1]).width() : $(children[0]).width();
            var pageWidth = itemWidth * itemPerPage; //CommonScreen.getPageWidth();
            var p2 = 0;
            var temp1 = $("#" + HomeSlider.idPrefix + boxId).css("margin-left");
            var p1 = parseInt(temp1, 10);
            var itemOnPage = HomeSlider.getPageItem(o);
            var itemOnFirstPage = HomeSlider.getPageItem(o, true);
            var itemOnOnceRow = HomeSlider.getItemOnOnceRow(o);
            //p2 = p1 - pageWidth;
            var lastImage = parseInt(o.attr("lastImage"), 10);
            var newLastImage = 0;
            if (isNext) {
                p2 = p1 - pageWidth;
                for (var i = lastImage + 1; i <= itemOnPage + lastImage; i++) {
                    if (imageChildren[i]) {
                        if (newLastImage < i) {
                            newLastImage = i;
                        }
                        var image = $(imageChildren[i]);
                        if (image) {
                            var originalImage = image.attr("_src");
                            var currentImage = image.attr("src");
                            if (originalImage && originalImage != currentImage) {
                                image.attr("src", originalImage);
                            }
                        }
                    }
                }
            } else {
                newLastImage = lastImage - itemOnPage;
                if (newLastImage < itemOnFirstPage) {
                    newLastImage = itemOnFirstPage - 1;
                }
                p2 = p1 + pageWidth;
            }
            var totalLength = 0;
            children.each(function () {
                totalLength += parseInt($(this).width());
            });
            if (newLastImage < 0) {
                newLastImage = 0;
            }
            o.attr('lastImage', newLastImage);
            var idArr = (o.attr("id")).split("_");
            var id = idArr[2];
            if (p2 > 0)
                p2 = 0;
            if (itemOnOnceRow * itemWidth + pageWidth > totalLength && isNext) {
                p2 = -totalLength + pageWidth;
            }
            if (p2 == 0) {
                $("#prev_" + id).addClass("none");
            } else {
                $("#prev_" + id).removeClass("none");
            }
            if (imageChildren[newLastImage + 1]) {
                $("#next_" + id).removeClass("none");
            } else {
                $("#next_" + id).addClass("none");
            }
            $('#' + HomeSlider.idPrefix + boxId).slide({
                duration: 200,
                direction: true,
                start: p1,
                reverse: false,
                end: p2,
                callback: function () {
                    HomeSlider.clickable = true;
                }
            });
        }
    },
    next: function (boxId) {
        HomeSlider.slide(boxId, true);
    },
    prev: function (boxId) {
        HomeSlider.slide(boxId, false);
    },
    parseId: function (id) {
        var idArr = id.split("_");
        return idArr[1];
    },
    initCharts: function (o) {
        var imageOnScreen = HomeSlider.getImageOnScreen(o, true);
        o.attr('lastImage', parseInt(imageOnScreen.lastBoundImage.attr("img_index"), 10));
        for (var i = 0; i < imageOnScreen.onScreenImage.length; i++) {
            var image = imageOnScreen.onScreenImage[i];
            if (image) {
                var originalImage = image.attr("_src");
                var currentImage = image.attr("src");
                if (originalImage && originalImage != currentImage) {
                    image.attr("src", originalImage);
                }
            }
        }
    },
    init: function () {
        var el = $('._page');
        for (var ii = 0; ii < el.length; ii++) {
            var o = $(el[ii]);
            var imageOnScreen = HomeSlider.getImageOnScreen(o, true);
            for (var i = 0; i < imageOnScreen.onScreenImage.length; i++) {
                var image = imageOnScreen.onScreenImage[i];
                if (image) {
                    var originalImage = image.attr("_src");
                    var currentImage = image.attr("src");
                    if (originalImage && originalImage != currentImage) {
                        image.attr("src", originalImage);
                    }
                }
            }
            var idArr = (o.attr("id")).split("_");
            var id = idArr[2];
            if (imageOnScreen.firstImage.offset().left <= imageOnScreen.firstBoundImage.offset().left) {
                $("#prev_" + id).addClass("none");
            } else {
                $("#prev_" + id).removeClass("none");
            }
            if (imageOnScreen.lastImage.offset().left > imageOnScreen.lastBoundImage.offset().left) {
                $("#next_" + id).removeClass("none");
            } else {
                $("#next_" + id).addClass("none");
            }
            o.attr('lastImage', parseInt(imageOnScreen.lastBoundImage.attr("img_index"), 10));
        }
        ;
    },
    resize: function () {
        var oldItemPerPage = CommonScreen.itemPerPage
        var currentScreenProperties = CommonScreen.getScreenProperties();
        var currentItemPerPage = currentScreenProperties.itemPerPage;
        var delta = currentItemPerPage - oldItemPerPage;
        var el = $("._page");
        for (var i = 0; i < el.length; i++) {
            var pageObj = $(el[i]);
            var boxType = typeof (pageObj.attr("boxtype")) != 'undefined' ? parseInt(pageObj.attr("boxtype"), 10) : 0;
            var total = typeof (pageObj.attr("total")) != 'undefined' ? parseInt(pageObj.attr("total"), 10) : 0;
            var itemChange = HomeSlider.getItemChange(delta, boxType);
            var itemOnPage = HomeSlider.getItemChange(currentItemPerPage, boxType);
            var lastImage = parseInt(pageObj.attr("lastImage"), 10);
            var newLastImage = lastImage + itemChange;
            if (newLastImage < 0) {
                newLastImage = 0;
            }
            pageObj.attr('lastImage', newLastImage);
            var imageChildren = pageObj.find("._slideimg");
            if (delta > 0) {
                for (var i = lastImage; i <= newLastImage; i++) {
                    var image = $(imageChildren[i]);
                    if (image) {
                        var originalImage = image.attr("_src");
                        var currentImage = image.attr("src");
                        if (originalImage && originalImage != currentImage) {
                            image.attr("src", originalImage);
                        }
                    }
                }

            }
            var idArr = (pageObj.attr("id")).split("_");
            var id = idArr[2];
            var leftPos = $(imageChildren[0]).offset().left;
            if (leftPos > 0) {
                $("#prev_" + id).addClass("none");
            } else {
                $("#prev_" + id).removeClass("none");
            }
            if (imageChildren[newLastImage + 1]) {
                $("#next_" + id).removeClass("none");
            } else {
                $("#next_" + id).addClass("none");
            }
        }
        ;
    }
};

$(document).ready(function () {
    CommonScreen.init();
    HomeSlider.init();
    if ($('._next').size()) {
        $(window).resize(function () {
            HomeSlider.resize();
            CommonScreen.init();
        });
    }
    $('._next').click(function (event) {
        var id = $(this).attr("id");
        var boxId = HomeSlider.parseId(id);
        HomeSlider.next(boxId);
        return false;
    });
    $('._prev').click(function (event) {
        var id = $(this).attr("id");
        var boxId = HomeSlider.parseId(id);
        HomeSlider.prev(boxId);
        return false;
    });
});
});

