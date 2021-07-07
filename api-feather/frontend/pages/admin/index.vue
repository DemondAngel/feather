<template>
  <div>
    <div class="display-6">Información General</div>
    <div class="mb-3 mt-3 row">
      <label class="col-sm-2 col-form-label">Nombre</label>
      <label class="col-sm-10 col-form-label">{{ user.username }}</label>
    </div>
    <div class="mb-3 row">
      <label class="col-sm-2 col-form-label">Email</label>
      <label class="col-sm-10 col-form-label">{{ user.email }}</label>
    </div>
    <button class="btn btn-outline-secondary mb-4">Editar Información</button>

    <div class="display-6">Productos Favoritos</div>
    <ProductsView :products="user.favoriteProducts" class="my-4"></ProductsView>
    <button @click.prevent="logout" class="btn btn-comp5 text-white">
      <i class="fas fa-sign-out-alt"></i>
      Cerrar Sesión
    </button>
  </div>
</template>

<script>
import { onLogout } from '../../src/vue-apollo'
import { mapMutations } from 'vuex'
import { getUser } from '../../API/users'
import { tc } from '../../static/try-catch-helper'

export default {
  async asyncData() {
    const { id } = JSON.parse(localStorage.getItem('user'))
    const [user] = await tc(getUser(id))
    return { user }
  },
  methods: {
    ...mapMutations({ checkLog: 'checkStatusLog' }),
    async logout() {
      await onLogout()
      this.checkLog()
      await this.$router.push({ name: 'index' })
    },
  },
}
</script>
