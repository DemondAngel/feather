'use strict'

function returnError(form, fieldName = '') {
  let keys = Object.keys(form)
  let msg = ''
  for (let key of keys) {
    if (key.startsWith('$')) continue

    let flag = false
    let field = form[fieldName || key]

    let validators = Object.keys(field)

    // Here goes all validators
    for (let validator of validators) {
      if (validator.startsWith('$')) continue

      if (validator === 'required' && !field.required) {
        msg = `Este campo es requerido`
        flag = true
        break
      }

      if (validator === 'numeric' && !field.numeric) {
        msg = `Este campo debe contener solo números`
        flag = true
        break
      }

      if (validator === 'alpha' && !field.alpha) {
        msg = `Este campo debe contener solo letras sin espacios`
        flag = true
        break
      }

      if (validator === 'alphaNum' && !field.alphaNum) {
        msg = `Este campo solo puede contener letras y números sin espacios`
        flag = true
        break
      }

      if (validator === 'email' && !field.email) {
        msg = `Email inválido, por favor verifica`
        flag = true
        break
      }

      if (validator === 'minValue' && !field.minValue) {
        msg = `Solo son aceptados valores a partir de ${field.$params.minValue.min}`
        flag = true
        break
      }

      if (validator === 'minLength' && !field.minLength) {
        msg = `Debe haber un mínimo de ${field.$params.minLength.min} caracteres en este campo`
        flag = true
        break
      }

      if (validator === 'maxLength' && !field.maxLength) {
        msg = `Valor demasiado largo. No más de ${field.$params.maxLength.max} caracteres en este campo`
        flag = true
        break
      }

      if (validator === 'between' && !field.between) {
        msg = `Este campo debe tener una longitud mínima de ${field.$params.between.min} caractéres y máxima de ${field.$params.between.max} caractéres`
        flag = true
        break
      }

      if (validator === 'sameAsPassword' && !field.sameAsPassword) {
        msg = `Las contraseñas no coinciden, asegúrate de que sean iguales`
        flag = true
        break
      }

      if (validator === 'passwordValidation' && !field.passwordValidation) {
        msg = `Contraseña inválida. Asegúrate de crear una contraseña válida`
        flag = true
        break
      }
    }

    if (flag) break
  }

  return msg
}

module.exports = {
  returnError,
}
