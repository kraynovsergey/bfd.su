import Lenis from '@studio-freight/lenis';
import SplitType from 'split-type';
import gsap from "gsap";
import { Fancybox } from "@fancyapps/ui";
import $ from 'jquery';
import ripples from 'jquery.ripples';
import AOS from 'aos';
//import Rellax from 'rellax';
import Matter from 'matter-js';
import jqueryMarqueeMin from 'jquery.marquee';
import Swiper from 'swiper';
import { Navigation } from "swiper/modules";

/* Прелоадер */
function preloader() {
    let preloader = $('.preloader'),
        imagesCount = $('img').length,
        //dBody = $('body'),
        percent = 100 / imagesCount,
        progress = 0,
        loadedImg = 0;

    /*if (imagesCount > 0) {
        //dBody.css('overflow', 'hidden');
        for (let i = 0; i < imagesCount; i++) {
            let imgCopy = new Image();
            imgCopy.src = document.images[i].src;
            imgCopy.onload = imgLoad;
            imgCopy.onerror = imgLoad;
        }

        function imgLoad() {
            progress += percent;
            loadedImg++;
            if (progress >= 100 || loadedImg == imagesCount) {
                $('.preloader__progress').css('width', progress + '%');
                $('.preloader__percent').html(progress.toFixed(0));

                setTimeout(() => {
                    preloader.addClass('_hide');

                    AOS.init({
                        duration: 800
                    });
                }, 500);
            }
        }
    } else {
        $('.preloader__percent').html('100');
        $('.preloader__progress').css('width', '100%');

        setTimeout(() => {
            preloader.addClass('_hide');

            AOS.init({
                duration: 800
            });
        }, 500);
    }*/

    let i = 0;

    let preloader_interval = setInterval(() => {
        i++;

        if ( i < 101) {
            $('.preloader__percent').html(i);
            $('.preloader__progress').css('width', i+'%');
        } else {
            preloader.addClass('_hide');

            AOS.init({
                duration: 800
            });

            clearInterval(preloader_interval);
        }
    //}, 5);
    }, 1);
}

preloader();

/* Lenis */
const lenis = new Lenis();

/* Плавный скролл */
function raf(time) {
    lenis.raf(time);
    requestAnimationFrame(raf);
}

requestAnimationFrame(raf);

/* Стандартный набор */
import * as flsFunctions from "./modules/functions.js";

flsFunctions.isWebp();
flsFunctions.phone_mask();
flsFunctions.privacy_policy();

/* Fancybox */
Fancybox.bind("[data-fancybox]", {});

/* Разделение текста на слова и символы */
new SplitType('[data-split-words-chars]', {
    types: 'words, chars',
    tagName: 'span'
});

/* Разделение текста на строки */
const lines = new SplitType('[data-split-lines]', {
    types: 'lines',
    tagName: 'span'
});

/*if (lines.isSplit) {
    const lines_line = document.querySelectorAll('[data-split-lines] .line');
    if ( lines_line.length > 0 ) {
        lines_line.forEach(item => {
            let wrapper;
            wrapper = document.createElement('span');
            wrapper.classList.add('extra-split-line');
            item.parentNode.insertBefore(wrapper, item);
            wrapper.appendChild(item);
        });
    }
}*/

/* Посимвольная анимация */
const animation_chars = document.querySelectorAll('.animation-chars');
if (animation_chars.length > 0) {
    let mm = gsap.matchMedia();
    mm.add("(min-width: 992px)", () => (animation_chars_func(), () => { }));

    function animation_chars_func() {
        animation_chars.forEach(item => {
            let o = item.querySelectorAll('.animation-chars__title:first-child .char'),
                t = item.querySelectorAll('.animation-chars__title:last-child .char'),
                i = gsap.timeline({
                    paused: !0,
                    defaults: {
                        duration: 0.6,
                        ease: "power4.inOut",
                    },
                });

            i.to(o, {
                y: "-100%",
                stagger: {
                    each: 0.03,
                },
            }),
                i.from(t, {
                    y: "100%",
                    stagger: {
                        each: 0.03,
                    },
                }, 0.1),
                item.addEventListener('mouseenter', () => {
                    i.isActive() || i.restart();
                });
        });
    }
}

/* Прозрачность при скролле */
const scroll_opacity = document.querySelector('[data-scroll-opacity]');
if (scroll_opacity) {
    lenis.on('scroll', (e) => {
        scroll_opacity.style.opacity = 1 - (e.animatedScroll / scroll_opacity.clientHeight);
    });
}

