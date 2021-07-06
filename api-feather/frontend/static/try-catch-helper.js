export const tc = promise => {
  return promise
    .then(data => [data, null])
    .catch(error => {
      console.error('Error from wrapper')
      console.error(error)
      return [null, error]
    })
}
