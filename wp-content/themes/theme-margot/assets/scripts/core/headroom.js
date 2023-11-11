import gsap from 'gsap';
export default class Menu {
    constructor() {
        this.getElems()
        
        if (window.innerWidth < 1024) {
            this.initMobile()
        } else {
            this.init()
        }

        this.addEvents()
    }

    getElems() {
        this.$header = document.querySelector('.header')
        this.$menu = this.$header.querySelector('.menu')
        this.$menuList = this.$header.querySelector('.menu--list')
        this.$menuBurger = this.$header.querySelector('.menu--burger')
        this.$background = this.$header.querySelector('.header--background')
        this.$submenus = this.$header.querySelectorAll('.menu--dropdown-contain')
        this.$itemsDropdown = this.$menu.querySelectorAll('.menu--dropdown')
        this.$linksDropdown = this.$menu.querySelectorAll('.menu--dropdown-link')
        this.$imageDefault = this.$menu.querySelector('.menu--dropdown-image--default')
        this.currentSubMenu = 0
        this.menuOpen = false
        this.submenuIsOpen = false
        this.isAnimating = false
    }

    init() {
        gsap.set(this.$submenus, {
            yPercent: -100,
            stagger: 0.01
        })
        
        gsap.set(this.$linksDropdown, {
            yPercent: 100,
            opacity: 0,
            stagger: 0.01
        })
        
        gsap.set(this.$imageDefault, {
            yPercent: 50,
            opacity: 0
        })
    }

    initMobile() {
        gsap.set(this.$submenus, {
            yPercent: 0,
            height: 0,
            marginTop: 0,
            stagger: 0.01
        })
        
        gsap.set(this.$linksDropdown, {
            yPercent: 0,
            opacity: 1,
            stagger: 0.01
        })
        
        gsap.set(this.$menuList, {
            xPercent: 100
        })
    }
    
    addEvents() {
        this.$itemsDropdown.forEach((item, i) => {
            item.addEventListener('click', () => { this.toggleDropdown(item, i) })
        });

        this.$background.addEventListener('click', () => {
            if (this.submenuIsOpen) {
                this.submenuClose(this.$itemsDropdown[this.currentSubMenu])                
                this.submenuIsOpen = false
            }
        })

        this.$menuBurger.addEventListener('click', () => { this.toggle() })

        this.onPageChange(window.location.href)

        window.addEventListener("resize", function(){
            if (window.innerWidth < 1024) {
                this.initMobile()
            } else {
                this.init()
            }
        });
    }

    toggle() {
        if (!this.isAnimating) {
            this.isAnimating = true
            this.$header.classList.toggle('active')
            this.$menuBurger.classList.toggle('active')
    
            if (this.menuOpen) {
                gsap.to(this.$menuList, {
                    xPercent: 100,
                    onComplete: () => {
                        this.menuOpen = false
                        this.isAnimating = false
                    }
                })
            } else {                
                gsap.to(this.$menuList, {
                    xPercent: 0,
                    onComplete: () => {
                        this.menuOpen = true
                        this.isAnimating = false
                    }
                })
            }   
        }
    }

    toggleDropdown(item, index) {
        this.currentSubMenu = index
        
        if (this.submenuIsOpen) {
            this.submenuClose(item)
            this.submenuIsOpen = false
        } else {
            this.submenuOpen(item)
            this.submenuIsOpen = true
        }
    }

    submenuOpen(item) {
        this.submenu = item.parentNode.querySelector('.menu--dropdown-contain')

        if (window.innerWidth < 1024) {
            gsap.to(this.submenu, {
                yPercent: 0,
                height: this.submenu.querySelector('.menu--dropdown-list').offsetHeight + 'px',
                marginTop: 30,
            })
        } else {
            this.$header.classList.add('active')
            item.parentNode.classList.add('active')
    
            gsap.to(this.submenu, {
                yPercent: 0,
                duration: 0.8,
                onComplete: () => {
                    gsap.to(item.parentNode.querySelectorAll('.menu--dropdown-link'), {
                        yPercent: 0,
                        opacity: 1,
                        stagger: 0.06
                    })
    
                    gsap.to(this.$imageDefault, {
                        yPercent: 0,
                        opacity: 1
                    })
                }
            })
        }
    }

    submenuClose(item) {
        this.submenu = item.parentNode.querySelector('.menu--dropdown-contain')

        if (window.innerWidth < 1024) {
            gsap.to(this.submenu, {
                yPercent: 0,
                height: 0,
                marginTop: 0,
            })
        } else {
            this.$header.classList.remove('active')
            item.parentNode.classList.remove('active')
            gsap.to(item.parentNode.querySelectorAll('.menu--dropdown-link'), {
                yPercent: 100,
                opacity: 0,
                stagger: 0.06
            })
    
            gsap.to(this.$imageDefault, {
                yPercent: 50,
                opacity: 0,
                onComplete: () => {
                    gsap.to(this.submenu, {
                        yPercent: -100,
                        duration: 0.8
                    })
                }
            })
        }
    }

    onPageChange(loc) {
        if (this.submenuIsOpen) {
            this.submenuClose(this.currentSubMenu)
            this.submenuIsOpen = false
        }
    }
}