/* Волны */
$(document).ready(function () {
    $('[data-ripples-img]').ripples({
        imageUrl: $('[data-ripples-img]').attr('data-ripples-img'),
        perturbance: 0.04,
        dropRadius: 20,
        resolution: 512
    });

    /* Волны просто при скролле */
    const ripples_block = document.querySelector('[data-ripples-img]');
    if (ripples_block) {
        const ripples_block_position = ripples_block.getBoundingClientRect();

        let ripples_block_mouse_x = 0,
            ripples_block_mouse_y = 0;

        ripples_block.addEventListener('mousemove', (e) => {
            ripples_block_mouse_x = e.pageX;
            ripples_block_mouse_y = e.pageY;
        })

        lenis.on('scroll', (e) => {
            if (e.animatedScroll < ripples_block_position.bottom) {
                $('[data-ripples-img]').ripples('drop', ripples_block_mouse_x, ripples_block_mouse_y + e.animatedScroll, 20, 0.04);
            }
        });
    }
});

/* Анимация круглых кнопок */
const btn_circle = document.querySelectorAll('.btn-custom');
if (btn_circle.length > 0) {
    btn_circle.forEach(item => {
        let bg = item.querySelector('.btn-custom__bg');

        item.addEventListener('mouseenter', (e) => {
            btn_circle_func(item, e);

            if (bg) {
                bg.classList.remove('desplode-circle');
                bg.classList.add('explode-circle');
            }
        });

        item.addEventListener('mouseleave', (e) => {
            btn_circle_func(item, e);

            if (bg) {
                bg.classList.add('desplode-circle');
                bg.classList.remove('explode-circle');
            }
        });
    });

    function btn_circle_func(item, e) {
        let parentOffset = $(item).offset(),
            relX = e.pageX - parentOffset.left,
            relY = e.pageY - parentOffset.top,
            bg = item.querySelector('.btn-custom__bg');

        if (bg) {
            bg.style.left = relX + 'px';
            bg.style.top = relY + 'px';
        }
    }
}

/* Магнитные кнопки */
const magnets = document.querySelectorAll('[data-magnetic]');
if (magnets.length > 0) {
    if (window.innerWidth > 991) {
        magnets.forEach((magnet) => {
            magnet.addEventListener('mousemove', moveMagnet);
            magnet.addEventListener('mouseleave', function (event) {
                gsap.to(event.currentTarget, 1.5, {
                    x: 0,
                    y: 0,
                    ease: "Elastic.easeOut"
                });
                gsap.to($(this).find("[data-magnetic-text]"), 1.5, {
                    x: 0,
                    y: 0,
                    ease: "Elastic.easeOut"
                });
            });
        });

        function moveMagnet(event) {
            var magnetButton = event.currentTarget;
            var bounding = magnetButton.getBoundingClientRect();
            var magnetsStrength = 100;
            var magnetsStrengthText = 50;

            gsap.to(magnetButton, 1.5, {
                x: (((event.clientX - bounding.left) / magnetButton.offsetWidth) - 0.5) * magnetsStrength,
                y: (((event.clientY - bounding.top) / magnetButton.offsetHeight) - 0.5) * magnetsStrength,
                rotate: "0.001deg",
                ease: "Power4.easeOut"
            });
            gsap.to($(this).find("[data-magnetic-text]"), 1.5, {
                x: (((event.clientX - bounding.left) / magnetButton.offsetWidth) - 0.5) * magnetsStrengthText,
                y: (((event.clientY - bounding.top) / magnetButton.offsetHeight) - 0.5) * magnetsStrengthText,
                rotate: "0.001deg",
                ease: "Power4.easeOut"
            });
        }
    };
}

/* Параллакс при скроле */
if ( document.querySelectorAll('.rellax').length > 0 ) {
    //const rellax = new Rellax('.rellax');
}

/* Раскрытие кейсов по клику */
const cases = document.querySelectorAll('[data-case]');
if (cases.length > 0) {
    window.addEventListener('load', () => {
        cases.forEach(item => {
            if (item.classList.contains('_active')) {
                item.querySelector('[data-case-content]').style.height = item.querySelector('[data-case-content-height]').offsetHeight + 'px';
            }

            item.addEventListener('click', () => {
                cases_func(item, cases);    
            });
        });
    });

    function cases_func(item, cases) {
        if (item.classList.contains('_active')) {
            item.classList.remove('_active');
            item.querySelector('[data-case-content]').style.height = '0px';
        } else {
            cases.forEach(el => {
                el.classList.remove('_active');
                el.querySelector('[data-case-content]').style.height = '0px';
            })
    
            item.classList.add('_active');
            item.querySelector('[data-case-content]').style.height = item.querySelector('[data-case-content-height]').offsetHeight + 'px';
        }
    }
}

