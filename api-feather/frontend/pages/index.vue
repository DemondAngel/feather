<template>
  <div class="container my-md-5">
    <h1>Esto es una realidad</h1>
    <hr />
    <div class="btn-group-vertical">
      <button class="btn btn-primary">Button Primary</button>
      <button class="btn btn-secondary">Button Secondary</button>
      <button class="btn btn-comp1">Button Comp 1</button>
      <button class="btn btn-outline-comp1">Button Outline Comp 1</button>
      <button class="btn btn-comp2">Button Comp 2</button>
      <button class="btn btn-comp3">Button Comp 3</button>
      <button class="btn btn-comp4">Button Comp 4</button>
      <button class="btn btn-comp5">Button Comp 5</button>
      <button class="btn btn-grey">Button Grey</button>
      <button class="btn btn-dark" @click="getProducts">Button Dark</button>
    </div>

    <div class="alert alert-comp3 mt-4" role="alert">
      A simple secondary alert with <a href="#" class="alert-link">an example link</a>. Give it a
      click if you like.
    </div>

    <div class="alert alert-comp5" role="alert">
      <h4 class="alert-heading">Well done!</h4>
      <p>
        Aww yeah, you successfully read this important alert message. This example text is going to
        run a bit longer so that you can see how spacing within an alert works with this kind of
        content.
      </p>
      <hr />
      <p class="mb-0">
        Whenever you need to, be sure to use margin utilities to keep things nice and tidy.
      </p>
    </div>
  </div>
</template>

<script>
import { getProducts } from '@/API/products'
import { tc } from 'static/try-catch-helper'
import { SwalError, SwalLoading } from 'static/sweetalert'

export default {
  methods: {
    async getProducts() {
      SwalLoading('Obteniendo productos...')
      const [products, error] = await tc(getProducts())
      if (error) return SwalError('No se pudo obtener la info')
      console.log(products)
      this.$swal.close()
    },
  },
}
</script>
