import { GET_ALL_ORDERS } from './queries'
import { apolloClient } from '../../src/vue-apollo'

export const getOrders = async (where, sort) => {
  const { data } = await apolloClient.query({
    query: GET_ALL_ORDERS,
    variables: { where, sort },
  })
  return data['pedidos']
}