/* Раскрытие кейсов по наведению */
const cases_hover = document.querySelectorAll('[data-case-hover]');
if (cases_hover.length > 0) {
    window.addEventListener('resize', () => {
        if ( window.innerWidth > 991 ) {
            cases_hover.forEach(item => {
                item.addEventListener('mouseenter', () => {
                    cases_func(item, cases_hover);    
                });
            });
        } else {
            cases_hover.forEach(item => {
                item.addEventListener('click', () => {
                    cases_func(item, cases_hover);    
                });
            });
        }
    });

    window.addEventListener('load', () => {
        if ( window.innerWidth > 991 ) {
            cases_hover.forEach(item => {
                item.addEventListener('mouseenter', () => {
                    cases_func(item, cases_hover);    
                });
            });
        } else {
            cases_hover.forEach(item => {
                item.addEventListener('click', () => {
                    cases_func(item, cases_hover);    
                });
            });
        }
    });

    function cases_func(item, cases_hover) {
        cases_hover.forEach(el => {
            el.classList.remove('_active');
            el.querySelector('[data-case-content]').style.height = '0px';
        })

        item.classList.add('_active');
        item.querySelector('[data-case-content]').style.height = item.querySelector('[data-case-content-height]').offsetHeight + 'px';
    }
}

/*const cursor = document.querySelector('[data-cursor]');
if ( cursor ) {
    let posX = 0,
        posY = 0,
        mouseX = 0,
        mouseY = 0;

    setInterval(function () {
        posX += (mouseX - posX) / 9;
        posY += (mouseY - posY) / 9;

        gsap.set(cursor, {
            css: {
                left: posX,
                top: posY
            }
        });
    }, 15);

    document.querySelector('body').addEventListener('mousemove', e => {
        mouseX = e.pageX;
        mouseY = e.pageY;
    });
}*/


/* 100vh на мобильных устройствах */
const full_height = document.querySelectorAll('[data-100vh]');
if (full_height.length > 0) {
    full_height.forEach(item => {
        window.addEventListener("DOMContentLoaded", () => {
            full_height_func(item);
        });
    });

    function full_height_func(item) {
        let vh = window.innerHeight * 0.01 * 100;
        item.style.minHeight = vh + 'px';    
    }
}

/* Matter JS */
const matter_wrap = document.querySelector('[data-matter]');
if (matter_wrap) {
    const Engine = Matter.Engine,
    Render = Matter.Render,
    Runner = Matter.Runner,
    Composites = Matter.Composites,
    Common = Matter.Common,
    MouseConstraint = Matter.MouseConstraint,
    Mouse = Matter.Mouse,
    Composite = Matter.Composite,
    Bodies = Matter.Bodies;

    const engine = Engine.create(),
        world = engine.world;

    const render = Render.create({
        element: matter_wrap,
        engine: engine,
        options: {
            width: matter_wrap.clientWidth,
            height: matter_wrap.clientHeight,
            showAngleIndicator: false,
            wireframes: false,
            background: '#0B0918'
        }
    });

    Render.run(render);

    var runner = Runner.create();
    Runner.run(runner, engine);

    
    let screen_scale = () => {
        if (document.documentElement.clientWidth < 576) return (document.documentElement.clientWidth / 1920) * 1.5;
            else return document.documentElement.clientWidth / 1920;
    }

    let add_sprite = ($width, $height, $svg) => {
        return Bodies.rectangle(matter_wrap.clientWidth * Math.random(), matter_wrap.clientHeight * Math.random(), $width * screen_scale(), $height * screen_scale(), {
            density: 0.0005,
            frictionAir: 0.06,
            restitution: 0.3,
            friction: 0.01,
            chamfer: {
                radius: $height * screen_scale() / 2
            },
            render: {
                sprite: {
                    texture: matter_wrap.getAttribute('data-matter-path') + $svg,
                    xScale: screen_scale(),
                    yScale: screen_scale()
                }
            }
        });
    }

    Composite.add(world, [
        Bodies.rectangle(matter_wrap.clientWidth / 2, 0, matter_wrap.clientWidth, 1, { isStatic: true }),
        Bodies.rectangle(matter_wrap.clientWidth / 2, matter_wrap.clientHeight, matter_wrap.clientWidth, 1, { isStatic: true }),
        Bodies.rectangle(matter_wrap.clientWidth, matter_wrap.clientHeight / 2, 1, matter_wrap.clientHeight, { isStatic: true }),
        Bodies.rectangle(0, matter_wrap.clientHeight / 2, 1, matter_wrap.clientHeight, { isStatic: true }),
        add_sprite(197, 69, 'php.svg'),
        add_sprite(197, 69, 'css.svg'),
        add_sprite(279, 70, 'laravel.svg'),
        add_sprite(232, 70, 'modx.svg'),
        add_sprite(296, 69, 'angular.svg'),
        add_sprite(358, 69, 'wordpress.svg'),
        add_sprite(195, 69, 'sql.svg'),
        add_sprite(348, 69, 'bitrix.svg'),
        add_sprite(331, 69, 'javascript.svg'),
        add_sprite(197, 69, 'vue.svg'),
        add_sprite(272, 70, 'python.svg'),
        add_sprite(244, 70, 'react.svg'),
        add_sprite(300, 70, 'symfony.svg')
    ]);

    const stack = Composites.stack(20, 20, 1, 1, 0, 0, function(x, y) {
        add_sprite(300, 70, 'symfony.svg')
    });

    Composite.add(world, stack);

    const mouse = Mouse.create(render.canvas),
        mouseConstraint = MouseConstraint.create(engine, {
            mouse: mouse,
            constraint: {
                stiffness: 0.2,
                render: {
                    visible: false
                }
            }
        });

    Composite.add(world, mouseConstraint);
    render.mouse = mouse;
}

