import { Core } from '@unseenco/taxi'
import TransitionDefault from './transitions/default'
import TransitionHomeToRealisation from './transitions/home-to-realisation'
import TransitionSwitchRealisation from './transitions/switch-realisation'

export default () => {
    const options = {
        links: 'a:not([target]):not([href^=\\#]):not([data-taxi-ignore]):not([download])',
        transitions: {
            default: TransitionDefault,
            homeToRealisation: TransitionHomeToRealisation,
            switchRealisation: TransitionSwitchRealisation
        }
    }

    const taxi = new Core( options )

    taxi.addRoute('/realisations/.*', '/', 'default')
    taxi.addRoute('/', '/realisations/.*', 'homeToRealisation')
    taxi.addRoute('/realisations/.*', '/realisations/.*', 'switchRealisation')
}