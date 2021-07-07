export const state = () => ({
  isLogged: false,
  cart: [],
})

export const mutations = {
  checkStatusLog(state) {
    state.isLogged = !!window.localStorage.getItem('apollo-token')
  },
  addItemToCart(state, payload) {
    const item = { ...payload, quantity: 1 }
    let itemIncluded = state.cart.find(product => product.id === payload.id)
    if (itemIncluded) itemIncluded.quantity += 1
    else state.cart.push(item)
  },
  removeCartItem(state, productId) {
    const itemIdx = state.cart.findIndex(product => product.id === productId)
    state.cart.splice(itemIdx, 1)
  },
  editCartItem(state, { productId, quantity }) {
    const item = state.cart.find(item => item.id === productId)
    item.quantity = quantity
  },
}

export const getters = {
  isLogged(state) {
    return state.isLogged
  },
  getCart(state) {
    return state.cart
  },
}
