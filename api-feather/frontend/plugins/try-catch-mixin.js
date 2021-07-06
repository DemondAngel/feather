import Vue from 'vue'

if (!Vue.try_catch_mixin) {
  Vue.try_catch_mixin = true
  Vue.mixin({
    methods: {},
  })
}
