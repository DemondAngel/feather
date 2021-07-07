<template>
  <div class="container">
    <div class="display-4 mt-4">Administrador</div>

    <ul class="nav nav-tabs mt-4">
      <li class="nav-item">
        <NuxtLink to="/admin" class="nav-link" exact>Perfil</NuxtLink>
      </li>
      <li class="nav-item">
        <NuxtLink to="/admin/products" class="nav-link">Productos</NuxtLink>
      </li>
      <li class="nav-item">
        <NuxtLink to="/admin/sales" class="nav-link">Ventas</NuxtLink>
      </li>
    </ul>

    <div class="my-4">
      <NuxtChild></NuxtChild>
    </div>
  </div>
</template>
