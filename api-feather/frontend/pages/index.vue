<template>
  <div class="container my-md-5">
    <div class="display-4">OBIO</div>

    <div id="carouselExampleIndicators" class="carousel slide mt-3" data-bs-ride="carousel">
      <div class="carousel-indicators">
        <button
          type="button"
          data-bs-target="#carouselExampleIndicators"
          data-bs-slide-to="0"
          class="active"
          aria-current="true"
          aria-label="Slide 1"
        ></button>
        <button
          type="button"
          data-bs-target="#carouselExampleIndicators"
          data-bs-slide-to="1"
          aria-label="Slide 2"
        ></button>
        <button
          type="button"
          data-bs-target="#carouselExampleIndicators"
          data-bs-slide-to="2"
          aria-label="Slide 3"
        ></button>
      </div>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img
            src="https://cdn.pixabay.com/photo/2021/06/21/03/08/blueberries-6352547__340.jpg"
            class="d-block w-100"
            alt="..."
          />
        </div>
        <div class="carousel-item">
          <img
            src="https://cdn.pixabay.com/photo/2021/06/30/04/18/wheats-6375839__340.jpg"
            class="d-block w-100"
            alt="..."
          />
        </div>
        <div class="carousel-item">
          <img
            src="https://cdn.pixabay.com/photo/2010/12/13/10/05/berries-2277__480.jpg"
            class="d-block w-100"
            alt="..."
          />
        </div>
      </div>
      <button
        class="carousel-control-prev"
        type="button"
        data-bs-target="#carouselExampleIndicators"
        data-bs-slide="prev"
      >
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button
        class="carousel-control-next"
        type="button"
        data-bs-target="#carouselExampleIndicators"
        data-bs-slide="next"
      >
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>

    <div class="display-6 mt-5">Lo mejor de lo mejor</div>
    <div class="mt-3 d-flex align-items-center justify-content-between">
      <div class="text-center">
        <img
          src="https://cdn.pixabay.com/photo/2014/06/16/23/10/spices-370114__340.jpg"
          class="rounded"
          alt="..."
        />
      </div>
      <div class="ms-4">
        <p class="mb-4">
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur deserunt,
          dignissimos distinctio doloribus, dolorum eius eos esse eveniet excepturi illo mollitia
          numquam officiis pariatur perspiciatis provident reprehenderit tenetur voluptates?
          Accusamus, alias amet deleniti ducimus ex facilis fuga fugit illum modi molestias non odit
          pariatur perspiciatis recusandae rerum similique sunt voluptatibus?
        </p>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Harum impedit neque nesciunt
          obcaecati officiis. Accusantium ad aperiam asperiores debitis dicta dolorem ducimus
          explicabo fugiat fugit impedit inventore magnam molestiae nam neque nihil odit officiis
          optio, provident quaerat recusandae repudiandae rerum sequi tempore unde vel vero
          voluptatibus! Accusamus esse explicabo nemo?
        </p>
      </div>
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