/* Бегущие строки */
$(document).ready(function() { 
    $('.marquee').marquee({
        duplicated: true,
        gap: 0
    });
});

/* Выбранный файл */
const file_name = document.querySelectorAll('[data-file-name]');
if (file_name.length > 0) {
    file_name.forEach(item => {
        item.addEventListener('change', () => {
            let target = item.nextElementSibling.querySelector('span');
            if ( target ) {
                target.innerHTML = item.files.item(0).name;
            }
        });
    });
}

/* Фильтр */
const filter_reset = document.querySelectorAll('[data-filter-reset]');
if (filter_reset.length > 0) {
    filter_reset.forEach(item => {
        item.addEventListener('click', () => {
            let inputs = item.closest('[data-filter-fieldset]').querySelectorAll('input[type="radio"]'),
                btn_submit = item.closest('form').querySelector('button[type="submit"]');
            if (inputs.length > 0) {
                inputs.forEach(input => {
                    input.checked = false;

                    if (input.hasAttribute('data-first')) input.checked = true;
                });
            }
            item.classList.remove('_active');

            if (btn_submit) btn_submit.click();
        });
    });
}

const filter_fieldset = document.querySelectorAll('[data-filter-fieldset]');
if (filter_fieldset.length > 0) {
    filter_fieldset.forEach(item => {
        let inputs = item.querySelectorAll('input[type="radio"]'),
            btn_reset = item.querySelector('[data-filter-reset]');

        if (inputs.length > 0) {
            inputs.forEach(input => {
                input.addEventListener('change', () => {
                    btn_reset.classList.add('_active');
                    inputs.forEach(el => {
                        if ( (el.checked === true) && (el.hasAttribute('data-first')) ) btn_reset.classList.remove('_active');
                    });
                }); 
            });
        }
    });
}

/* Слайдер сотрудников */
const swiper_team = document.querySelector('[data-swiper-team]');
if (swiper_team) {
    new Swiper(swiper_team, {
        modules: [Navigation],
        speed: 1000,
        navigation: {
            prevEl: document.querySelector('[data-swiper-team-prev]'),
            nextEl: document.querySelector('[data-swiper-team-next]')
        },
        breakpoints: {
            0: {
                slidesPerView: 1.2,
                spaceBetween: 10
            },
            767: {
                slidesPerView: 2.5,
                spaceBetween: 10
            },
            1280: {
                slidesPerView: 3.1,
                spaceBetween: 17
            },
            1440: {
                slidesPerView: 3.9,
                spaceBetween: 30
            }
        }
    });
}

/* Слайдер крупных клиентов */
const swiper_clients = document.querySelector('[data-swiper-clients]');
if (swiper_clients) {
    new Swiper(swiper_clients, {
        speed: 1000,
        breakpoints: {
            0: {
                enabled: true,
                slidesPerView: 1.2,
                spaceBetween: 5,
            },
            576: {
                spaceBetween: 0,
                enabled: false
            }
        }
    });
}

