<template>
  <nav class="navbar navbar-light bg-light">
    <div class="container-fluid">
      <NuxtLink to="/" class="navbar-brand d-flex align-items-center">
        <img
          src="../assets/img/obio-icon.png"
          alt="Obio Icon"
          width="50"
          class="d-inline-block align-text-top"
        />
        <span class="navbar-brand fw-bold ms-2">Obio</span>
      </NuxtLink>
      <form class="d-flex">
        <input
          class="form-control me-2"
          type="search"
          placeholder="Buscar producto"
          aria-label="Search"
        />
        <button class="btn btn-outline-primary" type="submit">Buscar</button>
      </form>
    </div>
  </nav>
</template>
