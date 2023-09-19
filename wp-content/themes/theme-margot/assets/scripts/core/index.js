import data from '../../../data.json'
import smoothScroll from './smooth-scroll'
import taxi from './taxi'
import headroom from './headroom'
import timelineAnimation from './timeline-animation'
import splitText from './split-text'
import parallax from './parallax'
import gridHelper from './grid-helper'
import scrollbarWidth from './scrollbar-width'

export default ( () => {
    window.data = data

    document.addEventListener( 'ContentLoaded', () => {
        taxi()
        headroom()
        splitText()
        timelineAnimation()
        smoothScroll()
        parallax()
        gridHelper()
        scrollbarWidth()
    } )
    
    document.addEventListener( 'NewContentLoaded', () => {
        splitText()
        timelineAnimation()
        parallax()
        scrollbarWidth()
    } )

    document.addEventListener( 'DOMContentLoaded', () => {

        if ( document.body.classList.contains( 'welcome' ) ) {
            return
        }

        document.dispatchEvent( new CustomEvent( 'ContentLoaded' ) )
    } )
} )()