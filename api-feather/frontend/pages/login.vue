<template>
  <div class="container mt-4">
    <h1 class="display-4">Incio de sesión</h1>
    <form class="mt-4" @submit.prevent="login">
      <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">Correo electrónico</label>
        <input
          type="email"
          class="form-control"
          id="exampleInputEmail1"
          aria-describedby="emailHelp"
          v-model="identifier"
        />
        <div id="emailHelp" class="form-text">Nunca compartiremos tu email con nadie más.</div>
      </div>
      <div class="mb-3">
        <label for="exampleInputPassword1" class="form-label">Contraseña</label>
        <input v-model="password" type="password" class="form-control" id="exampleInputPassword1" />
      </div>
      <div class="mb-3 form-check">
        <input type="checkbox" class="form-check-input" id="exampleCheck1" />
        <label class="form-check-label" for="exampleCheck1">Recuerdame</label>
      </div>
      <button type="submit" class="btn btn-secondary">Ingresar</button>
    </form>
  </div>
</template>

<script>
import { login } from '../API/users'
import { SwalError, SwalLoading } from '../static/sweetalert'
import { tc } from '../static/try-catch-helper'
import { onLogin } from '../src/vue-apollo'
import { mapMutations } from 'vuex'

export default {
  data: () => ({ password: '', identifier: '' }),
  methods: {
    ...mapMutations({ changeLog: 'checkStatusLog' }),
    async login() {
      SwalLoading()
      const identifier = { password: this.password, identifier: this.identifier }
      const [{ jwt, user }, error] = await tc(login(identifier))
      if (error) return SwalError('Hubo un error en el inicio de sesión.')
      await onLogin(jwt, user)
      this.changeLog()
      this.$swal.close()
      await this.$router.push({ name: 'admin' })
    },
  },
}
</script>
