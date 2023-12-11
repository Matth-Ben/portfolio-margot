import gsap from 'gsap';

class CoverRealisations {
    constructor( element )
    {
        this.$images = element.querySelectorAll('.bloc-gallery-mozaik--image')
        console.log(this.$images);
    }
}

export default CoverRealisations
