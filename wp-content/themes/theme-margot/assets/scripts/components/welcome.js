import gsap from 'gsap'

export default ( () =>
{
    document.addEventListener( 'DOMContentLoaded', () => {
        if ( document.body.classList.contains( 'welcome' ) ) {
            const welcome = document.querySelector( 'body > .welcome' )
            const content = welcome.querySelector('.welcome-content')
            const percentage = welcome.querySelector('.percentage')
            const number = welcome.querySelector('.percentage span')
            const title = welcome.querySelector('.welcome-title') 

            setTimeout(() => {
                gsap.fromTo(content, {
                    width: 0
                }, {
                    width: '20%',
                    duration: 0.8
                })

                number.innerText = 20
                gsap.from(number, {
                    innerText: 0,
                    duration: 0.8,
                    snap: {
                        innerText: 1
                    }
                })
            }, 1200)
            setTimeout( () => {
                gsap.fromTo(content, {
                    width: '20%'
                }, {
                    width: '80%',
                    duration: 0.8
                })

                number.innerText = 80
                gsap.from(number, {
                    innerText: 20,
                    duration: 0.8,
                    snap: {
                        innerText: 1
                    }
                })
            }, 2000 )
            setTimeout( () => {
                gsap.fromTo(content, {
                    width: '80%'
                }, {
                    width: '100%',
                    duration: 0.8
                })

                number.innerText = 100
                gsap.from(number, {
                    innerText: 80,
                    duration: 0.8,
                    snap: {
                        innerText: 1
                    },
                    onComplete: () => {
                        gsap.to(title, {
                            marginTop: 'auto',
                            duration: 0.8
                        })
                        gsap.to(percentage, {
                            bottom: '-10rem',
                            duration: 0.8
                        })
                        setTimeout( () => {
                            welcome.classList.add( 'hide' )
                        }, 900 )
                        setTimeout( () => {            
                            document.dispatchEvent( new CustomEvent( 'ContentLoaded' ) )
                        }, 900 )
                    }
                })
            }, 3000 )
        }
    } )
} )()