/* Слайдер цифр */
const swiper_numbers = document.querySelector('[data-swiper-numbers]');
if (swiper_numbers) {
    new Swiper(swiper_numbers, {
        speed: 1000,
        breakpoints: {
            0: {
                enabled: true,
                slidesPerView: 1.4,
                spaceBetween: 5,
            },
            576: {
                spaceBetween: 0,
                enabled: false
            }
        }
    });
}

/* Планируемый бюджет */
const budget = document.querySelector('[data-budget]');
if (budget) {
    budget.addEventListener('click', () => {
        budget.classList.toggle('_show');
    });
}

const budget_inputs = document.querySelectorAll('[data-budget-input]');
if (budget_inputs) {
    budget_inputs.forEach(budget_input => {
        budget_input.addEventListener('change', () => {
            if (budget) {
                budget.classList.remove('_show');

                if (budget_input.checked) {
                    budget.classList.add('_active');
                    budget.innerHTML = budget_input.value;
                }
            }
        });
    });
}

function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; } const cursor = document.getElementById("cursor");
const amount = 20;
const sineDots = Math.floor(amount * 0.3);
const width = 26;
const idleTimeout = 150;
let lastFrame = 0;
let mousePosition = { x: 0, y: 0 };
let dots = [];
let timeoutID;
let idle = false;

class Dot {
    constructor(index = 0) {
        this.index = index;
        this.anglespeed = 0.05;
        this.x = 0;
        this.y = 0;
        this.scale = 1 - 0.05 * index;
        this.range = width / 2 - width / 2 * this.scale + 2;
        this.limit = width * 0.75 * this.scale;
        this.element = document.createElement("span");
        gsap.set(this.element, { scale: this.scale });
        cursor.appendChild(this.element);
    }

    lock() {
        this.lockX = this.x;
        this.lockY = this.y;
        this.angleX = Math.PI * 2 * Math.random();
        this.angleY = Math.PI * 2 * Math.random();
    }

    draw(delta) {
        if (!idle || this.index <= sineDots) {
            gsap.set(this.element, { x: this.x, y: this.y });
        } else {
            this.angleX += this.anglespeed;
            this.angleY += this.anglespeed;
            this.y = this.lockY + Math.sin(this.angleY) * this.range;
            this.x = this.lockX + Math.sin(this.angleX) * this.range;
            gsap.set(this.element, { x: this.x, y: this.y });
        }
    }
}

function init() {
    window.addEventListener("mousemove", onMouseMove);
    window.addEventListener("touchmove", onTouchMove);
    lastFrame += new Date();
    buildDots();
    render();
}

function startIdleTimer() {
    timeoutID = setTimeout(goInactive, idleTimeout);
    idle = false;
}

function resetIdleTimer() {
    clearTimeout(timeoutID);
    startIdleTimer();
}

function goInactive() {
    idle = true;
    for (let dot of dots) {
        dot.lock();
    }
}

function buildDots() {
    for (let i = 0; i < amount; i++) {
        let dot = new Dot(i);
        dots.push(dot);
    }
}

const onMouseMove = event => {
    mousePosition.x = event.clientX - width / 2;
    mousePosition.y = event.clientY - width / 2;
    resetIdleTimer();
};

const onTouchMove = () => {
    mousePosition.x = event.touches[0].clientX - width / 2;
    mousePosition.y = event.touches[0].clientY - width / 2;
    resetIdleTimer();
};

const render = timestamp => {
    const delta = timestamp - lastFrame;
    positionCursor(delta);
    lastFrame = timestamp;
    requestAnimationFrame(render);
};

const positionCursor = delta => {
    let x = mousePosition.x;
    let y = mousePosition.y;
    dots.forEach((dot, index, dots) => {
        let nextDot = dots[index + 1] || dots[0];
        dot.x = x;
        dot.y = y;
        dot.draw(delta);
        if (!idle || index <= sineDots) {
            const dx = (nextDot.x - dot.x) * 0.35;
            const dy = (nextDot.y - dot.y) * 0.35;
            x += dx;
            y += dy;
        }
    });
};

init();

document.addEventListener('fetchit:success', (e) => { 
    Fancybox.close();
    
    setTimeout(() => { 
        Fancybox.show([{ src: "#modal-thankyou", type: "inline" }]);
    }, 500);
});