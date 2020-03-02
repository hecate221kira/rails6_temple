import 'jquery'
import 'bootstrap/dist/js/bootstrap'

import('@rails/ujs').then( ujs => ujs.start() )
import('turbolinks').then( turbolinks => turbolinks.start() )
import('@rails/activestorage').then( activestorage => activestorage.start() )
import 'channels'

const images = require.context('images', true)
const imagePath = (name) => images(name, true)
