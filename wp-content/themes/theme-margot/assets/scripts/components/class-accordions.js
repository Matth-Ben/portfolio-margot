class Accordion
{
    constructor( element )
    {
        this.element = element
        this.header = this.element.querySelector( '.accordion__header' )
        this.wrapper = this.element.closest( '.accordions' )
        this.one_by_one = this.wrapper ? this.wrapper.classList.contains( 'one-by-one' ) : false
        this.init()
    }

    init()
    {
        this.element.addEventListener( 'click', () => {

            if ( this.one_by_one && !this.element.classList.contains( 'active' ) ) {
                this.wrapper.querySelectorAll( '.accordion' ).forEach( accordion => accordion.classList.remove( 'active' ) )
            }

            this.element.classList.toggle( 'active' )
        } )
    }
}

export default Accordion