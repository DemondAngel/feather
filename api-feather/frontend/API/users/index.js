import { apolloClient } from '@/src/vue-apollo'
import registerGql from './mutations/register.graphql'

export const login = () => {}

export const register = async (username, email, password) => {
  const { data } = await apolloClient.mutate({
    mutation: registerGql,
    variables: { username, email, password },
  })
  return data['register']
}
