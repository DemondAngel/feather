import { apolloClient } from '@/src/vue-apollo'
import { LOGIN, REGISTER } from './mutations'
import { GET_USER } from './queries'

export const login = async ({ password, identifier }) => {
  const { data } = await apolloClient.mutate({
    mutation: LOGIN,
    variables: { password, identifier },
  })
  return data['login']
}

export const register = async (username, email, password) => {
  const { data } = await apolloClient.mutate({
    mutation: REGISTER,
    variables: { username, email, password },
  })
  return data['register']
}

export const getUser = async id => {
  const { data } = await apolloClient.query({
    query: GET_USER,
    variables: { id },
  })
  return data['user']
}
