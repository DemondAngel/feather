let sweet = window.$nuxt?.$swal
window.onNuxtReady(() => (sweet = window.$nuxt?.$swal))

export const SwalLoading = (title = 'Espere por favor...') => {
  sweet.fire({
    title,
    icon: 'info',
    allowOutsideClick: false,
    showCloseButton: false,
  })
  sweet.showLoading()
}

export const SwalConfirm = (question, text, confirmButtonText) => {
  return sweet.fire({
    title: question,
    html: text,
    icon: 'warning',
    showCancelButton: true,
    confirmButtonText,
  })
}

export const SwalError = (text, title = '¡Algo salió mal!') => {
  sweet.fire({
    title,
    html: text + ' Por favor intenta de nuevo.',
    icon: 'error',
  })
}
