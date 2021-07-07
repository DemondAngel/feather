import Vue from 'vue'
import VueTippy, { TippyComponent } from 'vue-tippy'

Vue.use(VueTippy, {
  arrow: true,
  distance: 10,
  size: 'large',
  maxWidth: 250,
  touchHold: true,
})
Vue.component('tippy', TippyComponent)
